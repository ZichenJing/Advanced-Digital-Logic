
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Processor -dir "T:/Processor_template/planAhead_run_1" -part xc3s100ecp132-4
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "T:/Processor_template/top_processor_FPGA.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {T:/Processor_template} }
set_property target_constrs_file "top_processor_FPGA.ucf" [current_fileset -constrset]
add_files [list {top_processor_FPGA.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "T:/Processor_template/top_processor_FPGA.ncd"
if {[catch {read_twx -name results_1 -file "T:/Processor_template/top_processor_FPGA.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"T:/Processor_template/top_processor_FPGA.twx\": $eInfo"
}
