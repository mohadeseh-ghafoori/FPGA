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
    xilinxcorelib_ver_m_00000000001358910285_0241074295_init();
    xilinxcorelib_ver_m_00000000001687936702_3714649262_init();
    xilinxcorelib_ver_m_00000000000277421008_4001809661_init();
    xilinxcorelib_ver_m_00000000001603977570_1817602717_init();
    work_m_00000000002489990758_2207036512_init();
    work_m_00000000000712598544_1788784436_init();
    work_m_00000000003925126971_2659199534_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003925126971_2659199534");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
