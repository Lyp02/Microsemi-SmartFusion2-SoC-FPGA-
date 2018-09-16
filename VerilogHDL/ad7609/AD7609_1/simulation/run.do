quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "D:/M2S010TQG144/AD/AD7609_1"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v11.8/Designer/lib/modelsim/precompiled/vlog/SmartFusion2"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/AD7609.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/AD7609_tb.v"

vsim -L SmartFusion2 -L presynth  -t 1fs presynth.AD7609_tb
add wave /AD7609_tb/*
run 1000ns
