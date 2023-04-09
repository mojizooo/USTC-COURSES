# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/CODexp/Lab4/CPU/CPU.runs/synth_1/DeBug.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/CODexp/Lab4/CPU/CPU.cache/wt [current_project]
set_property parent.project_path C:/CODexp/Lab4/CPU/CPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/CODexp/Lab4/CPU/CPU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
add_files C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Instruction_memory/inst.coe
add_files C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Instruction_memory/inst3.coe
add_files C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Instruction_memory/fib_test.coe
add_files C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Instruction_memory/inst_f.coe
add_files C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Data_memory/data.coe
read_verilog -library xil_defaultlib {
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/ALU.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/ALUcontrol.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/Add.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/CPU.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/Control.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/ImmGen.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/MUX.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/PC.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/Registers.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/Shiftleft.v
  {C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/imports/Digital Tube/decoder3_8.v}
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/imports/Sources/decoder4_7.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/pdu_1cycle.v
  C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/new/DeBug.v
}
read_ip -quiet C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Instruction_memory/Instruction_memory.xci
set_property used_in_implementation false [get_files -all c:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Instruction_memory/Instruction_memory_ooc.xdc]

read_ip -quiet C:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Data_memory/Data_memory.xci
set_property used_in_implementation false [get_files -all c:/CODexp/Lab4/CPU/CPU.srcs/sources_1/ip/Data_memory/Data_memory_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/CODexp/Lab4/CPU/CPU.srcs/constrs_1/imports/Sources/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files C:/CODexp/Lab4/CPU/CPU.srcs/constrs_1/imports/Sources/Nexys4DDR_Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top DeBug -part xc7a100tcsg324-1
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef DeBug.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file DeBug_utilization_synth.rpt -pb DeBug_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
