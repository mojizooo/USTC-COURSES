@echo off
REM ****************************************************************************
REM Vivado (TM) v2021.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu May 05 08:49:32 +0800 2022
REM SW Build 3247384 on Thu Jun 10 19:36:33 MDT 2021
REM
REM IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto d4411408c0e44b9b9608f49ced0c3346 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L dist_mem_gen_v8_0_13 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot sim_debug_behav xil_defaultlib.sim_debug xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto d4411408c0e44b9b9608f49ced0c3346 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L dist_mem_gen_v8_0_13 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot sim_debug_behav xil_defaultlib.sim_debug xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
