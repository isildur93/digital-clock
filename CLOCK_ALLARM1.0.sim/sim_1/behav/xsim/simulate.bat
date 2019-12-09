@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Dec 07 11:53:42 +0100 2019
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim TB_minuti_behav -key {Behavioral:sim_1:Functional:TB_minuti} -tclbatch TB_minuti.tcl -view C:/Users/690006NL/VivadoProjects/CAZZEGGIO/TB_minuti_behav.wcfg -log simulate.log"
call xsim  TB_minuti_behav -key {Behavioral:sim_1:Functional:TB_minuti} -tclbatch TB_minuti.tcl -view C:/Users/690006NL/VivadoProjects/CAZZEGGIO/TB_minuti_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
