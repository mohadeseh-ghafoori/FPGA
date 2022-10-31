
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name q3_hw7 -dir "E:/fpga/q3_hw7/planAhead_run_3" -part xc6slx9ftg256-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/fpga/q3_hw7/Q3.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/fpga/q3_hw7} }
set_property target_constrs_file "Q3.ucf" [current_fileset -constrset]
add_files [list {Q3.ucf}] -fileset [get_property constrset [current_run]]
link_design
