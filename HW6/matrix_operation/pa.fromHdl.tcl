
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name matrix_operation -dir "E:/fpga/matrix_operation/planAhead_run_4" -part xc6slx9tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/block_mema.ngc}]
add_files [list {ipcore_dir/block_memb.ngc}]
add_files [list {ipcore_dir/block_memc.ngc}]
set hdlfile [add_files [list {ipcore_dir/my_dcm.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {UART_trans.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {UART_rec.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/block_memc.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/block_memb.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/block_mema.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {clk_gen.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {calc.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top top $srcset
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/block_mema.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/block_memb.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/block_memc.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/memory.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-3
