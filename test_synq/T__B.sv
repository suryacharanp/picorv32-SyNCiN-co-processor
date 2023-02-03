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
    
    reg [31:0] Sm,Sm_new;
    //reg [31:0] RM,RM_new;
    //reg [31:0] C,C_new;
    
    reg [31:0] W_post,W_post_new;
    reg [31:0] V_post,V_post_new;
    
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
    reg [31:0] reg_la;
    reg [31:0] reg_lb;
    reg [31:0] reg_lc;
    reg [31:0] reg_ld;
    reg [31:0] reg_m;
    reg [31:0] reg_n;
    reg [31:0] reg_o;
    reg [31:0] reg_p;
    reg [31:0] reg_q;
    reg [31:0] reg_qa;
    
    reg [31:0] reg_q1;
    reg [31:0] reg_r;
    reg [31:0] reg_s;
    reg [31:0] reg_t1;
    reg [31:0] reg_u;
    
    reg [31:0] reg_v;
    reg [31:0] reg_w;
    
    reg [31:0] reg_x;
    reg [31:0] reg_y;
    reg [31:0] reg_z;
    reg [31:0] reg_aa;
    
    reg [31:0] reg_a1;
    reg [31:0] reg_b1;
    reg [31:0] reg_c1;
    reg [31:0] reg_d1;
    reg [31:0] reg_e1;
    reg [31:0] reg_f1;
    reg [31:0] reg_Cx;
    
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
    reg [31:0] const_2_5;
    reg [31:0] const__neg_2_5;
    reg [31:0] const0_25;
    
    reg [31:0] constm1bydSm;
    reg [31:0] constSSm;
    reg [31:0] constmISm;
    reg [31:0] constm1by3;
    reg [31:0] const2by15;
    reg [31:0] const1byTSm;
    reg [31:0] consta;
    reg [31:0] constb;
    reg [31:0] constr;
    reg [31:0] const_alpha;
    reg [31:0] const_beta;
    reg [31:0] const_k;
    reg [31:0] delbytc;
    reg [31:0] const_neg3;
    reg [31:0] I_post;
    reg [31:0] const_rm;
    reg [31:0] const_neg_1_6;
    reg [31:0] const0_5;
    reg [31:0] const_10;
    reg [31:0] GABA;
    reg [31:0] const_5_0;
    reg [31:0] const__neg_5_0;
    reg [31:0] const_cgamma;
    reg [31:0] const_kgamma;
    //reg [31:0] const_cg;
    reg [31:0] const_k1;
    //////////////
    reg [31:0] xs,tanhxs;
    
    
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
        
    
        //RM = 32'b00111111001100001110010101100000;
        //RM_new =32'b00111111001100001110010101100000;
    
        //C = 32'b0;
        //C_new = 32'b0;
        
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
        reg_la = 32'b0;
        reg_lb = 32'b0;
        reg_lc = 32'b0;
        reg_ld = 32'b0;
        reg_m = 32'b0;
        reg_m = 32'b0;
        reg_o = 32'b0;
        reg_p = 32'b0;
        reg_q = 32'b0;
        reg_qa = 32'b0;
        
        reg_q1 = 32'b0;
        reg_r = 32'b0;
        reg_s = 32'b0;
        reg_t1 = 32'b0;
        reg_u = 32'b0;
    
        reg_v=32'b0;
        reg_w=32'b0;
    
        reg_x=32'b0;
        reg_y=32'b0;
        reg_z=32'b0;
        reg_aa=32'b0;
        
        reg_a1=32'b0;
        reg_b1=32'b0;
        reg_c1=32'b0;
        reg_d1=32'b0;
        reg_e1=32'b0;
        reg_f1=32'b0;
        reg_Cx=32'b0;
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
        const_2_5 = 32'b01000000001000000000000000000000; //2.5
        const__neg_2_5 = 32'b11000000001000000000000000000000; //-2.5
        const0_25 = 32'b00111110100000000000000000000000; //0.25
        const_5_0 = 32'b01000000101000000000000000000000;
        const__neg_5_0 = 32'b11000000101000000000000000000000;
        constm1bydSm = 32'b11001101100011001110110110011000;
        constSSm = 32'b01001001010011111000010100000000;
        constmISm = 32'b10111111010110011001100110011001;
        constm1by3 = 32'b10111110101010101010101010101010;
        const2by15 = 32'b00111110000010001000100010001000;
        const1byTSm = 32'b01000001001000000000000000000000;
        consta = 32'b00110000100010010111000001011111;
        constb = 32'b00111111001101000110010010011001;
        
        constr = 32'b00110101100001100011011110111101;
        const_alpha = 32'b00110110010010010101001110011011;
        const_beta = 32'b01001011000110001001011010000000;
        const_k = 32'b0;
        delbytc = 32'b00110111001001111100010110101100;
        const_k1 = 32'b00111111100000000000000000000000;//1.0
        const_cgamma = 32'b1100010001111010000000000000000;//-10^3
        const_kgamma = 32'b0100010001111010000000000000000;//10^3
        //const_cg = 32’b0100010001111010000000000000000;
        GABA = 32'b01000000100000000000000000000000;
        
        ////////////////
        xs = 32'b0;
        tanhxs = 32'b0;
        
        I_post = 32'b00111111100001100110011001100110;
        const_neg3=32'b10111110101010101010101010101010;
    
        const_neg_1_6=32'b10111110001010101010101010100110;
        const_rm=32'b00101101001000010111111010011000;
        const0_5 = 32'b00111111000000000000000000000000; //0.5
        const_10 = 32'b01000001001000000000000000000000;
        //rst = 1;
          //$display("RESET START @%0t", $time);
        //#10; rst = 0; inst = 0; valid = 0;
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
        
      
      give_reset();
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00010;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000011, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
       inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
       inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000011, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
            inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
            inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000010, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
    /*give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
          inst = {7'b0000010, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
          rs1 = { 32’b0, const1};
          rs2 = { I_syn, receptor_g};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
          reg_g1 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(0,1,I_syn,Receptor_g)=I_syn/receptor_g]
     
    give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
          inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
          rs1 = { constm1bytcl, Cl};
          rs2 = { const_k1, reg_g1};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
          //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
          reg_g2 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(const,Cl,k1,reg_g1)=const*Cl+k1.reg_g1]
          give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
          inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
          rs1 = { Cl, const1};
          rs2 = { const_del, reg_g2};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
          //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
          Cl_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(10,Sm,0.9,C)=10*Sm+0.9C]
          */
     /*
          give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_g, const1};
      rs2 = { gamma, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_h1 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_g,1,Yrecep,1)=receptor_g+Yrecep]
    
    
     
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_g, const1};
      rs2 = { const_del, reg_h};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      receptor_g_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_g,1,del,reg_h)= receptor_g+del.reg_h]
    
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000010, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { 32’b0, const1};
      rs2 = { const_k1, receptor_g};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i_1 = rocc_accel_inst.reg_inst.Registers[destination];//[op2(0/1 + k1/receptor_g)= k1/receptor_g]
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { 32’b0, 32’b0};
      rs2 = { beta, reg_i_1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i_2= rocc_accel_inst.reg_inst.Registers[destination];//[op1(0, 0, beta, reg_i_1)= beta . reg_i_1]     
    
    
      give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_r, const1};
      rs2 = { alpha, reg_i_2};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i_3 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(0, 0, alpha, reg_i_2)=alpha. Reg_i_2]
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_r, const1};
      rs2 = { const_del, reg_i_3};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      receptor_r_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_r, 1, const_del, reg_i_3)= receptor_r + const_del.reg_i_3]
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_cgamma, gamma};
      rs2 = { const_kgamma, Cl};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_j1 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_r, 1, const_del, reg_i_3)= receptor_r + const_del.reg_i_3]
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { gamma, const1};
      rs2 = { const_del, reg_j};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      gamma_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_r, 1, const_del, reg_i_3)= receptor_r + const_del.reg_i_3]
      */
    
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
      Sm = Sm_new;
      xs = reg_l;
      tanhxs = reg_n;
      C = C_new;
      W_post=W_post_new;
      V_post=V_post_new;
    
      give_reset();
      
      $display("GABAreuptake = %0.12f , C = %0.12f , Inh = %0.12f , D = %0.12f , W = %0.12f , n=%d ,", $bitstoshortreal(GABAreuptake), $bitstoshortreal(C), $bitstoshortreal(Inh), $bitstoshortreal(D), $bitstoshortreal(W), $bitstoshortreal(I_syn), n );
      
      //$display("RMtrace = %0f , A = %0f , D = %0f , Inh = %0f , Prel = %0f , Z = %0f , Y = %0f , W = %0f , Isyn = %0.12f , Sm = %0.12f , n=%d ", $bitstoshortreal(RMtrace),$bitstoshortreal(A),$bitstoshortreal(D),$bitstoshortreal(Inh),$bitstoshortreal(Prel),$bitstoshortreal(Z),$bitstoshortreal(Y),$bitstoshortreal(W),$bitstoshortreal(I_syn),$bitstoshortreal(Sm),n);
      //$display("%0f %0f %0f %0f %0f %0f %0f %0f %d", $bitstoshortreal(RMtrace),$bitstoshortreal(A),$bitstoshortreal(D),$bitstoshortreal(Inh),$bitstoshortreal(Prel),$bitstoshortreal(Z),$bitstoshortreal(Y),$bitstoshortreal(W),n);
      //$display("%b",I_syn);
      
      give_reset();
      
    end ////////////end for loop with n0
      
      
      
      
    for(n1=0; n1<10;n1=n1+1)
    begin   
      
      give_reset();
      
      
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b00001;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000011, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
       inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
       inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000011, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
            inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
            inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000010, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
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
    /*give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
          inst = {7'b0000010, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
          rs1 = { 32’b0, const1};
          rs2 = { I_syn, receptor_g};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
     //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
          reg_g1 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(0,1,I_syn,Receptor_g)=I_syn/receptor_g]
     
    give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
          inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
          rs1 = { constm1bytcl, Cl};
          rs2 = { const_k1, reg_g1};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
          //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
          reg_g2 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(const,Cl,k1,reg_g1)=const*Cl+k1.reg_g1]
          give_reset();
         
          @(posedge clk iff ready === 1 && rst === 0);
          valid = 1;
          destination = 5'b01000;
          inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
          rs1 = { Cl, const1};
          rs2 = { const_del, reg_g2};
          @(posedge clk);
          wait(ready === 0);
          //$display("operation ongoing");
          @(posedge clk);
          wait(ready === 1);
          //@(posedge clk);
          //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
          Cl_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(10,Sm,0.9,C)=10*Sm+0.9C]
          */
     /*
          give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_g, const1};
      rs2 = { gamma, const1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_h1 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_g,1,Yrecep,1)=receptor_g+Yrecep]
    
    
     
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_g, const1};
      rs2 = { const_del, reg_h};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      receptor_g_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_g,1,del,reg_h)= receptor_g+del.reg_h]
    
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000010, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { 32’b0, const1};
      rs2 = { const_k1, receptor_g};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i_1 = rocc_accel_inst.reg_inst.Registers[destination];//[op2(0/1 + k1/receptor_g)= k1/receptor_g]
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { 32’b0, 32’b0};
      rs2 = { beta, reg_i_1};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i_2= rocc_accel_inst.reg_inst.Registers[destination];//[op1(0, 0, beta, reg_i_1)= beta . reg_i_1]     
    
    
      give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_r, const1};
      rs2 = { alpha, reg_i_2};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_i_3 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(0, 0, alpha, reg_i_2)=alpha. Reg_i_2]
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { receptor_r, const1};
      rs2 = { const_del, reg_i_3};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      receptor_r_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_r, 1, const_del, reg_i_3)= receptor_r + const_del.reg_i_3]
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { const_cgamma, gamma};
      rs2 = { const_kgamma, Cl};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      reg_j1 = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_r, 1, const_del, reg_i_3)= receptor_r + const_del.reg_i_3]
    
    
    give_reset();
     
      @(posedge clk iff ready === 1 && rst === 0);
      valid = 1;
      destination = 5'b01000;
      inst = {7'b0000001, 5'b00001, 5'b00000, 1'b0, 1'b1, 1'b1, destination, 2'b00};
      rs1 = { gamma, const1};
      rs2 = { const_del, reg_j};
      @(posedge clk);
      wait(ready === 0);
      //$display("operation ongoing");
      @(posedge clk);
      wait(ready === 1);
      //@(posedge clk);
      //$display("Reg[%0d] = %0h (hex), %0f (float)", destination, rocc_accel_inst.reg_inst.Registers[destination], $bitstoshortreal(rocc_accel_inst.reg_inst.Registers[destination]));
      gamma_new = rocc_accel_inst.reg_inst.Registers[destination];//[op1(receptor_r, 1, const_del, reg_i_3)= receptor_r + const_del.reg_i_3]
      */
    
    
    
    
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
      Sm = Sm_new;
      xs = reg_l;
      tanhxs = reg_n;
      C = C_new;
      W_post=W_post_new;
      V_post=V_post_new;
      
      give_reset();
      
       $display("GABAreuptake = %0.12f , C = %0.12f , Inh = %0.12f , D = %0.12f , W = %0.12f , Isyn = %0.12f , n=%d ,", $bitstoshortreal(GABAreuptake), $bitstoshortreal(C), $bitstoshortreal(Inh), $bitstoshortreal(D), $bitstoshortreal(W), $bitstoshortreal(I_syn), n );
      //$display("RMtrace = %0f , A = %0f , D = %0f , Inh = %0f , Prel = %0f , Z = %0f , Y = %0f , W = %0f , Isyn = %0.12f , Sm = %0.12f , n=%d ", $bitstoshortreal(RMtrace),$bitstoshortreal(A),$bitstoshortreal(D),$bitstoshortreal(Inh),$bitstoshortreal(Prel),$bitstoshortreal(Z),$bitstoshortreal(Y),$bitstoshortreal(W),$bitstoshortreal(I_syn),$bitstoshortreal(Sm),n);
      //$display("%0f %0f %0f %0f %0f %0f %0f %0f %d", $bitstoshortreal(RMtrace),$bitstoshortreal(A),$bitstoshortreal(D),$bitstoshortreal(Inh),$bitstoshortreal(Prel),$bitstoshortreal(Z),$bitstoshortreal(Y),$bitstoshortreal(W),n);
      //$display("%b",I_syn);
      
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