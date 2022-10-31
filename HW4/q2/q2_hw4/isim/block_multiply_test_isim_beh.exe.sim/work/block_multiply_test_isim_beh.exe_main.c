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
    xilinxcorelib_ver_m_00000000001358910285_1745555042_init();
    xilinxcorelib_ver_m_00000000001687936702_1724394411_init();
    xilinxcorelib_ver_m_00000000000277421008_3628012095_init();
    xilinxcorelib_ver_m_00000000001603977570_2367268982_init();
    work_m_00000000003617559063_1820589753_init();
    xilinxcorelib_ver_m_00000000001358910285_0359770596_init();
    xilinxcorelib_ver_m_00000000001687936702_2748435483_init();
    xilinxcorelib_ver_m_00000000000277421008_2670073597_init();
    xilinxcorelib_ver_m_00000000001603977570_0335864860_init();
    work_m_00000000003617559063_1831303622_init();
    work_m_00000000003025553567_0169594029_init();
    work_m_00000000002799818889_0858528200_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002799818889_0858528200");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
