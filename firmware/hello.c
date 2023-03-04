// This is free and unencumbered software released into the public domain.
//Cycle counter ......... 452482
//Instruction counter ... 100400
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

#include "firmware.h"

#define OPER_1 1
#define OPER_2 2
#define OPER_3 3
#define OPER_4 4
#define OPER_5 5

void hello(void)
{
	// print_str("hello world\n");
	// int k =1;
	// float m = 0.0002;
	// int t;
	
	// print_dec(t);
	
	int as = 0;
	int as2 =0;
	int as0 =0;
	float a=1.2;
	// for (int i = 0; i < 1; i++)
	// {
	// 	for (int m = 0; i < 1; m++)
	// 	{
	// 		/* code */

	for (int n = 1; n < 50; n++)
	{
	// 			/* code */
			
	
		as = operation(2,1,n,5,OPER_1);
		as0 = operation(3,2,4,n, OPER_2);
		as2 =as2 +as +as0;

		// }}

		
		
	}
	print_dec(as2);
	print_str("   ");
	print_dec(a);

}
	
	

// 	int GABAreuptake = 0;
// 	int GABAreuptake_new = 0;
// 	int Inh = 0;
// 	int Inh_new = 0;
// 	int C = 0;
// 	int C_new = 0;
// 	int D = 0;
// 	int D_new = 0;
// 	int W = 0;
// 	int W_new = 0;
// 	int Prel = 0;
// 	int p_rel_new = 0;
// 	int Z = 0;
// 	int Z_new = 0;
// 	int Y = 0;
// 	int Y_new = 0;
// 	int I_syn_new = 0;
// 	int I_syn = 0;
// 	int Cl = 0;
// 	int alpha = 1; // 10^-7
// 	int alpha_new = 0;
// 	int beta = 1; // 10^-7
// 	int beta_new = 0;
// 	int rel = 0;
// 	int gamma = 1; // 10^-7
// 	int gamma_new = 0;
// 	int receptor_g = 0;
// 	int receptor_g_new;

// 	int reg_a = 0;
// 	int reg_b = 0;
// 	int reg_c = 0;
// 	int reg_d = 0;
// 	int reg_e = 0;
// 	int reg_f = 0;
// 	int reg_g_a = 0;
// 	int reg_g = 0;
// 	int reg_h = 0;
// 	int reg_i = 0;
// 	int reg_t = 0;
// 	int reg_j = 0;
// 	int reg_k = 0;
// 	int reg_l = 0;
// 	int reg_m = 0;
// 	int reg_n = 0;
// 	int reg_o = 0;
// 	int reg_p = 0;
// 	int reg_q = 0;
// 	int reg_r = 0;
// 	int reg_s = 0;
// 	int reg_s1 = 0;
// 	int reg_s2 = 0;
// 	int reg_s3 = 0;
// 	int reg_s4 = 0;
// 	int reg_s5 = 0;
// 	// int reg_s5 = 0;
// 	int reg_s6 = 0;
// 	int reg_s7 = 0;
// 	int reg_s8 = 0;
// 	int reg_s9 = 0;
// 	int reg_s10 = 0;
// 	// int reg_s11 = 0;
// 	int reg_s12 = 0;
// 	// int reg_s13 = 0;
// 	// int reg_s14 = 0;
// 	// int reg_s15 = 0;
// 	// int reg_u = 0;
// 	// int reg_v = 0;
// 	// int reg_w = 0;
// 	// int reg_x = 0;
// 	int reg_m1 = 0;

// 	int const_m1bytr = -2.5;
// 	int const1 = 1.0;
// 	int const0 = 0.0;
// 	int const_del = 0.001;
// 	int constm1bytinh = -10;
// 	int constm1bytc = -10;
// 	int const1bytc = 10;
// 	int constk0 = 0.0;
// 	int GABA = 0000000;
// 	int const_neg_0_00001 = 100;
// 	int const_neg_0_00007 = 110;
// 	int const_5_0 = 100;
// 	int const__neg_5_0 = 100;
// 	int constm1bytd = -50;
// 	int const1bytd = 50;
// 	int const_m1byt = -10;
// 	int const_neg1 = -1;
// 	int time_const = 0.1;
// 	int const_1_1 = 1.1;
// 	// int	const0_5 = 0.5;
// 	int const_cl = 200;
// 	int const_neg_1000 = 100;
// 	int const_1000 = 100;
// 	int const_0_0001 = 0.0001;
// 	// int	const_neg_0_5 = -0.5;
// 	int const_neg_100 = -100;
// 	int const_0_00001 = 0.00001;
// 	// int	const_0_25 = 100;
// 	// int	const_2 = 100;
// 	int const_1000000 = 100;
// 	int const_neg_1 = -1;
// 	int const_2_1 = 2.1;
// 	int const_4 = 4;
// 	int tp0 = 0;

// 	// int tp1 = 100;
// 	// int td1 = 100;
// 	int td0 = 0;
// 	// int I_syn_new =0;
// 	int m0,m1,m2,m3,m4,m5,m6,m7;
// 	for (int j = 0; j < 1; j++)
// 	{
// 	for (int mi = 0; mi <25; mi++)
// 	{
// 		print_dec(mi);
// 	}
	
	

// 	for (int i = 1; i <= 990; i++)
// 	{
// 		reg_a = operation(GABAreuptake, const_m1bytr, GABA, const1, OPER_1);
// 		GABAreuptake_new = operation(GABAreuptake, const1, const_del, reg_a, OPER_1);
// 		reg_c = operation(tp0, tp0, tp0, tp0, OPER_3);
// 		reg_d = operation(constm1bytc, C, const1bytc, reg_c, OPER_1);
// 		C_new = operation(C, const1, const_del, reg_d, OPER_1);
// 		reg_b = operation(Inh, constm1bytinh, GABAreuptake, C, OPER_1);
// 		Inh_new = operation(Inh, const1, const_del, reg_b, OPER_1);
// 		reg_e = operation(td0, td0, td0, td0, OPER_3);
// 		reg_f = operation(constm1bytd, D, const1bytd, reg_e, OPER_1);
// 		D_new = operation(D, const1, const_del, reg_f, OPER_1);
// 		reg_g_a = operation(C, D, const0, const0, OPER_1);
// 		reg_g = operation(reg_g_a, Prel, const0, const0, OPER_1);
// 		W_new = operation(W, const1, const_del, reg_g, OPER_1);
// 		reg_h = operation(Z, const_m1byt, reg_c, const1, OPER_1);
// 		Z_new = operation(Z, const1, const_del, reg_h, OPER_1);
// 		reg_i = operation(const1, const1, const_del, const_neg1, OPER_1);
// 		Y_new = operation(const_del, Z, reg_i, Y, OPER_1);
// 		reg_t = operation(time_const, Y, const0, const0, OPER_1);
// 		I_syn_new = operation(reg_t, W, reg_t, constk0, OPER_1);
// 		reg_j = operation(Inh, const1, const_neg_0_00001, const1, OPER_1);
// 		reg_k = operation(const_neg_0_00007, reg_j, const_1_1, const1, OPER_2);
// 		p_rel_new = operation(const_5_0, const1, const__neg_5_0, reg_k, OPER_1);
// 		Cl = operation(const_cl, I_syn, const1, const0, OPER_1);
// 		reg_l = operation(gamma, const_neg_1000, Cl, const_1000, OPER_1);
// 		gamma_new = operation(gamma, const1, const_del, reg_l, OPER_1);
// 		reg_m = operation(receptor_g, const_neg_1, const1, gamma, OPER_1);
// 		reg_m1 = operation(const_1000000, reg_m, const1, 0, OPER_1);
// 		receptor_g_new = operation(receptor_g, const1, const_del, reg_m1, OPER_1);
// 		reg_n = operation(const_neg_1000, alpha, const_neg1, 0, OPER_1);
// 		reg_o = operation(const_1000, Cl, const1, const_0_0001, OPER_1);
// 		reg_p = operation(const1, reg_n, reg_o, const1, OPER_1);
// 		alpha_new = operation(alpha, const1, const_del, reg_p, OPER_1);
// 		reg_q = operation(beta, const_neg_100, const1, 0, OPER_1);
// 		reg_r = operation(reg_q, const1, const1, const_0_00001, OPER_1);
// 		beta_new = operation(beta, const1, const_del, reg_r, OPER_1);
// 		reg_s = operation(const1, alpha, const1, beta, OPER_5);
// 		reg_s1 = operation(beta, reg_s, 0, const1, OPER_2);
// 		reg_s2 = operation(const_2_1, alpha, const1, 0, OPER_1);
// 		reg_s3 = operation(reg_s1, reg_s2, 0, const1, OPER_1);
// 		reg_s4 = operation(beta, const_4, 0, const1, OPER_2);
// 		reg_s5 = operation(alpha, const_4, 0, const1, OPER_1);
// 		reg_s6 = operation(beta, reg_s5, 0, const1, OPER_2);
// 		reg_s7 = operation(reg_s4, reg_s4, 0, const1, OPER_1);
// 		reg_s8 = operation(reg_s7, reg_s4, 0, const1, OPER_1);
// 		reg_s9 = operation(reg_s8, const_neg_1, reg_s6, reg_s6, OPER_1);
// 		reg_s10 = operation(reg_s9, const1, reg_s6, const_neg_1, OPER_1);
// 		reg_s12 = operation(reg_s10, const1, const1, const1, OPER_1);
// 		rel = operation(reg_s12, reg_s3, 0, const1, OPER_1);

//      m0 = GABAreuptake + GABAreuptake_new +Inh +Inh_new +C +C_new  ;



//   m1 = m0+D +D_new +W +W_new +Prel +p_rel_new +Z +Z_new +Y +Y_new;
//   m2 = m1 +I_syn_new +I_syn +Cl +alpha +alpha_new +beta+beta_new +rel +gamma +gamma_new;
//   m3 = m2 +receptor_g +receptor_g_new+reg_a +reg_b +reg_c +reg_d +reg_e +reg_f +reg_g_a +reg_g +reg_h;
//   m4 = m3 +reg_i +reg_t +reg_j +reg_k +reg_l +reg_m +reg_n +reg_o +reg_p +reg_q +reg_r +reg_s +reg_s1 +reg_s2;
//   m5 = m4+ +reg_s3 +reg_s4 +reg_s5 +reg_s6 +reg_s7 +reg_s8 +reg_s9 +reg_s10 +reg_s12 +reg_m1 +const_m1bytr+const1;
//   m6 =m5 +const0 +const_del +constm1bytinh +constm1bytc +const1bytc+constk0 +GABA;
//   m7 = m6+const_neg_0_00001 +const_neg_0_00007 +const_5_0 +const__neg_5_0 +constm1bytd +const1bytd+const_m1byt +const_neg1+time_const ;

  


// 	}	/* code */
// 	}
// 	print_dec(m7);
// }


// uint32_t operation(uint32_t a, uint32_t b, uint32_t c, uint32_t d, uint32_t e)
// {
// 	if (e == 1)
// 	{
// 		//return hard_mulh(a, b);
// 	}

// 	else if (e == 2)
// 	{
// 		return hard_mulh(a, b);
// 	}
// 	else if (e == 3)
// 	{
// 		if (b)
// 		{
// 			return 1;
// 		}
// 		else
// 		{
// 			return 0;
// 		}
// 	}
// 	else if (e == 4)
// 	{
// 		return hard_mulh(a, b);
// 	}
// 	else if (e == 5)
// 	{
// 		return hard_mulh(a, b);
// 	}
// 	else if (c == 56325) 
// 	{
// 		return 0;
// 	}
// 	else if (d == 464646)
// 	{
// 		return 0;
// 	}
// 	else
// 	{
// 		return 0;
// 	}
// }

uint32_t operation(uint32_t a, uint32_t b, uint32_t c, uint32_t d, uint32_t e)
{
	if (e == 1)
	{
		return (a*b)+(c*d);
	}

	else if (e == 2)
	{
		return (a/b)+(c/d);
	}
	else if (e == 3)
	{
		if (b)
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
	else if (e == 4)
	{
		return a+b+c+d;
	}
	else if (e == 5)
	{
		return a*b*c*d;
	}
	else
	{
		return 0;
	}
}

