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
    unisims_ver_m_00000000002399568039_2282143210_init();
    unisims_ver_m_00000000000740258969_3897995058_init();
    unisims_ver_m_00000000000740258969_1625843133_init();
    unisims_ver_m_00000000003131622635_0225263307_init();
    unisims_ver_m_00000000002922998384_3238610980_init();
    unisims_ver_m_00000000003266096158_2593380106_init();
    work_m_00000000002061695886_0932324526_init();
    xilinxcorelib_ver_m_00000000000200492576_0461066331_init();
    xilinxcorelib_ver_m_00000000001647451333_1847519231_init();
    xilinxcorelib_ver_m_00000000001159543956_0713972498_init();
    xilinxcorelib_ver_m_00000000001291582275_1482991361_init();
    work_m_00000000003505186919_0239730464_init();
    work_m_00000000000151278540_3823007873_init();
    work_m_00000000003102660378_3512928209_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003102660378_3512928209");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
