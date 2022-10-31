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
    work_m_00000000003617559063_2583526828_init();
    work_m_00000000002799078324_2740405847_init();
    work_m_00000000004145879960_2328542704_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004145879960_2328542704");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
