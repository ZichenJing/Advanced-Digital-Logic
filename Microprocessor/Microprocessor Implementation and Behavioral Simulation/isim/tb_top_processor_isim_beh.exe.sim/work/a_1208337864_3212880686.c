/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "T:/Processor_template/Controller.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
unsigned char ieee_p_1242562249_sub_2720006528_1035706684(char *, char *, char *, char *, char *);


static void work_a_1208337864_3212880686_p_0(char *t0)
{
    char t35[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned char t25;
    unsigned char t26;
    unsigned char t27;
    unsigned char t28;
    unsigned char t29;
    unsigned char t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    int t36;
    unsigned int t37;
    unsigned int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;

LAB0:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4512);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(33, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 4576);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 4704);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(36, ng0);
    t1 = (t0 + 4768);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(37, ng0);
    t1 = xsi_get_transient_memory(7U);
    memset(t1, 0, 7U);
    t2 = t1;
    memset(t2, (unsigned char)1, 7U);
    t3 = (t0 + 4832);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 7U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(38, ng0);
    t1 = (t0 + 4896);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t12 = *((unsigned char *)t2);
    t13 = (t12 == (unsigned char)8);
    if (t13 == 1)
        goto LAB14;

LAB15:    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t14 = *((unsigned char *)t3);
    t15 = (t14 == (unsigned char)10);
    t11 = t15;

LAB16:    if (t11 == 1)
        goto LAB11;

LAB12:    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t16 = *((unsigned char *)t4);
    t17 = (t16 == (unsigned char)0);
    t10 = t17;

LAB13:    if (t10 == 1)
        goto LAB8;

LAB9:    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t18 = *((unsigned char *)t5);
    t19 = (t18 == (unsigned char)2);
    t9 = t19;

LAB10:    if (t9 == 1)
        goto LAB5;

LAB6:    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t20 = *((unsigned char *)t6);
    t21 = (t20 == (unsigned char)4);
    t8 = t21;

LAB7:    if (t8 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t14 = *((unsigned char *)t2);
    t15 = (t14 == (unsigned char)9);
    if (t15 == 1)
        goto LAB34;

LAB35:    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t16 = *((unsigned char *)t3);
    t17 = (t16 == (unsigned char)11);
    t13 = t17;

LAB36:    if (t13 == 1)
        goto LAB31;

LAB32:    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t18 = *((unsigned char *)t4);
    t19 = (t18 == (unsigned char)1);
    t12 = t19;

LAB33:    if (t12 == 1)
        goto LAB28;

LAB29:    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t20 = *((unsigned char *)t5);
    t21 = (t20 == (unsigned char)3);
    t11 = t21;

LAB30:    if (t11 == 1)
        goto LAB25;

LAB26:    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t25 = *((unsigned char *)t6);
    t26 = (t25 == (unsigned char)5);
    t10 = t26;

LAB27:    if (t10 == 1)
        goto LAB22;

LAB23:    t1 = (t0 + 1032U);
    t7 = *((char **)t1);
    t27 = *((unsigned char *)t7);
    t28 = (t27 == (unsigned char)6);
    t9 = t28;

LAB24:    if (t9 == 1)
        goto LAB19;

LAB20:    t1 = (t0 + 1032U);
    t22 = *((char **)t1);
    t29 = *((unsigned char *)t22);
    t30 = (t29 == (unsigned char)7);
    t8 = t30;

LAB21:    if (t8 != 0)
        goto LAB17;

LAB18:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)13);
    if (t9 != 0)
        goto LAB37;

LAB38:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)12);
    if (t9 != 0)
        goto LAB48;

LAB49:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)14);
    if (t9 != 0)
        goto LAB53;

LAB54:    xsi_set_current_line(84, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    if (-1 == -1)
        goto LAB55;

LAB56:    t34 = 0;

LAB57:    t36 = (t34 - 13);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t3 = (t2 + t38);
    t39 = (0 - 13);
    t40 = (t39 * -1);
    t40 = (t40 + 1);
    t41 = (1U * t40);
    memset(t3, (unsigned char)1, t41);
    t4 = (t0 + 4512);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t22 = *((char **)t7);
    memcpy(t22, t1, 14U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(85, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    if (-1 == -1)
        goto LAB58;

LAB59:    t34 = 0;

LAB60:    t36 = (t34 - 13);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t3 = (t2 + t38);
    t39 = (0 - 13);
    t40 = (t39 * -1);
    t40 = (t40 + 1);
    t41 = (1U * t40);
    memset(t3, (unsigned char)1, t41);
    t4 = (t0 + 4576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t22 = *((char **)t7);
    memcpy(t22, t1, 14U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(86, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    if (-1 == -1)
        goto LAB61;

LAB62:    t34 = 0;

LAB63:    t36 = (t34 - 13);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t3 = (t2 + t38);
    t39 = (0 - 13);
    t40 = (t39 * -1);
    t40 = (t40 + 1);
    t41 = (1U * t40);
    memset(t3, (unsigned char)1, t41);
    t4 = (t0 + 4704);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t22 = *((char **)t7);
    memcpy(t22, t1, 14U);
    xsi_driver_first_trans_fast_port(t4);

LAB3:    t1 = (t0 + 4432);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 4640);
    t7 = (t1 + 56U);
    t22 = *((char **)t7);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 4896);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    t8 = (unsigned char)1;
    goto LAB7;

LAB8:    t9 = (unsigned char)1;
    goto LAB10;

LAB11:    t10 = (unsigned char)1;
    goto LAB13;

LAB14:    t11 = (unsigned char)1;
    goto LAB16;

LAB17:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 2632U);
    t23 = *((char **)t1);
    t1 = (t0 + 4576);
    t24 = (t1 + 56U);
    t31 = *((char **)t24);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t23, 14U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 4896);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB19:    t8 = (unsigned char)1;
    goto LAB21;

LAB22:    t9 = (unsigned char)1;
    goto LAB24;

LAB25:    t10 = (unsigned char)1;
    goto LAB27;

LAB28:    t11 = (unsigned char)1;
    goto LAB30;

LAB31:    t12 = (unsigned char)1;
    goto LAB33;

LAB34:    t13 = (unsigned char)1;
    goto LAB36;

LAB37:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 2472U);
    t4 = *((char **)t1);
    t10 = 1;
    if (14U == 14U)
        goto LAB42;

LAB43:    t10 = 0;

LAB44:    if (t10 != 0)
        goto LAB39;

LAB41:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 4896);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB40:    goto LAB3;

LAB39:    xsi_set_current_line(58, ng0);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t6 = (t0 + 7052U);
    t36 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t6);
    t22 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t35, t36, 14);
    t23 = (t0 + 4512);
    t24 = (t23 + 56U);
    t31 = *((char **)t24);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t22, 14U);
    xsi_driver_first_trans_fast_port(t23);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 4576);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 4768);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB40;

LAB42:    t34 = 0;

LAB45:    if (t34 < 14U)
        goto LAB46;
    else
        goto LAB44;

LAB46:    t1 = (t3 + t34);
    t5 = (t4 + t34);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB43;

LAB47:    t34 = (t34 + 1);
    goto LAB45;

LAB48:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 7084U);
    t4 = (t0 + 2472U);
    t5 = *((char **)t4);
    t4 = (t0 + 7100U);
    t10 = ieee_p_1242562249_sub_2720006528_1035706684(IEEE_P_1242562249, t3, t1, t5, t4);
    if (t10 != 0)
        goto LAB50;

LAB52:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 4896);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB51:    goto LAB3;

LAB50:    xsi_set_current_line(68, ng0);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t6 = (t0 + 7052U);
    t36 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t6);
    t22 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t35, t36, 14);
    t23 = (t0 + 4512);
    t24 = (t23 + 56U);
    t31 = *((char **)t24);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t22, 14U);
    xsi_driver_first_trans_fast_port(t23);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 4576);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 4768);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB51;

LAB53:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 7052U);
    t36 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t35, t36, 14);
    t5 = (t0 + 4512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t22 = (t7 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t4, 14U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 4576);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 4768);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB55:    t34 = 13;
    goto LAB57;

LAB58:    t34 = 13;
    goto LAB60;

LAB61:    t34 = 13;
    goto LAB63;

}


extern void work_a_1208337864_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1208337864_3212880686_p_0};
	xsi_register_didat("work_a_1208337864_3212880686", "isim/tb_top_processor_isim_beh.exe.sim/work/a_1208337864_3212880686.didat");
	xsi_register_executes(pe);
}
