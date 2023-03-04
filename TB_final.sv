// Code your testbench here
// or browse Examples
`define OPER_1 7'b0000001 
`define OPER_2 7'b0000010
`define OPER_3 7'b0000011
`define OPER_4 7'b0000100
`define OPER_5 7'b0000101

module TB;

    reg clk, rst;
    reg [31:5] inst;
    reg [63:0] rs1, rs2;
    reg  valid; 
    wire ready;
    
    reg [4:0] destination;
    reg [31:0] rs1_part1, rs1_part2;
    reg [31:0] rs2_part1, rs2_part2;
    
    //Counter
    integer n0,n1,n;
    
    //Input
    reg [31:0] tp0;
    reg [31:0] td0;
    reg [31:0] tp1;
    reg [31:0] td1;
    
    //registers
    reg [31:0] GABAreuptake,GABAreuptake_new;
    reg [31:0] Inh,Inh_new;
    reg [31:0] C,C_new;
    reg [31:0] D,D_new;
    reg [31:0] W,W_new;
    reg [31:0] Prel,p_rel_new;;
    reg [31:0] Z,Z_new;
    reg [31:0] Y,Y_new;
    reg [31:0] I_syn_new;
    reg [31:0] I_syn;
    reg [31:0] Cl;
    reg [31:0] gamma;
    reg [31:0] gamma_new;
  reg [31:0] receptor_g;
  reg [31:0] receptor_g_new;
  reg [31:0] alpha;
  reg [31:0] alpha_new;
  reg [31:0] beta;
  reg [31:0] beta_new;
  reg [31:0] rel;
    
   
    
    //Intermediate registers
    reg [31:0] reg_a;
    reg [31:0] reg_b;
    reg [31:0] reg_c;
    reg [31:0] reg_d;
    reg [31:0] reg_e;
    reg [31:0] reg_f;
    reg [31:0] reg_g_a;
    reg [31:0] reg_g;
    reg [31:0] reg_h;
    reg [31:0] reg_i;
    reg [31:0] reg_t;
    reg [31:0] reg_j;
    reg [31:0] reg_k;
  
  reg [31:0] reg_l;
  reg [31:0] reg_m;
  reg [31:0] reg_n;
  reg [31:0] reg_o;
  reg [31:0] reg_p;
  reg [31:0] reg_q;
  reg [31:0] reg_r;
  reg [31:0] reg_s;
  reg [31:0] reg_s1;
  reg [31:0] reg_s2;
  reg [31:0] reg_s3;
  reg [31:0] reg_s4;
  reg [31:0] reg_s5;
  reg [31:0] reg_s6;
  reg [31:0] reg_s7;
  reg [31:0] reg_s8;
  reg [31:0] reg_s9;
  reg [31:0] reg_s10;
  reg [31:0] reg_s11;
  reg [31:0] reg_s12;
  reg [31:0] reg_s13;
  reg [31:0] reg_s14;
  reg [31:0] reg_s15;
  reg [31:0] reg_u;
  reg [31:0] reg_v; 
  reg [31:0] reg_w; 
  reg [31:0] reg_x; 
  reg [31:0] reg_m1;
   
    
    //constants
    reg [31:0] const_m1bytr;
    reg [31:0] const1;
    reg [31:0] const0;
    reg [31:0] const_del;
    reg [31:0] constm1bytinh;
    reg [31:0] constm1bytc;
    reg [31:0] const1bytc;
    reg [31:0] constm1bytd;
    reg [31:0] const1bytd;
    reg [31:0] const_m1byt;
    reg [31:0] const_neg1;
    reg [31:0] time_const;
    reg [31:0] constk0;
    reg [31:0] const_1_1;
    reg [31:0] const_neg_0_00001;
    reg [31:0] const_neg_0_00007;
    reg [31:0] const0_5;
    reg [31:0] GABA;
    reg [31:0] const_5_0;
    reg [31:0] const__neg_5_0;
    reg [31:0] const_cl;
    reg [31:0] const_neg_1;
  
  reg [31:0] const_neg_1000;
  reg [31:0] const_1000;
  reg [31:0] const_0_0001;
  reg [31:0] const_neg_0_5;
  reg [31:0] const_neg_100;
  reg [31:0] const_0_00001;
  reg [31:0] const_0_25;
  reg [31:0] const_2;
  reg [31:0] const_1000000; 
  reg [31:0] const_2_1;
  reg [31:0] const_4;
 ///////////////////////////////////////////////////////////////////////////////
    
    rocc_accel #( .INST_WIDTH(32), .DATA_WIDTH(64))
    rocc_accel_inst 
    (
       .clk(clk),
       .rst(rst),
       .inst(inst),
       .rs1(rs1),
       .rs2(rs2),
       .valid(valid),
       .ready(ready)  
    );
        
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        n0 = 0;
        n1 = 0;
        n = 0;
        //////////
        
        tp0 = 32'b0;
        td0 = 32'b0;
        tp1 = 32'hf000000f;
        td1 = 32'hf000000f;
        
        
        ///////////////////
        GABAreuptake = 32'b0;
        GABAreuptake_new = 32'b0;
        Inh = 32'b0;
        Inh_new = 32'b0;
        C = 32'b0;
        C_new = 32'b0;
        D = 32'b0;
        D_new = 32'b0;
        W = 32'b0;
        W_new = 32'b0;
        Prel = 32'b0;
        p_rel_new = 32'b0;
        Z = 32'b0;
        Z_new = 32'b0;
        Y = 32'b0;
        Y_new = 32'b0;
        I_syn_new = 32'b0;
        I_syn = 32'b0;
        Cl = 32'b0;
      
       alpha = 32'b00110011110101101011111110010101; //10^-7
       alpha_new = 32'b0;
       beta = 32'b00110011110101101011111110010101; //10^-7
       beta_new = 32'b0;
       rel = 32'b0;
      gamma = 32'b00110011110101101011111110010101; //10^-7
      gamma_new = 32'b0;
      receptor_g = 32'b0;
      receptor_g_new = 32'b0;
      
      
        ///////////////////
        reg_a = 32'b0;
        reg_b = 32'b0;
        reg_c = 32'b0;
        reg_d = 32'b0;
        reg_e = 32'b0;
        reg_f = 32'b0;
        reg_g_a = 32'b0;
        reg_g = 32'b0;
        reg_h = 32'b0;
        reg_i = 32'b0;
        reg_t = 32'b0;
        reg_j = 32'b0;
        reg_k = 32'b0;
      
      reg_l = 32'b0;
       reg_m = 32'b0;
       reg_n = 32'b0;
       reg_o = 32'b0;
      reg_p = 32'b0;
      reg_q = 32'b0;
       reg_r = 32'b0;
       reg_s = 32'b0;
       reg_s1 = 32'b0;
       reg_s2 = 32'b0;
       reg_s3 = 32'b0;
       reg_s4 = 32'b0;
       reg_s5 = 32'b0;
       reg_s5 = 32'b0;
       reg_s6 = 32'b0;
       reg_s7 = 32'b0;
       reg_s8 = 32'b0;
       reg_s9 = 32'b0;
       reg_s10 = 32'b0;
       reg_s11 = 32'b0;
       reg_s12 = 32'b0;
       reg_s13 = 32'b0;
       reg_s14 = 32'b0;
       reg_s15 = 32'b0;
       reg_u = 32'b0;
       reg_v = 32'b0;
       reg_w = 32'b0;
       reg_x = 32'b0;
       reg_m1 = 32'b0;
        
        
        ///////////////////
        const_m1bytr = 32'b11000000001000000000000000000000; //-2.5
        const1 = 32'b00111111100000000000000000000000; //1.0
        const0 = 32'b0; //0.0
        const_del = 32'b00111010100000110001001001101110; //0.001
        constm1bytinh = 32'b11000001001000000000000000000000; //-10
        constm1bytc = 32'b11000001001000000000000000000000; //-10
        const1bytc = 32'b01000001001000000000000000000000; //10
        constm1bytd = 32'b11000010010010000000000000000000; //-50
        const1bytd = 32'b01000010010010000000000000000000; //50
        const_m1byt = 32'b11000001001000000000000000000000; //-10
        const_neg1 = 32'b10111111100000000000000000000000; //-1
        time_const = 32'b00111101110011001100110011001100; //0.1
        constk0 = 32'b0; //0.0
        const_1_1 = 32'b00111111100011001100110011001100;//1.1
        const_neg_0_00001 = 32'b10110111001001111100010110101100;
        const_neg_0_00007 = 32'b10111000100100101100110011110110;
        const_5_0 = 32'b01000000101000000000000000000000;
        const__neg_5_0 = 32'b11000000101000000000000000000000;
        GABA = 32'b01000000100000000000000000000000;
        const0_5 = 32'b00111111000000000000000000000000; //0.5
        const_cl = 32'b01000011010010000000000000000000; //200
      
       const_neg_1000 = 32'b11000100011110100000000000000000; //1000
       const_1000 = 32'b01000100011110100000000000000000; //1000
      const_0_0001 = 32'b00111000110100011011011100010111; //0.0001
      const_neg_0_5 = 32'b10111111000000000000000000000000; //-0.5
      const_neg_100 = 32'b11000010110010000000000000000000; //-100
      const_0_00001 = 32'b00110111001001111100010110101100; //0.00001
      const_0_25 = 32'b00111110100000000000000000000000;
      const_2 = 32'b01000000000000000000000000000000;
      const_1000000 = 32'b01000010110010000000000000000000;//100
      const_neg_1 = 32'b10111111100000000000000000000000; //-1
      const_2_1 = 32'b01000000000001100110011001100110; //2.1
      const_4 = 32'b01000000100000000000000000000000; //4
    end
      
    initial begin
    
    
    for(n=0; n<4; n=n+1)
    begin  
      
    
    for(n0=0; n0<990; n0=n0+1)
    begin   
      
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { GABAreuptake, const_m1bytr};
      rs2 = { GABA, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_a = rocc_accel_inst.reg_inst.Registers[destination];

      //
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { GABAreuptake, const1};
      rs2 = { const_del, reg_a};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      GABAreuptake_new = rocc_accel_inst.reg_inst.Registers[destination];
      ////////////////////////////////////////////////////////////////////
        
     
      ///////////////////////////////////////////////////////////////////////////
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00011;
      inst = {OPER_3, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { tp0, tp0};
      rs2 = { tp0, tp0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_c = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset(); 
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00100;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { constm1bytc, C};
      rs2 = { const1bytc, reg_c};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_d = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00101;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { C, const1};
      rs2 = { const_del, reg_d};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      C_new = rocc_accel_inst.reg_inst.Registers[destination];
       give_reset();  
       
       
       
       
       @(posedge clk iff ready === 1 && rst === 0);
       valid = 1;
       destination = 5'b00110;
       inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
       rs1 = { Inh, constm1bytinh};
       rs2 = { GABAreuptake, C};
       @(posedge clk);
       wait(ready === 0);
       //$display("operation ongoing");
       @(posedge clk);
       wait(ready === 1);
       //@(posedge clk);
       //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
       reg_b = rocc_accel_inst.reg_inst.Registers[destination];
       
         
       give_reset();  
       
       
       
       @(posedge clk iff ready === 1 && rst === 0);
       valid = 1;
       destination = 5'b00111;
       inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
       rs1 = { Inh, const1};
       rs2 = { const_del, reg_b};
       @(posedge clk);
       wait(ready === 0);
       //$display("operation ongoing");
       @(posedge clk);
       wait(ready === 1);
       //@(posedge clk);
       //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
       Inh_new = rocc_accel_inst.reg_inst.Registers[destination];
      
      ///////////////////////////////////////////////////////////////////////////
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {OPER_3, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { td0, td0};
      rs2 = { td0, td0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_e = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset(); 
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { constm1bytd, D};
      rs2 = { const1bytd, reg_e};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_f = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { D, const1};
      rs2 = { const_del, reg_f};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      D_new = rocc_accel_inst.reg_inst.Registers[destination];
      ///////////////////////////////////////////////////////////////////////////
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01011;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { C, D};
      rs2 = { const0, const0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_g_a = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01100;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { reg_g_a, Prel};
      rs2 = { const0, const0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_g = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01101;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { W, const1};
      rs2 = { const_del, reg_g};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      W_new = rocc_accel_inst.reg_inst.Registers[destination];
      //////////////////////////////////////////////////////////
        
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { Z, const_m1byt};
      rs2 = { reg_c, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_h = rocc_accel_inst.reg_inst.Registers[destination]; //[op1(Z,-1/t,const1,c)]
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { Z, const1};
      rs2 = { const_del, reg_h};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      Z_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(Z,const1,del,h)]
      /////////////////////////////////////////////////////////////////////////////////
      
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const1, const1};
      rs2 = { const_del, const_neg1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i = rocc_accel_inst.reg_inst.Registers[destination];//op1(const1,const1,const-1,del)
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_del, Z};
      rs2 = { reg_i, Y};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      Y_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(del,Z,i,Y)
      /////////////////////////////////////////////////////////////////////////////////////
    
      give_reset();
      
         
    
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
            rs1 = { time_const, Y};
            rs2 = { const0, const0};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 2");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
            reg_t = rocc_accel_inst.reg_inst.Registers[destination];//op1(time_const,Y,0,0)
            
        
            give_reset();
            
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00010;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
            rs1 = { reg_t, W};
            rs2 = { reg_t, constk0};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
            I_syn_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(time_const*Y,W,time_const*Y,kO)
            
            
    
      
      /////////////////////////////////////////////////////////////////////////
      
    
         
       give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { Inh, const1};
      rs2 = { const_neg_0_00001, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_j = rocc_accel_inst.reg_inst.Registers[destination];//[op1(Inh,const1,-0.00001,const1)]
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_neg_0_00007, reg_j};
      rs2 = { const_1_1, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_k = rocc_accel_inst.reg_inst.Registers[destination];//[op2(-0.00007,j,1.1,const1)]
      
        
      give_reset();  
    
    
       @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00011;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_5_0, const1};
      rs2 = { const__neg_5_0, reg_k};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      p_rel_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(0.25,const1,-0.25,k)]
    
      
     
      if($bitstoshortreal(p_rel_new)>0.5)
        begin
          p_rel_new = const0_5;
        end
        
      
     else if($bitstoshortreal(p_rel_new)<0)
        begin
          p_rel_new = const0;
        end
      
    
    /////////////////////////////////////////////////////////
      
       give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_cl, I_syn};
      rs2 = { const1, const0};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      Cl = rocc_accel_inst.reg_inst.Registers[destination];//200.Isyn
      
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
      
       give_reset();
  
      
         
    
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { gamma, const_neg_1000};
      rs2 = { Cl, const_1000};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 2");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_l = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, -1000, cl, 1000)
            
         give_reset();
      
         
    
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { gamma, const1};
      rs2 = { const_del, reg_l};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 2");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      gamma_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l)
            
////////////////////////////////////////////////////////////////////////////////
              give_reset();
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_g, const_neg_1};
      rs2 = { const1, gamma};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 2");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_m = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l)
      
         give_reset();
                  @(posedge clk iff ready === 1 && rst === 0);
                  valid = 1;
                  destination = 5'b00001;
                  inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
            rs1 = { const_1000000, reg_m};
            rs2 = { const1, 32'b0};
                  @(posedge clk);
                  wait(ready === 0);
                  //$display("operation ongoing check 2");
                  @(posedge clk);
                  wait(ready === 1);
                  //@(posedge clk);
                  //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
            reg_m1 = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l)
            
            give_reset();
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_g, const1};
      rs2 = { const_del, reg_m1};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 2");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      receptor_g_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l
      
  
   
/////////////////////////////////////////////////////////////////////////////
      
       
      give_reset();
           
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_neg_1000, alpha};
      //rs2 = { const_neg1, rel};
      rs2 = { const_neg1, 32'b0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_n = rocc_accel_inst.reg_inst.Registers[destination];
      
            
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_1000, Cl};
      rs2 = { const1, const_0_0001};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_o = rocc_accel_inst.reg_inst.Registers[destination];
      
       
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const1, reg_n};
      rs2 = { reg_o, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_p = rocc_accel_inst.reg_inst.Registers[destination];
      
       
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { alpha, const1};
      rs2 = { const_del, reg_p};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      alpha_new = rocc_accel_inst.reg_inst.Registers[destination];
      ////////////////////////////////////////////////////////////////////////////
      
       
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { beta, const_neg_100};
      //rs2 = { const1, rel};
      rs2 = { const1, 32'b0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_q = rocc_accel_inst.reg_inst.Registers[destination];
      
                    
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { reg_q, const1};
      rs2 = { const1, const_0_00001};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_r = rocc_accel_inst.reg_inst.Registers[destination];
      
       
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { beta, const1};
      rs2 = { const_del, reg_r};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      @(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      beta_new = rocc_accel_inst.reg_inst.Registers[destination];
      
      ////////////////////////////////////////////////////////////////////////////
      
      /////////////////////////////////////////////
           give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_5, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const1, alpha};
      rs2 = { const1, beta};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_s = rocc_accel_inst.reg_inst.Registers[destination]; //a+b
        
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { beta, reg_s};
      rs2 = { 32'b0, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_s1 = rocc_accel_inst.reg_inst.Registers[destination]; //b/(a+b)
        
            give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_2_1, alpha};
      rs2 = { const1, 32'b0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_s2 = rocc_accel_inst.reg_inst.Registers[destination]; //2.1a
      
            give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { reg_s1, reg_s2};
      rs2 = { 32'b0, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_s3 = rocc_accel_inst.reg_inst.Registers[destination]; //2.1ab/(a+b)
      
            give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { beta, const_4};
      rs2 = { 32'b0, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_s4 = rocc_accel_inst.reg_inst.Registers[destination]; //b/4
      
      give_reset();
 
 @(posedge clk iff ready === 1 && rst === 0);
 valid = 1;
 destination = 5'b00001;
 inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
 rs1 = { alpha, const_4};
 rs2 = { 32'b0, const1};
 @(posedge clk);
 wait(ready === 0);
 //$display("operation ongoing");
 @(posedge clk);
 wait(ready === 1);
 //@(posedge clk);
 //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
 reg_s5 = rocc_accel_inst.reg_inst.Registers[destination]; //4a
 
      give_reset();
 
 @(posedge clk iff ready === 1 && rst === 0);
 valid = 1;
 destination = 5'b00001;
 inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
 rs1 = { beta, reg_s5};
 rs2 = { 32'b0, const1};
 @(posedge clk);
 wait(ready === 0);
 //$display("operation ongoing");
 @(posedge clk);
 wait(ready === 1);
 //@(posedge clk);
 //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
 reg_s6 = rocc_accel_inst.reg_inst.Registers[destination]; //b/4a
 
          give_reset();
 
 @(posedge clk iff ready === 1 && rst === 0);
 valid = 1;
 destination = 5'b00001;
 inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
 rs1 = { reg_s4, reg_s4};
 rs2 = { 32'b0, const1};
 @(posedge clk);
 wait(ready === 0);
 //$display("operation ongoing");
 @(posedge clk);
 wait(ready === 1);
 //@(posedge clk);
 //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
 reg_s7 = rocc_accel_inst.reg_inst.Registers[destination]; //(b/4)^2
         
         give_reset();
 
 @(posedge clk iff ready === 1 && rst === 0);
 valid = 1;
 destination = 5'b00001;
 inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
 rs1 = { reg_s7, reg_s4};
 rs2 = { 32'b0, const1};
 @(posedge clk);
 wait(ready === 0);
 //$display("operation ongoing");
 @(posedge clk);
 wait(ready === 1);
 //@(posedge clk);
 //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
 reg_s8 = rocc_accel_inst.reg_inst.Registers[destination]; //(b/4)^3
 
         give_reset();
 
 @(posedge clk iff ready === 1 && rst === 0);
 valid = 1;
 destination = 5'b00001;
 inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
 rs1 = { reg_s8, const_neg_1};
 rs2 = { reg_s6, reg_s6};
 @(posedge clk);
 wait(ready === 0);
 //$display("operation ongoing");
 @(posedge clk);
 wait(ready === 1);
 //@(posedge clk);
 //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
 reg_s9 = rocc_accel_inst.reg_inst.Registers[destination]; //-(b/4)^3  + (b/4a)^2
 
         give_reset();
 
 @(posedge clk iff ready === 1 && rst === 0);
 valid = 1;
 destination = 5'b00001;
 inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
 rs1 = { reg_s9, const1};
 rs2 = { reg_s6, const_neg_1};
 @(posedge clk);
 wait(ready === 0);
 //$display("operation ongoing");
 @(posedge clk);
 wait(ready === 1);
 //@(posedge clk);
 //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
 reg_s10 = rocc_accel_inst.reg_inst.Registers[destination]; //-(b/4)^3  + (b/4a)^2 - (b/4a)
 
         give_reset();
 
 @(posedge clk iff ready === 1 && rst === 0);
 valid = 1;
 destination = 5'b00001;
 inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
 rs1 = { reg_s10, const1};
 rs2 = { const1, const1};
 @(posedge clk);
 wait(ready === 0);
 //$display("operation ongoing");
 @(posedge clk);
 wait(ready === 1);
 //@(posedge clk);
 //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
 reg_s12 = rocc_accel_inst.reg_inst.Registers[destination]; //-(b/4)^3  + (b/4a)^2 - (b/4a) +1
 
         
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { reg_s12, reg_s3};
      rs2 = { 32'b0, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      rel = rocc_accel_inst.reg_inst.Registers[destination];
        
      give_reset();
      
      
      
      
      GABAreuptake = GABAreuptake_new;
      Inh = Inh_new;
      C = C_new;
      D = D_new;
      W = W_new;
      Prel = p_rel_new; 
      Z = Z_new;
      Y = Y_new;
      I_syn = I_syn_new;
      alpha = alpha_new;
      beta = beta_new;
      gamma = gamma_new;
      receptor_g = receptor_g_new;
    
      give_reset();
      
      $display("GABAreuptake = %0.12f , C = %0.12f , Inh = %0.12f , D = %0.12f , Isyn = %0.12f , Cl = %0.12f, rel = %0.12f, alpha = %0.12f, beta = %0.12f, gamma = %0.12f, receptor_g = %0.12f, n=%d ,", $bitstoshortreal(GABAreuptake), $bitstoshortreal(C), $bitstoshortreal(Inh), $bitstoshortreal(D), $bitstoshortreal(I_syn),$bitstoshortreal(Cl),$bitstoshortreal(rel),$bitstoshortreal(alpha),$bitstoshortreal(beta), $bitstoshortreal(gamma), $bitstoshortreal(receptor_g),n );
      // $display("%0.12f", $bitstoshortreal(beta));
      
      give_reset();
      
    end ////////////end for loop with n0
      
      
      
      
    for(n1=0; n1<10;n1=n1+1)
    begin   
      
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { GABAreuptake, const_m1bytr};
      rs2 = { GABA, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_a = rocc_accel_inst.reg_inst.Registers[destination];
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { GABAreuptake, const1};
      rs2 = { const_del, reg_a};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      GABAreuptake_new = rocc_accel_inst.reg_inst.Registers[destination];
      ////////////////////////////////////////////////////////////////////
        
     
      ///////////////////////////////////////////////////////////////////////////
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00011;
      inst = {OPER_3, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { tp1, tp1};
      rs2 = { tp1, tp1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_c = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset(); 
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00100;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { constm1bytc, C};
      rs2 = { const1bytc, reg_c};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_d = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00101;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { C, const1};
      rs2 = { const_del, reg_d};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      C_new = rocc_accel_inst.reg_inst.Registers[destination];
       give_reset();  
       
       
       
       @(posedge clk iff ready === 1 && rst === 0);
       valid = 1;
       destination = 5'b00110;
       inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
       rs1 = { Inh, constm1bytinh};
       rs2 = { GABAreuptake, C};
       @(posedge clk);
       wait(ready === 0);
       //$display("operation ongoing");
       @(posedge clk);
       wait(ready === 1);
       //@(posedge clk);
       //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
       reg_b = rocc_accel_inst.reg_inst.Registers[destination];
       
         
       give_reset();  
       
       
       
       @(posedge clk iff ready === 1 && rst === 0);
       valid = 1;
       destination = 5'b00111;
       inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
       rs1 = { Inh, const1};
       rs2 = { const_del, reg_b};
       @(posedge clk);
       wait(ready === 0);
       //$display("operation ongoing");
       @(posedge clk);
       wait(ready === 1);
       //@(posedge clk);
       //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
       Inh_new = rocc_accel_inst.reg_inst.Registers[destination];
      ///////////////////////////////////////////////////////////////////////////
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {OPER_3, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { td1, td1};
      rs2 = { td1, td1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("(reg_e)Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_e = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset(); 
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { constm1bytd, D};
      rs2 = { const1bytd, reg_e};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("(reg_f)Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_f = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { D, const1};
      rs2 = { const_del, reg_f};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("(D_new)Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      D_new = rocc_accel_inst.reg_inst.Registers[destination];
      ///////////////////////////////////////////////////////////////////////////
        
      give_reset();  
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01011;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { C, D};
      rs2 = { const0, const0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_g_a = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();
      
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01100;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { reg_g_a, Prel};
      rs2 = { const0, const0};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_g = rocc_accel_inst.reg_inst.Registers[destination];
      
        
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01101;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { W, const1};
      rs2 = { const_del, reg_g};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      W_new = rocc_accel_inst.reg_inst.Registers[destination];
      //////////////////////////////////////////////////////////
        
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { Z, const_m1byt};
      rs2 = { reg_c, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_h = rocc_accel_inst.reg_inst.Registers[destination]; //[op1(Z,-1/t,const1,c)]
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { Z, const1};
      rs2 = { const_del, reg_h};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      Z_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(Z,const1,del,h)]
      /////////////////////////////////////////////////////////////////////////////////
      
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const1, const1};
      rs2 = { const_del, const_neg1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i = rocc_accel_inst.reg_inst.Registers[destination];//op1(const1,const1,const-1,del)
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_del, Z};
      rs2 = { reg_i, Y};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      Y_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(del,Z,i,Y)
      /////////////////////////////////////////////////////////////////////////////////////
    
      give_reset();
      
      
            constk0 = I_syn;/////////////
            
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
            rs1 = { time_const, Y};
            rs2 = { const0, const0};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 1");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
            reg_t = rocc_accel_inst.reg_inst.Registers[destination];//op1(time_const,Y,0,0)
        
            give_reset();
    
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00010;
            constk0 = I_syn;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
            rs1 = { reg_t, W};
            rs2 = { reg_t, constk0};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
            I_syn_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(time_const*Y,W,time_const*Y,kO)
            
            give_reset();
        
    
      
      /////////////////////////////////////////////////////////////////////////
      
      
       give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { Inh, const1};
      rs2 = { const_neg_0_00001, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_j = rocc_accel_inst.reg_inst.Registers[destination];//[op1(Inh,const1,-0.00001,const1)]
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_neg_0_00007, reg_j};
      rs2 = { const_1_1, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_k = rocc_accel_inst.reg_inst.Registers[destination];//[op2(-0.00007,j,1.1,const1)]
      
        
      give_reset();  
    
    
       @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00011;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_5_0, const1};
      rs2 = { const__neg_5_0, reg_k};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      p_rel_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(0.25,const1,-0.25,k)]
    
      
      if($bitstoshortreal(p_rel_new)>0.5)
        begin
          p_rel_new = const0_5;
        end
        
      else if($bitstoshortreal(p_rel_new)<0)
        begin
          p_rel_new = const0;
        end
    
    ////////////////////////////////////////////////
  
       give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
      inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_cl, I_syn};
      rs2 = { const1, const0};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      Cl = rocc_accel_inst.reg_inst.Registers[destination];//200.Isyn
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      
       give_reset();
         
    
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { gamma, const_neg_1000};
      rs2 = { Cl, const_1000};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 2");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_l = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, -1000, cl, 1000)
            
         give_reset();
      
         
    
            @(posedge clk iff ready === 1 && rst === 0);
            valid = 1;
            destination = 5'b00001;
            inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { gamma, const1};
      rs2 = { const_del, reg_l};
            @(posedge clk);
            wait(ready === 0);
            //$display("operation ongoing check 2");
            @(posedge clk);
            wait(ready === 1);
            //@(posedge clk);
            //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      gamma_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l)
      
////////////////////////////////////////////////////////////////////////////     
        give_reset();
                    @(posedge clk iff ready === 1 && rst === 0);
                    valid = 1;
                    destination = 5'b00001;
                    inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
              rs1 = { receptor_g, const_neg_1};
              rs2 = { const1, gamma};
                    @(posedge clk);
                    wait(ready === 0);
                    //$display("operation ongoing check 2");
                    @(posedge clk);
                    wait(ready === 1);
                    //@(posedge clk);
                    //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
              reg_m = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l)
              
                 give_reset();
                          @(posedge clk iff ready === 1 && rst === 0);
                          valid = 1;
                          destination = 5'b00001;
                          inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
                    rs1 = { const_1000000, reg_m};
                    rs2 = { const1, 32'b0};
                          @(posedge clk);
                          wait(ready === 0);
                          //$display("operation ongoing check 2");
                          @(posedge clk);
                          wait(ready === 1);
                          //@(posedge clk);
                          //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
                    reg_m1 = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l)
                    
                    give_reset();
                    @(posedge clk iff ready === 1 && rst === 0);
                    valid = 1;
                    destination = 5'b00001;
                    inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
              rs1 = { receptor_g, const1};
              rs2 = { const_del, reg_m1};
                    @(posedge clk);
                    wait(ready === 0);
                    //$display("operation ongoing check 2");
                    @(posedge clk);
                    wait(ready === 1);
                    //@(posedge clk);
                    //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
              receptor_g_new = rocc_accel_inst.reg_inst.Registers[destination];//op1(gamma, 1, del, reg_l
     
////////////////////////////////////////////////////////////////////////////////
      
       give_reset();
          
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { const_neg_1000, alpha};
     //rs2 = { const_neg1, rel};
     rs2 = { const_neg1, 32'b0};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     @(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_n = rocc_accel_inst.reg_inst.Registers[destination];
     
           
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { const_1000, Cl};
     rs2 = { const1, const_0_0001};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     @(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_o = rocc_accel_inst.reg_inst.Registers[destination];
     
      
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { const1, reg_n};
     rs2 = { reg_o, const1};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     @(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_p = rocc_accel_inst.reg_inst.Registers[destination];
     
      
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { alpha, const1};
     rs2 = { const_del, reg_p};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     @(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     alpha_new = rocc_accel_inst.reg_inst.Registers[destination];
     ////////////////////////////////////////////////////////////////////////////
     
      
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { beta, const_neg_100};
     //rs2 = { const1, rel};
     rs2 = { const1, 32'b0};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     @(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_q = rocc_accel_inst.reg_inst.Registers[destination];
     
                   
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { reg_q, const1};
     rs2 = { const1, const_0_00001};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     @(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_r = rocc_accel_inst.reg_inst.Registers[destination];
     
      
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { beta, const1};
     rs2 = { const_del, reg_r};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     @(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     beta_new = rocc_accel_inst.reg_inst.Registers[destination];
     
     ////////////////////////////////////////////////////////////////////////////
     
     /////////////////////////////////////////////
     
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_5, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { const1, alpha};
     rs2 = { const1, beta};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_s = rocc_accel_inst.reg_inst.Registers[destination]; //a+b
       
     give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { beta, reg_s};
     rs2 = { 32'b0, const1};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_s1 = rocc_accel_inst.reg_inst.Registers[destination]; //b/(a+b)
       
           give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { const_2_1, alpha};
     rs2 = { const1, 32'b0};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_s2 = rocc_accel_inst.reg_inst.Registers[destination]; //2.1a
     
           give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { reg_s1, reg_s2};
     rs2 = { 32'b0, const1};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_s3 = rocc_accel_inst.reg_inst.Registers[destination]; //2.1ab/(a+b)
     
           give_reset();
     
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { beta, const_4};
     rs2 = { 32'b0, const1};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     reg_s4 = rocc_accel_inst.reg_inst.Registers[destination]; //b/4
     
     give_reset();

@(posedge clk iff ready === 1 && rst === 0);
valid = 1;
destination = 5'b00001;
inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
rs1 = { alpha, const_4};
rs2 = { 32'b0, const1};
@(posedge clk);
wait(ready === 0);
//$display("operation ongoing");
@(posedge clk);
wait(ready === 1);
//@(posedge clk);
//$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
reg_s5 = rocc_accel_inst.reg_inst.Registers[destination]; //4a

     give_reset();

@(posedge clk iff ready === 1 && rst === 0);
valid = 1;
destination = 5'b00001;
inst = {OPER_2, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
rs1 = { beta, reg_s5};
rs2 = { 32'b0, const1};
@(posedge clk);
wait(ready === 0);
//$display("operation ongoing");
@(posedge clk);
wait(ready === 1);
//@(posedge clk);
//$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
reg_s6 = rocc_accel_inst.reg_inst.Registers[destination]; //b/4a

         give_reset();

@(posedge clk iff ready === 1 && rst === 0);
valid = 1;
destination = 5'b00001;
inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
rs1 = { reg_s4, reg_s4};
rs2 = { 32'b0, const1};
@(posedge clk);
wait(ready === 0);
//$display("operation ongoing");
@(posedge clk);
wait(ready === 1);
//@(posedge clk);
//$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
reg_s7 = rocc_accel_inst.reg_inst.Registers[destination]; //(b/4)^2
        
        give_reset();

@(posedge clk iff ready === 1 && rst === 0);
valid = 1;
destination = 5'b00001;
inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
rs1 = { reg_s7, reg_s4};
rs2 = { 32'b0, const1};
@(posedge clk);
wait(ready === 0);
//$display("operation ongoing");
@(posedge clk);
wait(ready === 1);
//@(posedge clk);
//$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
reg_s8 = rocc_accel_inst.reg_inst.Registers[destination]; //(b/4)^3

        give_reset();

@(posedge clk iff ready === 1 && rst === 0);
valid = 1;
destination = 5'b00001;
inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
rs1 = { reg_s8, const_neg_1};
rs2 = { reg_s6, reg_s6};
@(posedge clk);
wait(ready === 0);
//$display("operation ongoing");
@(posedge clk);
wait(ready === 1);
//@(posedge clk);
//$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
reg_s9 = rocc_accel_inst.reg_inst.Registers[destination]; //-(b/4)^3  + (b/4a)^2

        give_reset();

@(posedge clk iff ready === 1 && rst === 0);
valid = 1;
destination = 5'b00001;
inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
rs1 = { reg_s9, const1};
rs2 = { reg_s6, const_neg_1};
@(posedge clk);
wait(ready === 0);
//$display("operation ongoing");
@(posedge clk);
wait(ready === 1);
//@(posedge clk);
//$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
reg_s10 = rocc_accel_inst.reg_inst.Registers[destination]; //-(b/4)^3  + (b/4a)^2 - (b/4a)

        give_reset();

@(posedge clk iff ready === 1 && rst === 0);
valid = 1;
destination = 5'b00001;
inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
rs1 = { reg_s10, const1};
rs2 = { const1, const1};
@(posedge clk);
wait(ready === 0);
//$display("operation ongoing");
@(posedge clk);
wait(ready === 1);
//@(posedge clk);
//$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
reg_s12 = rocc_accel_inst.reg_inst.Registers[destination]; //-(b/4)^3  + (b/4a)^2 - (b/4a) +1

        
     give_reset();
     
     @(posedge clk iff ready === 1 && rst === 0);
     valid = 1;
     destination = 5'b00001;
     inst = {OPER_1, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
     rs1 = { reg_s12, reg_s3};
     rs2 = { 32'b0, const1};
     @(posedge clk);
     wait(ready === 0);
     //$display("operation ongoing");
     @(posedge clk);
     wait(ready === 1);
     //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
     rel = rocc_accel_inst.reg_inst.Registers[destination];
       
   
    
      give_reset();
      
      
      GABAreuptake = GABAreuptake_new;
      Inh = Inh_new;
      C = C_new;
      D = D_new;
      W = W_new;
      Prel = p_rel_new; 
      Z = Z_new;
      Y = Y_new;
      I_syn = I_syn_new;
      gamma = gamma_new;
      receptor_g = receptor_g_new;
   
      
      give_reset();
      
      // $display("GABAreuptake = %0.12f , C = %0.12f , Inh = %0.12f , D = %0.12f , Isyn = %0.12f , Cl = %0.12f, gamma = %0.12f, receptor_g = %0.12f, n=", $bitstoshortreal(GABAreuptake), $bitstoshortreal(C), $bitstoshortreal(Inh), $bitstoshortreal(D), $bitstoshortreal(I_syn), $bitstoshortreal(Cl) ,$bitstoshortreal(gamma), $bitstoshortreal(receptor_g),n );
      $display("%0.12f", $bitstoshortreal(GABAreuptake));
      
    end //////end for loop with n1
    
    
      
    
    end ////// end for loop with n
      
       
      @(posedge clk);  
      $finish;
    
    end
      
    /*initial begin
      $monitor("Reg[%0d] = %0h, time - %t", 5'b00001, rocc_accel_inst.reg_inst.Registers[5'b00001], $time);
    end*/
    
      
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
    
    
    task give_reset();
    //$display("RESET START @%0t", $time);
    rst = 1;
    valid = 0;
    repeat(2) @(posedge clk);
    rst = 0;
    //$display("RESET END @%0t", $time);
    endtask : give_reset
      
    /*initial begin
     #3000;
     $finish; 
    end*/
    
    
    
    endmodule: TB