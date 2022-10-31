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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    unisims_ver_m_00000000001946988858_2297623829_init();
    unisims_ver_m_00000000004091665089_0185278751_init();
    unisims_ver_m_00000000003084551676_2157947146_init();
    unisims_ver_m_00000000003266096158_2593380106_init();
    work_m_00000000003109288706_0932324526_init();
    work_m_00000000002605658323_2187063399_init();
    work_m_00000000000051811315_2829079783_init();
    xilinxcorelib_ver_m_00000000001358910285_2273123551_init();
    xilinxcorelib_ver_m_00000000001687936702_2690486219_init();
    xilinxcorelib_ver_m_00000000000277421008_2753406333_init();
    xilinxcorelib_ver_m_00000000001603977570_3685795496_init();
    work_m_00000000003617559063_2117343209_init();
    xilinxcorelib_ver_m_00000000000277421008_2796182993_init();
    xilinxcorelib_ver_m_00000000001603977570_1182055839_init();
    work_m_00000000003617559063_3879552595_init();
    work_m_00000000002822574823_4061625060_init();
    xilinxcorelib_ver_m_00000000000277421008_1249437122_init();
    xilinxcorelib_ver_m_00000000001603977570_3252152488_init();
    work_m_00000000003617559063_2419750597_init();
    work_m_00000000002268584318_0179609628_init();
    work_m_00000000002511287873_3823007873_init();
    work_m_00000000003904171402_0659320905_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003904171402_0659320905");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
