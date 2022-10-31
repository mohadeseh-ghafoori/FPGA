
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name matrix_operation -dir "E:/fpga/matrix_operation/planAhead_run_3" -part xc6slx9tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/fpga/matrix_operation/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/fpga/matrix_operation} {ipcore_dir} }
add_files [list {ipcore_dir/block_mema.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/block_memb.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/block_memc.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/memory.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
