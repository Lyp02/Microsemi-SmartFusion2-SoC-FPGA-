open_project -project {D:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\designer\DMAAPB\DMAAPB_fp\DMAAPB.pro}
set_programming_file -name {M2S010} -file {D:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\designer\DMAAPB\DMAAPB.ipd}
enable_device -name {M2S010} -enable 1
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
set_programming_file -name {M2S010} -no_file
save_project
close_project
