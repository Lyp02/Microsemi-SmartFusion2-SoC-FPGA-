new_project \
         -name {DMAAPB} \
         -location {D:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\designer\DMAAPB\DMAAPB_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
