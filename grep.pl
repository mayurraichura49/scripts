$SEARCH_PATH = "NEW_WAIVER" ;
@pattern = (
ram_data_out ,
penable ,
psel ,
pready ,
prdata ,
pslverr ,
ram_cs_n ,
ram_wr_n ,
ram_addr ,
ram_data_in ,
ic_intr ,
dma_ack_tx ,
dma_ack_rx ,
dma_req_tx ,
dma_req_rx ,
dma_single_tx ,
dma_single_rx ,
dma_req_respq ,
dma_single_respq ,
dma_ack_respq ,
dma_req_ibiq ,
dma_single_ibiq ,
dma_ack_ibiq ,
dma_last_ibiq ,
dma_req_cmdq ,
dma_single_cmdq ,
dma_ack_cmdq ,
i3c_ip_debug ,
sb_i3c_data_oe ,
sb_i3c_clk_out ,
sb_i3c_data_out ,
sb_i3c_clk_oe ,
sb_i3c_clk_in_a ,
sb_i3c_data_in_a ) ;

$PAT_COUNT = 0 ;
foreach(@pattern)
{
`grep -hri $pattern[$PAT_COUNT] $SEARCH_PATH >> scalable_waivers2.lvw` ;
$PAT_COUNT = $PAT_COUNT + 1 ;
}
