#!/usr/bin/perl
#system('grep -0 "\[x\]" /nfs/iind/disks/iind_lpss_00018/rborthax/MAYUR_SCALABILITY_LPSS/source/rtl/sb_i3c_lite_top/sb_i3c_lite_wrapper.sv >> parameter.txt') ;


$INPUT_FILE = "scalable_waivers.lvw" ;
$OUTPUT_FILE = "out2.txt" ;
$SCALABLE_COUNT = 5 ;


open in, "$INPUT_FILE"  or die "ERROR in opening the INPUT FILE" ;
open (out, ">$OUTPUT_FILE");
@line = <in> ;

  ### pattern is the scalable parameter which will get instantiated for every new instance
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

	$PATTERN_COUNT = 0;   ### This is for looping of each pattern.

foreach (@pattern)
{
	$num=0 ;      ### This is for looping of input file  
		foreach (@line)
		{
			$COUNT = $SCALABLE_COUNT ;
			for ($x=0 ; $x<$COUNT ; $x++)
			{
				if ($line[$num] =~ m/$pattern[$PATTERN_COUNT]\\\[[0-9]\\]/)
				{
					$line[$num] =~ s/$pattern[$PATTERN_COUNT]\\\[[0-9]\\]/$pattern[$PATTERN_COUNT]\\\[$x\\]/g ;
					print out "@line[$num]" ;
				}
			}
		$num = $num + 1 ;
		}
	$PATTERN_COUNT =$PATTERN_COUNT + 1 ;
}
close(in);
close(out);
