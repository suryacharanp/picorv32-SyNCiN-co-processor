module adder_bf16(
        input_a,
        input_b,
		    adder_input_STB,
		    adder_BUSY,
        clk,
        rst,
		    output_sum,
        adder_output_STB,
        output_module_BUSY
		        );

  input     clk;
  input     rst;

  input     [15:0] input_a;

  input     [15:0] input_b;
  
  input     adder_input_STB;
  output    adder_BUSY;
  
  output    [15:0] output_sum;
  
  output    adder_output_STB;
  input     output_module_BUSY;

  //Intermediate registers
  reg       adder_output_STB_reg;
  reg       [31:0] output_sum_reg;
  reg       adder_BUSY_reg;

  reg       [3:0] adder_state;
  
  parameter get_a_and_b   = 4'd0,
            unpack        = 4'd1,
            special_cases = 4'd2,
            align         = 4'd3,
            add_0         = 4'd4,
            add_1         = 4'd5,
            normalise_1   = 4'd6,
            normalise_2   = 4'd7,
            round         = 4'd8,
            pack          = 4'd9,
            put_z         = 4'd10;

  reg       [15:0] a, b, z;
  reg       [9:0] a_m, b_m;
  reg       [7:0] z_m;
  reg       [9:0] a_e, b_e, z_e;
  reg       a_s, b_s, z_s;
  reg       guard, round_bit, sticky;
  reg       [27:0] sum;

  always @(posedge clk)
  begin

    case(adder_state)

      get_a_and_b: //Initial state wait for valid inputs and make BUSY = 0 because it has finished previous operation 
      begin
        adder_BUSY_reg <= 0;
        if (!(adder_BUSY_reg) && adder_input_STB) begin  //Once it gets valid input take that input and start processing.
          a <= {input_a};
		      b <= {input_b};
          adder_BUSY_reg <= 1; //Turn the BUSY signal on, BUSY = 1 because now it will be busy processing latched inputs and can no more take inputs even if it is valid. 
          adder_state <= unpack;
        end
      end


      unpack:
      begin
        a_m <= {a[6 : 0], 3'd0};
        b_m <= {b[6 : 0], 3'd0};
        a_e <= a[14 : 7] - 127;
        b_e <= b[14 : 7] - 127;
        a_s <= a[15];
        b_s <= b[15];
        adder_state <= special_cases;
      end

      special_cases:
      begin
        //if a is NaN or b is NaN return NaN 
        if ((a_e == 128 && a_m != 0) || (b_e == 128 && b_m != 0)) begin
          z[15] <= 1;
          z[14:7] <= 255;
          z[6] <= 1;
          z[5:0] <= 0;
          adder_state <= put_z;
        //if a is inf return inf
        end else if (a_e == 128) begin
          z[15] <= a_s;
          z[14:7] <= 255;
          z[6:0] <= 0;
          //if a is inf and signs don't match return nan
          if ((b_e == 128) && (a_s != b_s)) begin
              z[15] <= b_s;
              z[14:7] <= 255;
              z[6] <= 1;
              z[5:0] <= 0;
          end
          adder_state <= put_z;
        //if b is inf return inf
        end else if (b_e == 128) begin
          z[15] <= b_s;
          z[14:7] <= 255;
          z[6:0] <= 0;
          adder_state <= put_z;
        //if a is zero return b
        end else if ((($signed(a_e) == -127) && (a_m == 0)) && (($signed(b_e) == -127) && (b_m == 0))) begin
          z[15] <= a_s & b_s;
          z[14:7] <= b_e[7:0] + 127;
          z[6:0] <= b_m[9:3];
          adder_state <= put_z;
        //if a is zero return b
        end else if (($signed(a_e) == -127) && (a_m == 0)) begin
          z[15] <= b_s;
          z[14:7] <= b_e[7:0] + 127;
          z[6:0] <= b_m[9:3];
          adder_state <= put_z;
        //if b is zero return a
        end else if (($signed(b_e) == -127) && (b_m == 0)) begin
          z[15] <= a_s;
          z[14:7] <= a_e[7:0] + 127;
          z[6:0] <= a_m[9:3];
          adder_state <= put_z;
        end else begin
          //Denormalised Number
          if ($signed(a_e) == -127) begin
            a_e <= -126;
          end else begin
            a_m[9] <= 1;
          end
          //Denormalised Number
          if ($signed(b_e) == -127) begin
            b_e <= -126;
          end else begin
            b_m[9] <= 1;
          end
          adder_state <= align;
        end
      end

      align:
      begin
        if ($signed(a_e) > $signed(b_e)) begin
          b_e <= b_e + 1;
          b_m <= b_m >> 1;
          b_m[0] <= b_m[0] | b_m[1];
        end else if ($signed(a_e) < $signed(b_e)) begin
          a_e <= a_e + 1;
          a_m <= a_m >> 1;
          a_m[0] <= a_m[0] | a_m[1];
        end else begin
          adder_state <= add_0;
        end
      end

      add_0:
      begin
        z_e <= a_e;
        if (a_s == b_s) begin
          sum <= a_m + b_m;
          z_s <= a_s;
        end else begin
          if (a_m >= b_m) begin
            sum <= a_m - b_m;
            z_s <= a_s;
          end else begin
            sum <= b_m - a_m;
            z_s <= b_s;
          end
        end
        adder_state <= add_1;
      end

      add_1:
      begin
        if (sum[27]) begin
          z_m <= sum[27:4];
          guard <= sum[3];
          round_bit <= sum[2];
          sticky <= sum[1] | sum[0];
          z_e <= z_e + 1;
        end else begin
          z_m <= sum[26:3];
          guard <= sum[2];
          round_bit <= sum[1];
          sticky <= sum[0];
        end
        adder_state <= normalise_1;
      end

      normalise_1:
      begin
        if (z_m[7] == 0 && $signed(z_e) > -126) begin
          z_e <= z_e - 1;
          z_m <= z_m << 1;
          z_m[0] <= guard;
          guard <= round_bit;
          round_bit <= 0;
        end else begin
          adder_state <= normalise_2;
        end
      end

      normalise_2:
      begin
        if ($signed(z_e) < -126) begin
          z_e <= z_e + 1;
          z_m <= z_m >> 1;
          guard <= z_m[0];
          round_bit <= guard;
          sticky <= sticky | round_bit;
        end else begin
          adder_state <= round;
        end
      end

      round:
      begin
        if (guard && (round_bit | sticky | z_m[0])) begin
          z_m <= z_m + 1;
          if (z_m == 8'hff) begin
            z_e <=z_e + 1;
          end
        end
        adder_state <= pack;
      end

      pack:
      begin
        z[6 : 0] <= z_m[6:0];
        z[14 : 7] <= z_e[7:0] + 127;
        z[15] <= z_s;
        if ($signed(z_e) == -126 && z_m[7] == 0) begin
          z[14 : 7] <= 0;
        end
        if ($signed(z_e) == -126 && z_m[7:0] == 28'h0) begin
          z[15] <= 1'b0; // FIX SIGN BUG: -a + a = +0.
        end
        //if overflow occurs, return inf
        if ($signed(z_e) > 127) begin
          z[6 : 0] <= 0;
          z[14 : 7] <= 255;
          z[15] <= z_s;
        end
        adder_state <= put_z;
      end

      put_z: //Final state valid output is ready , make the output STB/VALID = 1, put valid output.
      begin
        adder_output_STB_reg <= 1;
        output_sum_reg <= z;
        if (adder_output_STB_reg && !(output_module_BUSY)) begin //Once output module is no more BUSY it lowers it's busy signal and output is then taken by next module.
          adder_output_STB_reg <= 0; //Output is no more valid.
          adder_state <= get_a_and_b; //Go back to initial state.
        end
      end

    endcase

    if (rst == 1) begin //At Active high reset, module is no more BUSY, go to initial state and wait for valid inputs. Input is don't care and output is don't care , so output VALID/STB = 0.
      adder_state <= get_a_and_b;
      adder_BUSY_reg <= 0; 
      adder_output_STB_reg <= 0;
    end

  end
  
  `ifdef SYNTHESIS_OFF //Purely combinational logic for debugging purpose, based on hexadecimal encoded states it will show named states in waveform 
  //see this register "adder_statename" in ASCII in dump
  reg [8*13:0] adder_statename;//Highest 13 Number of ASCII letters each 8 bits.
  always@* begin
    case (1'b1)
      (adder_state === get_a_and_b)  : adder_statename = "GET_A_AND_B";
      (adder_state === unpack)       : adder_statename = "UNPACK";
      (adder_state === special_cases): adder_statename = "SPECIAL_CASES";//13 ASCII letters
      (adder_state === align)        : adder_statename = "ALIGN";
      (adder_state === add_0)        : adder_statename = "ADD_0";
      (adder_state === add_1)        : adder_statename = "ADD_1";
      (adder_state === normalise_1)  : adder_statename = "NORMALIZE_1";
      (adder_state === normalise_2)  : adder_statename = "NORMALIZE_2";
      (adder_state === round)        : adder_statename = "ROUND";
      (adder_state === pack)         : adder_statename = "PACK";
      (adder_state === put_z)        : adder_statename = "PUT_Z";
    endcase
  end//always
  `endif

  //Continuous assignments
  
  assign adder_BUSY = adder_BUSY_reg;
  assign adder_output_STB = adder_output_STB_reg;
  assign output_sum = output_sum_reg[31:16];

endmodule:adder