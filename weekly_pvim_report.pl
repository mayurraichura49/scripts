#!/usr/intel/bin/perl5.14.1
### 	Author : MAYUR VIJAY RAICHURA
###	DATE : 20/11/2019
###	PURPOSE : To generate the weekly PVIM report to monitor the work progess.
###	Scipt has to be used in below manner :
###	perl weekly_report.pl ww_47.1.xlsx 19ww47.7 ww_47.1.rpt
###	
###	where
###	weekly_report.pl  :- name of script you are executing
###	ww_47.1.xlsx  :- latest version of PVIM's
###	19ww47.7  :- The work week until which I want the report. (Note this has to be given in the same format .like 19ww50.3)
###	ww_47.1.rpt :- output file to store the result .
###	
###	It will also put the output in <@ARGV[1] >_analysis.xls . 
###	For ex:-
###	For above command , output file in excel sheet will be  "19ww47.7_analysis.xls"
###	Note : This script has a lot of scope for improvement . Right now this is very dirty and inefficient version of script due to time constrain. User can  custemize this script according to their requirment.


 


use lib "/usr/intel/pkgs/perl/5.14.1/lib64/module/r1/";

use lib '/p/dnv/lv/lib/perl/cpan/lib/site_perl';
use Switch;
use strict;
use Data::Dumper;
use Spreadsheet::XLSX;
use Spreadsheet::WriteExcel;
## #!/usr/bin/perl -w
    use strict;
    use Spreadsheet::ParseExcel;

 #   my $parser   = Spreadsheet::ParseExcel->new();
#    my $parser = Spreadsheet::XLSX->new('ww_46.3.xlsx');
   # my $workbook = Spreadsheet::XLSX->new('ww_46.3.xlsx');
  #  my $workbook = Spreadsheet::XLSX->new('ww_47.1.xlsx');
    my $workbook = Spreadsheet::XLSX->new("@ARGV[0]");
  #  my $workbook = $parser->parse('perl.xls');
 #   my $workbook = $parser->parse('ww_46.3.xlsx');
    #my $worksheet = $workbook->worksheet('OperatingSystem');
    #my $worksheet = $workbook->worksheet(0);
    if ( !defined $workbook ) {
        print "Error" ;
 #       die $parser->error(), ".\n";
    }

  ###  for my $worksheet ( $workbook->worksheets() ) {       ###This is used when you want to access all the sheets present in excel. print was printed for 6 times when used above syntax
    for my $worksheet ( $workbook->worksheet("All\ TNR\ Test\ Results") ) {
     
   ##     my $row_min=0;
   ##     my $row_max=3;
   ##     my $col_min=0;
   ##     my $col_max=3;
   ##     my $col=$_[2];
   ##     my $row=$_[5];
     #   my $worksheet = $workbook->worksheet('Sheet1');
     #   my $worksheet = $workbook->worksheet('Sheet2');
###	my $owner_team = 3;
###	my $eta_request_ww = 4;
###	my $trend_end = 5;
###	my $status = 6;
###	my $test_cycle = 7;

	my $work_week_temp = @ARGV[1];
	my @work_week_temp_1 = split('ww',$work_week_temp);
	my $work_week_1 = join("","$work_week_temp_1[0]","$work_week_temp_1[1]");
	my $work_week = 200000 + $work_week_1 ;

###	my $output_file_name = @ARGV[0] ;
###	my @output_file_name_split = split('.',$output_file_name);
###	my $output_file = "$output_file_name_split[0].rpt" ;
###	print "$output_file\n" ;
###	print "$output_file_name_split[0]\n" ;
	my $output_file = "$ARGV[2]";
###	print "$output_file\n" ;
	`rm -rf $output_file` ;

        my $worksheet = $workbook->worksheet("All\ TNR\ Test\ Results");

        my $c_DFD = 0;
	my $c_DFT = 0;
	my $c_ip_chassis_gpio = 0;
	my $c_ppt_performance = 0;
	my $c_uav_fivr = 0;
	my $c_uav_gpio = 0;
	my $c_uav_pmrctop = 0;
	my $c_uav_sideband = 0;
	my $c_vjt_fuses = 0;
	my $c_vjt_nac = 0;
	my $c_vjt_north_cha_mesh_ubox_coh_con = 0;
	my $c_vjt_north_clocks = 0;
	my $c_vjt_north_concurrency = 0;
	my $c_vjt_north_core = 0;
	my $c_vjt_north_iio = 0;
	my $c_vjt_north_interrupts = 0;
	my $c_vjt_north_mem = 0;
	my $c_vjt_north_pm = 0;
	my $c_vjt_north_ras = 0;
	my $c_vjt_north_rcf = 0;
	my $c_vjt_north_reset = 0;
	my $c_vjt_north_security = 0;
	my $c_vjt_north_virtualization = 0;
	my $c_vjt_south_rcf = 0;
	my $c_vjt_south_rlink = 0;
	my $c_vjt_south_security = 0;
	my $c_vt_north_coherency = 0;
	my $c_vt_north_mpp = 0;
	my $c_vt_north_xprop = 0;
	my $c_total = 0;

        my $o_DFD = 0;
	my $o_DFT = 0;
	my $o_ip_chassis_gpio = 0;
	my $o_ppt_performance = 0;
	my $o_uav_fivr = 0;
	my $o_uav_gpio = 0;
	my $o_uav_pmrctop = 0;
	my $o_uav_sideband = 0;
	my $o_vjt_fuses = 0;
	my $o_vjt_nac = 0;
	my $o_vjt_north_cha_mesh_ubox_coh_con = 0;
	my $o_vjt_north_clocks = 0;
	my $o_vjt_north_concurrency = 0;
	my $o_vjt_north_core = 0;
	my $o_vjt_north_iio = 0;
	my $o_vjt_north_interrupts = 0;
	my $o_vjt_north_mem = 0;
	my $o_vjt_north_pm = 0;
	my $o_vjt_north_ras = 0;
	my $o_vjt_north_rcf = 0;
	my $o_vjt_north_reset = 0;
	my $o_vjt_north_security = 0;
	my $o_vjt_north_virtualization = 0;
	my $o_vjt_south_rcf = 0;
	my $o_vjt_south_rlink = 0;
	my $o_vjt_south_security = 0;
	my $o_vt_north_coherency = 0;
	my $o_vt_north_mpp = 0;
	my $o_vt_north_xprop = 0;
	my $o_total = 0;

        my $b_DFD = 0;
	my $b_DFT = 0;
	my $b_ip_chassis_gpio = 0;
	my $b_ppt_performance = 0;
	my $b_uav_fivr = 0;
	my $b_uav_gpio = 0;
	my $b_uav_pmrctop = 0;
	my $b_uav_sideband = 0;
	my $b_vjt_fuses = 0;
	my $b_vjt_nac = 0;
	my $b_vjt_north_cha_mesh_ubox_coh_con = 0;
	my $b_vjt_north_clocks = 0;
	my $b_vjt_north_concurrency = 0;
	my $b_vjt_north_core = 0;
	my $b_vjt_north_iio = 0;
	my $b_vjt_north_interrupts = 0;
	my $b_vjt_north_mem = 0;
	my $b_vjt_north_pm = 0;
	my $b_vjt_north_ras = 0;
	my $b_vjt_north_rcf = 0;
	my $b_vjt_north_reset = 0;
	my $b_vjt_north_security = 0;
	my $b_vjt_north_virtualization = 0;
	my $b_vjt_south_rcf = 0;
	my $b_vjt_south_rlink = 0;
	my $b_vjt_south_security = 0;
	my $b_vt_north_coherency = 0;
	my $b_vt_north_mpp = 0;
	my $b_vt_north_xprop = 0;
	my $b_total = 0;
	my $trend_end_actual = 0;



        my $total_c_DFD = 0;
	my $total_c_DFT = 0;
	my $total_c_ip_chassis_gpio = 0;
	my $total_c_ppt_performance = 0;
	my $total_c_uav_fivr = 0;
	my $total_c_uav_gpio = 0;
	my $total_c_uav_pmrctop = 0;
	my $total_c_uav_sideband = 0;
	my $total_c_vjt_fuses = 0;
	my $total_c_vjt_nac = 0;
	my $total_c_vjt_north_cha_mesh_ubox_coh_con = 0;
	my $total_c_vjt_north_clocks = 0;
	my $total_c_vjt_north_concurrency = 0;
	my $total_c_vjt_north_core = 0;
	my $total_c_vjt_north_iio = 0;
	my $total_c_vjt_north_interrupts = 0;
	my $total_c_vjt_north_mem = 0;
	my $total_c_vjt_north_pm = 0;
	my $total_c_vjt_north_ras = 0;
	my $total_c_vjt_north_rcf = 0;
	my $total_c_vjt_north_reset = 0;
	my $total_c_vjt_north_security = 0;
	my $total_c_vjt_north_virtualization = 0;
	my $total_c_vjt_south_rcf = 0;
	my $total_c_vjt_south_rlink = 0;
	my $total_c_vjt_south_security = 0;
	my $total_c_vt_north_coherency = 0;
	my $total_c_vt_north_mpp = 0;
	my $total_c_vt_north_xprop = 0;
	my $total_c_total = 0;

        my $total_o_DFD = 0;
	my $total_o_DFT = 0;
	my $total_o_ip_chassis_gpio = 0;
	my $total_o_ppt_performance = 0;
	my $total_o_uav_fivr = 0;
	my $total_o_uav_gpio = 0;
	my $total_o_uav_pmrctop = 0;
	my $total_o_uav_sideband = 0;
	my $total_o_vjt_fuses = 0;
	my $total_o_vjt_nac = 0;
	my $total_o_vjt_north_cha_mesh_ubox_coh_con = 0;
	my $total_o_vjt_north_clocks = 0;
	my $total_o_vjt_north_concurrency = 0;
	my $total_o_vjt_north_core = 0;
	my $total_o_vjt_north_iio = 0;
	my $total_o_vjt_north_interrupts = 0;
	my $total_o_vjt_north_mem = 0;
	my $total_o_vjt_north_pm = 0;
	my $total_o_vjt_north_ras = 0;
	my $total_o_vjt_north_rcf = 0;
	my $total_o_vjt_north_reset = 0;
	my $total_o_vjt_north_security = 0;
	my $total_o_vjt_north_virtualization = 0;
	my $total_o_vjt_south_rcf = 0;
	my $total_o_vjt_south_rlink = 0;
	my $total_o_vjt_south_security = 0;
	my $total_o_vt_north_coherency = 0;
	my $total_o_vt_north_mpp = 0;
	my $total_o_vt_north_xprop = 0;
	my $total_o_total = 0;

        my $total_b_DFD = 0;
	my $total_b_DFT = 0;
	my $total_b_ip_chassis_gpio = 0;
	my $total_b_ppt_performance = 0;
	my $total_b_uav_fivr = 0;
	my $total_b_uav_gpio = 0;
	my $total_b_uav_pmrctop = 0;
	my $total_b_uav_sideband = 0;
	my $total_b_vjt_fuses = 0;
	my $total_b_vjt_nac = 0;
	my $total_b_vjt_north_cha_mesh_ubox_coh_con = 0;
	my $total_b_vjt_north_clocks = 0;
	my $total_b_vjt_north_concurrency = 0;
	my $total_b_vjt_north_core = 0;
	my $total_b_vjt_north_iio = 0;
	my $total_b_vjt_north_interrupts = 0;
	my $total_b_vjt_north_mem = 0;
	my $total_b_vjt_north_pm = 0;
	my $total_b_vjt_north_ras = 0;
	my $total_b_vjt_north_rcf = 0;
	my $total_b_vjt_north_reset = 0;
	my $total_b_vjt_north_security = 0;
	my $total_b_vjt_north_virtualization = 0;
	my $total_b_vjt_south_rcf = 0;
	my $total_b_vjt_south_rlink = 0;
	my $total_b_vjt_south_security = 0;
	my $total_b_vt_north_coherency = 0;
	my $total_b_vt_north_mpp = 0;
	my $total_b_vt_north_xprop = 0;
	my $total_b_total = 0;
	my $total_trend_end_actual = 0;


         my ( $row_min, $row_max ) = $worksheet->row_range();
         my ( $col_min, $col_max ) = $worksheet->col_range();

        for my $row ( $row_min .. $row_max ) {
	       my $id = $worksheet->get_cell( $row, 0); 
	       my $title = $worksheet->get_cell( $row, 1); 
	       my $owner_team = $worksheet->get_cell( $row, 3); 
	       my $eta_request_ww = $worksheet->get_cell( $row, 4 ); 
	       my $trend_end = $worksheet->get_cell( $row, 5 ); 
	       my $status = $worksheet->get_cell( $row, 6 ); 
	       my $test_cycle = $worksheet->get_cell( $row, 8 ); 
	if($trend_end)
	{
	       my @trend_end_all = split('ww',$trend_end->value());
	       my $trend_end_actual = join ("","$trend_end_all[0]","$trend_end_all[1]");

		  if($trend_end_actual <= $work_week & $test_cycle->value() =~ /0p8/) {
		switch($owner_team->value()){
				case "uav.dfd"	{switch($status->value()) { case "complete" {$c_DFD++;} case "open" {$o_DFD++;} case "blocked" {$b_DFD++;}} }
				case "uav.dft"			 		{switch($status->value()) { case "complete" {$c_DFT++;} case "open" {$o_DFT++;} case "blocked" {$b_DFT++;}}}			
				case "ip.chassis.gpio"				{switch($status->value()) { case "complete" {$c_ip_chassis_gpio++;} case "open" {$o_ip_chassis_gpio++;} case "blocked" {$b_ip_chassis_gpio++;}}	 }				
				case "ppt.performance"				{switch($status->value()) { case "complete" {$c_ppt_performance++;} case "open" {$o_ppt_performance++;} case "blocked" {$b_ppt_performance++;}}	 }					
				case "uav.fivr"					{switch($status->value()) { case "complete" {$c_uav_fivr++;} case "open" {$o_uav_fivr++;} case "blocked" {$b_uav_fivr++;}}	 }					
				case "uav.gpio"					{switch($status->value()) { case "complete" {$c_uav_gpio++;} case "open" {$o_uav_gpio++;} case "blocked" {$b_uav_gpio++;}}	 }					
				case "uav.pmrctop"				{switch($status->value()) { case "complete" {$c_uav_pmrctop++;} case "open" {$o_uav_pmrctop++;} case "blocked" {$b_uav_pmrctop++;}}	 }						
				case "uav.sideband"				{switch($status->value()) { case "complete" {$c_uav_sideband++;} case "open" {$o_uav_sideband++;} case "blocked" {$b_uav_sideband++;}}	 }					
				case "vjt.fuses"				{switch($status->value()) { case "complete" {$c_vjt_fuses++;} case "open" {$o_vjt_fuses++;} case "blocked" {$b_vjt_fuses++;}}		 }		
				case "vjt.nac"					{switch($status->value()) { case "complete" {$c_vjt_nac++;} case "open" {$o_vjt_nac++;} case "blocked" {$b_vjt_nac++;}}			 }		
				case "vjt.north.cha_mesh_ubox_coh_con"		{switch($status->value()) { case "complete" {$c_vjt_north_cha_mesh_ubox_coh_con++;} case "open" {$o_vjt_north_cha_mesh_ubox_coh_con++;} case "blocked" {$b_vjt_north_cha_mesh_ubox_coh_con++;}}			 }			
				case "vjt.north.clocks"				{switch($status->value()) { case "complete" {$c_vjt_north_clocks++;} case "open" {$o_vjt_north_clocks++;} case "blocked" {$b_vjt_north_clocks++;}}	 }						
				case "vjt.north.concurrency"			{switch($status->value()) { case "complete" {$c_vjt_north_concurrency++;} case "open" {$o_vjt_north_concurrency++;} case "blocked" {$b_vjt_north_concurrency++;}}	 }					
				case "vjt.north.core"				{switch($status->value()) { case "complete" {$c_vjt_north_core++;} case "open" {$o_vjt_north_core++;} case "blocked" {$b_vjt_north_core++;}}	 }				
				case "vjt.north.iio"				{switch($status->value()) { case "complete" {$c_vjt_north_iio++;} case "open" {$o_vjt_north_iio++;} case "blocked" {$b_vjt_north_iio++;}}	 }				
				case "vjt.north.interrupts"			{switch($status->value()) { case "complete" {$c_vjt_north_interrupts++;} case "open" {$o_vjt_north_interrupts++;} case "blocked" {$b_vjt_north_interrupts++;}}	 }		
				case "vjt.north.mem"				{switch($status->value()) { case "complete" {$c_vjt_north_mem++;} case "open" {$o_vjt_north_mem++;} case "blocked" {$b_vjt_north_mem++;}}	 }				
				case "vjt.north.pm"		 		{switch($status->value()) { case "complete" {$c_vjt_north_pm++;} case "open" {$o_vjt_north_pm++;} case "blocked" {$b_vjt_north_pm++;}}		 }			
				case "vjt.north.ras"				{switch($status->value()) { case "complete" {$c_vjt_north_ras++;} case "open" {$o_vjt_north_ras++;} case "blocked" {$b_vjt_north_ras++;}}	 }				
				case "vjt.north.rcf"			{switch($status->value()) { case "complete" {$c_vjt_north_rcf++;} case "open" {$o_vjt_north_rcf++;} case "blocked" {$b_vjt_north_rcf++;}}	 }				
				case "vjt.north.reset"				{switch($status->value()) { case "complete" {$c_vjt_north_reset++;} case "open" {$o_vjt_north_reset++;} case "blocked" {$b_vjt_north_reset++;}}	 }			
				case "vjt.north.security"			{switch($status->value()) { case "complete" {$c_vjt_north_security++;} case "open" {$o_vjt_north_security++;} case "blocked" {$b_vjt_north_security++;}}	 }			
				case "vjt.north.virtualization"			{switch($status->value()) { case "complete" {$c_vjt_north_virtualization++;} case "open" {$o_vjt_north_virtualization++;} case "blocked" {$b_vjt_north_virtualization++;}}				 }
				case "vjt.south.rcf"				{switch($status->value()) { case "complete" {$c_vjt_south_rcf++;} case "open" {$o_vjt_south_rcf++;} case "blocked" {$b_vjt_south_rcf++;}}	 }				
				case "vjt.south.rlink"				{switch($status->value()) { case "complete" {$c_vjt_south_rlink++;} case "open" {$o_vjt_south_rlink++;} case "blocked" {$b_vjt_south_rlink++;}}		 }			
				case "vjt.south.security"			{switch($status->value()) { case "complete" {$c_vjt_south_security++;} case "open" {$o_vjt_south_security++;} case "blocked" {$b_vjt_south_security++;}}	 }		
				case "vt.north.coherency"			{switch($status->value()) { case "complete" {$c_vt_north_coherency++;} case "open" {$o_vt_north_coherency++;} case "blocked" {$b_vt_north_coherency++;}}	 }		
				case "vt.north.mpp"				{switch($status->value()) { case "complete" {$c_vt_north_mpp++;} case "open" {$o_vt_north_mpp++;} case "blocked" {$b_vt_north_mpp++;}}		 }			
				case "vt.north.xprop"				{switch($status->value()) { case "complete" {$c_vt_north_xprop++;} case "open" {$o_vt_north_xprop++;} case "blocked" {$b_vt_north_xprop++;}}	 }				
				else		{}

			}
      ###	if($owner_team->value()=~ "vjt.north.interrupts") {print "",$title->value(),"\n" ;}
      ###		print "",$owner_team->value(),"\n" ;
      ###		print "",$id->value(),"\n" ;
      ###		print "",$title->value(),"\n" ;
      ###  		print "$trend_end_actual\n";
		switch($status->value()){
			case "complete" 	{$c_total++;}
			case "open" 		{$o_total++;}
			case "blocked" 		{$b_total++;}

		}
		    }
	}
}
###	print("DFD :- complete - $c_DFD    open - $o_DFD   blocked - $b_DFD\n");
###	print("ppt_performance :- complete - $c_ppt_performance    open - $o_ppt_performance   blocked - $b_ppt_performance\n");
###	print("ppt_performance	$c_ppt_performance    $o_ppt_performance   $b_ppt_performance\n");
print "\nBelow report is for the 0p8 PVIMs untill this WW\n" ;
print("DFD					$c_DFD		$o_DFD		$b_DFD \n");
print("DFT					$c_DFT		$o_DFT		$b_DFT \n");
print("ip_chassis_gpio				$c_ip_chassis_gpio		$o_ip_chassis_gpio		$b_ip_chassis_gpio \n");
print("ppt_performance				$c_ppt_performance		$o_ppt_performance		$b_ppt_performance \n");
print("uav_fivr				$c_uav_fivr		$o_uav_fivr		$b_uav_fivr \n");
print("uav_gpio				$c_uav_gpio		$o_uav_gpio		$b_uav_gpio \n");
print("uav_pmrctop				$c_uav_pmrctop		$o_uav_pmrctop		$b_uav_pmrctop \n");
print("uav_sideband				$c_uav_sideband		$o_uav_sideband		$b_uav_sideband \n");
print("vjt_fuses				$c_vjt_fuses		$o_vjt_fuses		$b_vjt_fuses \n");
print("vjt_nac					$c_vjt_nac		$o_vjt_nac		$b_vjt_nac \n");
print("vjt_north_cha_mesh_ubox_coh_con		$c_vjt_north_cha_mesh_ubox_coh_con		$o_vjt_north_cha_mesh_ubox_coh_con		$b_vjt_north_cha_mesh_ubox_coh_con \n");
print("vjt_north_clocks			$c_vjt_north_clocks		$o_vjt_north_clocks		$b_vjt_north_clocks \n");
print("vjt_north_concurrency			$c_vjt_north_concurrency		$o_vjt_north_concurrency		$b_vjt_north_concurrency \n");
print("vjt_north_core				$c_vjt_north_core		$o_vjt_north_core		$b_vjt_north_core \n");
print("vjt_north_iio				$c_vjt_north_iio		$o_vjt_north_iio		$b_vjt_north_iio \n");
print("vjt_north_interrupts			$c_vjt_north_interrupts		$o_vjt_north_interrupts		$b_vjt_north_interrupts \n");
print("vjt_north_mem				$c_vjt_north_mem		$o_vjt_north_mem		$b_vjt_north_mem \n");
print("vjt_north_pm				$c_vjt_north_pm		$o_vjt_north_pm		$b_vjt_north_pm \n");
print("vjt_north_ras				$c_vjt_north_ras		$o_vjt_north_ras		$b_vjt_north_ras \n");
print("vjt_north_rcf				$c_vjt_north_rcf		$o_vjt_north_rcf		$b_vjt_north_rcf \n");
print("vjt_north_reset				$c_vjt_north_reset		$o_vjt_north_reset		$b_vjt_north_reset \n");
print("vjt_north_security			$c_vjt_north_security		$o_vjt_north_security		$b_vjt_north_security \n");
print("vjt_north_virtualization		$c_vjt_north_virtualization		$o_vjt_north_virtualization		$b_vjt_north_virtualization \n");
print("vjt_south_rcf				$c_vjt_south_rcf		$o_vjt_south_rcf		$b_vjt_south_rcf \n");
print("vjt_south_rlink				$c_vjt_south_rlink		$o_vjt_south_rlink		$b_vjt_south_rlink \n");
print("vjt_south_security			$c_vjt_south_security		$o_vjt_south_security		$b_vjt_south_security \n");
print("vt_north_coherency			$c_vt_north_coherency		$o_vt_north_coherency		$b_vt_north_coherency \n");
print("vt_north_mpp				$c_vt_north_mpp		$o_vt_north_mpp		$b_vt_north_mpp \n");
print("vt_north_xprop				$c_vt_north_xprop		$o_vt_north_xprop		$b_vt_north_xprop \n");
print("Total					$c_total		$o_total		$b_total \n");

`echo "\nBelow report is for the 0p8 PVIMs untill this WW\n"  >> $output_file  `;
`echo "DFD					$c_DFD		$o_DFD		$b_DFD " >> $output_file`;
`echo "DFT					$c_DFT		$o_DFT		$b_DFT " >> $output_file`;
`echo "ip_chassis_gpio				$c_ip_chassis_gpio		$o_ip_chassis_gpio		$b_ip_chassis_gpio " >> $output_file`;
`echo "ppt_performance				$c_ppt_performance		$o_ppt_performance		$b_ppt_performance " >> $output_file`;
`echo "uav_fivr				$c_uav_fivr		$o_uav_fivr		$b_uav_fivr " >> $output_file`;
`echo "uav_gpio				$c_uav_gpio		$o_uav_gpio		$b_uav_gpio " >> $output_file`;
`echo "uav_pmrctop				$c_uav_pmrctop		$o_uav_pmrctop		$b_uav_pmrctop " >> $output_file`;
`echo "uav_sideband				$c_uav_sideband		$o_uav_sideband		$b_uav_sideband " >> $output_file`;
`echo "vjt_fuses				$c_vjt_fuses		$o_vjt_fuses		$b_vjt_fuses " >> $output_file`;
`echo "vjt_nac					$c_vjt_nac		$o_vjt_nac		$b_vjt_nac " >> $output_file`;
`echo "vjt_north_cha_mesh_ubox_coh_con		$c_vjt_north_cha_mesh_ubox_coh_con		$o_vjt_north_cha_mesh_ubox_coh_con		$b_vjt_north_cha_mesh_ubox_coh_con " >> $output_file`;
`echo "vjt_north_clocks			$c_vjt_north_clocks		$o_vjt_north_clocks		$b_vjt_north_clocks " >> $output_file`;
`echo "vjt_north_concurrency			$c_vjt_north_concurrency		$o_vjt_north_concurrency		$b_vjt_north_concurrency " >> $output_file`;
`echo "vjt_north_core				$c_vjt_north_core		$o_vjt_north_core		$b_vjt_north_core " >> $output_file`;
`echo "vjt_north_iio				$c_vjt_north_iio		$o_vjt_north_iio		$b_vjt_north_iio " >> $output_file`;
`echo "vjt_north_interrupts			$c_vjt_north_interrupts		$o_vjt_north_interrupts		$b_vjt_north_interrupts " >> $output_file`;
`echo "vjt_north_mem				$c_vjt_north_mem		$o_vjt_north_mem		$b_vjt_north_mem " >> $output_file`;
`echo "vjt_north_pm				$c_vjt_north_pm		$o_vjt_north_pm		$b_vjt_north_pm " >> $output_file`;
`echo "vjt_north_ras				$c_vjt_north_ras		$o_vjt_north_ras		$b_vjt_north_ras " >> $output_file`;
`echo "vjt_north_rcf				$c_vjt_north_rcf		$o_vjt_north_rcf		$b_vjt_north_rcf " >> $output_file`;
`echo "vjt_north_reset				$c_vjt_north_reset		$o_vjt_north_reset		$b_vjt_north_reset " >> $output_file`;
`echo "vjt_north_security			$c_vjt_north_security		$o_vjt_north_security		$b_vjt_north_security " >> $output_file`;
`echo "vjt_north_virtualization		$c_vjt_north_virtualization		$o_vjt_north_virtualization		$b_vjt_north_virtualization " >> $output_file`;
`echo "vjt_south_rcf				$c_vjt_south_rcf		$o_vjt_south_rcf		$b_vjt_south_rcf " >> $output_file`;
`echo "vjt_south_rlink				$c_vjt_south_rlink		$o_vjt_south_rlink		$b_vjt_south_rlink " >> $output_file`;
`echo "vjt_south_security			$c_vjt_south_security		$o_vjt_south_security		$b_vjt_south_security " >> $output_file`;
`echo "vt_north_coherency			$c_vt_north_coherency		$o_vt_north_coherency		$b_vt_north_coherency " >> $output_file`;
`echo "vt_north_mpp				$c_vt_north_mpp		$o_vt_north_mpp		$b_vt_north_mpp " >> $output_file`;
`echo "vt_north_xprop				$c_vt_north_xprop		$o_vt_north_xprop		$b_vt_north_xprop " >> $output_file`;
`echo "Total					$c_total		$o_total		$b_total " >> $output_file`;




        for my $row ( $row_min .. $row_max ) {
	       my $id = $worksheet->get_cell( $row, 0); 
	       my $title = $worksheet->get_cell( $row, 1); 
	       my $owner_team = $worksheet->get_cell( $row, 3); 
	       my $eta_request_ww = $worksheet->get_cell( $row, 4 ); 
	       my $trend_end = $worksheet->get_cell( $row, 5 ); 
	       my $status = $worksheet->get_cell( $row, 6 ); 
	       my $test_cycle = $worksheet->get_cell( $row, 8 ); 
if($trend_end)
{
###	       my @trend_end_all = split('ww',$trend_end->value());
###	       my $trend_end_actual = join ("","$trend_end_all[0]","$trend_end_all[1]");

		  if($test_cycle->value() =~ /0p8/) {
		switch($owner_team->value()){
				case "uav.dfd"	{switch($status->value()) { case "complete" {$total_c_DFD++;} case "open" {$total_o_DFD++;} case "blocked" {$total_b_DFD++;}} }
				case "uav.dft"			 		{switch($status->value()) { case "complete" {$total_c_DFT++;} case "open" {$total_o_DFT++;} case "blocked" {$total_b_DFT++;}}}			
				case "ip.chassis.gpio"				{switch($status->value()) { case "complete" {$c_ip_chassis_gpio++;} case "open" {$o_ip_chassis_gpio++;} case "blocked" {$total_b_ip_chassis_gpio++;}}	 }				
				case "ppt.performance"				{switch($status->value()) { case "complete" {$total_c_ppt_performance++;} case "open" {$total_o_ppt_performance++;} case "blocked" {$total_b_ppt_performance++;}}	 }					
				case "uav.fivr"					{switch($status->value()) { case "complete" {$total_c_uav_fivr++;} case "open" {$total_o_uav_fivr++;} case "blocked" {$total_b_uav_fivr++;}}	 }					
				case "uav.gpio"					{switch($status->value()) { case "complete" {$total_c_uav_gpio++;} case "open" {$total_o_uav_gpio++;} case "blocked" {$total_b_uav_gpio++;}}	 }					
				case "uav.pmrctop"				{switch($status->value()) { case "complete" {$total_c_uav_pmrctop++;} case "open" {$total_o_uav_pmrctop++;} case "blocked" {$total_b_uav_pmrctop++;}}	 }						
				case "uav.sideband"				{switch($status->value()) { case "complete" {$total_c_uav_sideband++;} case "open" {$total_o_uav_sideband++;} case "blocked" {$total_b_uav_sideband++;}}	 }					
				case "vjt.fuses"				{switch($status->value()) { case "complete" {$total_c_vjt_fuses++;} case "open" {$total_o_vjt_fuses++;} case "blocked" {$total_b_vjt_fuses++;}}		 }		
				case "vjt.nac"					{switch($status->value()) { case "complete" {$total_c_vjt_nac++;} case "open" {$total_o_vjt_nac++;} case "blocked" {$total_b_vjt_nac++;}}			 }		
				case "vjt.north.cha_mesh_ubox_coh_con"		{switch($status->value()) { case "complete" {$total_c_vjt_north_cha_mesh_ubox_coh_con++;} case "open" {$total_o_vjt_north_cha_mesh_ubox_coh_con++;} case "blocked" {$total_b_vjt_north_cha_mesh_ubox_coh_con++;}}			 }			
				case "vjt.north.clocks"				{switch($status->value()) { case "complete" {$total_c_vjt_north_clocks++;} case "open" {$total_o_vjt_north_clocks++;} case "blocked" {$total_b_vjt_north_clocks++;}}	 }						
				case "vjt.north.concurrency"			{switch($status->value()) { case "complete" {$total_c_vjt_north_concurrency++;} case "open" {$total_o_vjt_north_concurrency++;} case "blocked" {$total_b_vjt_north_concurrency++;}}	 }					
				case "vjt.north.core"				{switch($status->value()) { case "complete" {$total_c_vjt_north_core++;} case "open" {$total_o_vjt_north_core++;} case "blocked" {$total_b_vjt_north_core++;}}	 }				
				case "vjt.north.iio"				{switch($status->value()) { case "complete" {$total_c_vjt_north_iio++;} case "open" {$total_o_vjt_north_iio++;} case "blocked" {$total_b_vjt_north_iio++;}}	 }				
				case "vjt.north.interrupts"			{switch($status->value()) { case "complete" {$total_c_vjt_north_interrupts++;} case "open" {$total_o_vjt_north_interrupts++;} case "blocked" {$total_b_vjt_north_interrupts++;}}	 }		
				case "vjt.north.mem"				{switch($status->value()) { case "complete" {$total_c_vjt_north_mem++;} case "open" {$total_o_vjt_north_mem++;} case "blocked" {$total_b_vjt_north_mem++;}}	 }				
				case "vjt.north.pm"		 		{switch($status->value()) { case "complete" {$total_c_vjt_north_pm++;} case "open" {$total_o_vjt_north_pm++;} case "blocked" {$total_b_vjt_north_pm++;}}		 }			
				case "vjt.north.ras"				{switch($status->value()) { case "complete" {$total_c_vjt_north_ras++;} case "open" {$total_o_vjt_north_ras++;} case "blocked" {$total_b_vjt_north_ras++;}}	 }				
				case "vjt.north.rcf"			{switch($status->value()) { case "complete" {$total_c_vjt_north_rcf++;} case "open" {$total_o_vjt_north_rcf++;} case "blocked" {$total_b_vjt_north_rcf++;}}	 }				
				case "vjt.north.reset"				{switch($status->value()) { case "complete" {$total_c_vjt_north_reset++;} case "open" {$total_o_vjt_north_reset++;} case "blocked" {$total_b_vjt_north_reset++;}}	 }			
				case "vjt.north.security"			{switch($status->value()) { case "complete" {$total_c_vjt_north_security++;} case "open" {$total_o_vjt_north_security++;} case "blocked" {$total_b_vjt_north_security++;}}	 }			
				case "vjt.north.virtualization"			{switch($status->value()) { case "complete" {$total_c_vjt_north_virtualization++;} case "open" {$total_o_vjt_north_virtualization++;} case "blocked" {$total_b_vjt_north_virtualization++;}}				 }
				case "vjt.south.rcf"				{switch($status->value()) { case "complete" {$total_c_vjt_south_rcf++;} case "open" {$total_o_vjt_south_rcf++;} case "blocked" {$total_b_vjt_south_rcf++;}}	 }				
				case "vjt.south.rlink"				{switch($status->value()) { case "complete" {$total_c_vjt_south_rlink++;} case "open" {$total_o_vjt_south_rlink++;} case "blocked" {$total_b_vjt_south_rlink++;}}		 }			
				case "vjt.south.security"			{switch($status->value()) { case "complete" {$total_c_vjt_south_security++;} case "open" {$total_o_vjt_south_security++;} case "blocked" {$total_b_vjt_south_security++;}}	 }		
				case "vt.north.coherency"			{switch($status->value()) { case "complete" {$total_c_vt_north_coherency++;} case "open" {$total_o_vt_north_coherency++;} case "blocked" {$total_b_vt_north_coherency++;}}	 }		
				case "vt.north.mpp"				{switch($status->value()) { case "complete" {$total_c_vt_north_mpp++;} case "open" {$total_o_vt_north_mpp++;} case "blocked" {$total_b_vt_north_mpp++;}}		 }			
				case "vt.north.xprop"				{switch($status->value()) { case "complete" {$total_c_vt_north_xprop++;} case "open" {$total_o_vt_north_xprop++;} case "blocked" {$total_b_vt_north_xprop++;}}	 }				
				else		{}

			}
      ###	if($owner_team->value()=~ "vjt.north.interrupts") {print "",$title->value(),"\n" ;}
      ###		print "",$owner_team->value(),"\n" ;
      ###		print "",$id->value(),"\n" ;
      ###		print "",$title->value(),"\n" ;
      ###  		print "$trend_end_actual\n";
		switch($status->value()){
			case "complete" 	{$total_c_total++;}
			case "open" 		{$total_o_total++;}
			case "blocked" 		{$total_b_total++;}

		}
		    }
	}
}
###	print("DFD :- complete - $total_c_DFD    open - $total_o_DFD   blocked - $total_b_DFD\n");
###	print("ppt_performance :- complete - $total_c_ppt_performance    open - $total_o_ppt_performance   blocked - $total_b_ppt_performance\n");
###	print("ppt_performance	$total_c_ppt_performance    $total_o_ppt_performance   $total_b_ppt_performance\n");
print "\nBelow report is for the total 0p8 PVIMs\n" ;
print("DFD					$total_c_DFD		$total_o_DFD		$total_b_DFD \n");
print("DFT					$total_c_DFT		$total_o_DFT		$total_b_DFT \n");
print("ip_chassis_gpio				$total_c_ip_chassis_gpio		$total_o_ip_chassis_gpio		$total_b_ip_chassis_gpio \n");
print("ppt_performance				$total_c_ppt_performance		$total_o_ppt_performance		$total_b_ppt_performance \n");
print("uav_fivr				$total_c_uav_fivr		$total_o_uav_fivr		$total_b_uav_fivr \n");
print("uav_gpio				$total_c_uav_gpio		$total_o_uav_gpio		$total_b_uav_gpio \n");
print("uav_pmrctop				$total_c_uav_pmrctop		$total_o_uav_pmrctop		$total_b_uav_pmrctop \n");
print("uav_sideband				$total_c_uav_sideband		$total_o_uav_sideband		$total_b_uav_sideband \n");
print("vjt_fuses				$total_c_vjt_fuses		$total_o_vjt_fuses		$total_b_vjt_fuses \n");
print("vjt_nac					$total_c_vjt_nac		$total_o_vjt_nac		$total_b_vjt_nac \n");
print("vjt_north_cha_mesh_ubox_coh_con		$total_c_vjt_north_cha_mesh_ubox_coh_con		$total_o_vjt_north_cha_mesh_ubox_coh_con		$total_b_vjt_north_cha_mesh_ubox_coh_con \n");
print("vjt_north_clocks			$total_c_vjt_north_clocks		$total_o_vjt_north_clocks		$total_b_vjt_north_clocks \n");
print("vjt_north_concurrency			$total_c_vjt_north_concurrency		$total_o_vjt_north_concurrency		$total_b_vjt_north_concurrency \n");
print("vjt_north_core				$total_c_vjt_north_core		$total_o_vjt_north_core		$total_b_vjt_north_core \n");
print("vjt_north_iio				$total_c_vjt_north_iio		$total_o_vjt_north_iio		$total_b_vjt_north_iio \n");
print("vjt_north_interrupts			$total_c_vjt_north_interrupts		$total_o_vjt_north_interrupts		$total_b_vjt_north_interrupts \n");
print("vjt_north_mem				$total_c_vjt_north_mem		$total_o_vjt_north_mem		$total_b_vjt_north_mem \n");
print("vjt_north_pm				$total_c_vjt_north_pm		$total_o_vjt_north_pm		$total_b_vjt_north_pm \n");
print("vjt_north_ras				$total_c_vjt_north_ras		$total_o_vjt_north_ras		$total_b_vjt_north_ras \n");
print("vjt_north_rcf				$total_c_vjt_north_rcf		$total_o_vjt_north_rcf		$total_b_vjt_north_rcf \n");
print("vjt_north_reset				$total_c_vjt_north_reset		$total_o_vjt_north_reset		$total_b_vjt_north_reset \n");
print("vjt_north_security			$total_c_vjt_north_security		$total_o_vjt_north_security		$total_b_vjt_north_security \n");
print("vjt_north_virtualization		$total_c_vjt_north_virtualization		$total_o_vjt_north_virtualization		$total_b_vjt_north_virtualization \n");
print("vjt_south_rcf				$total_c_vjt_south_rcf		$total_o_vjt_south_rcf		$total_b_vjt_south_rcf \n");
print("vjt_south_rlink				$total_c_vjt_south_rlink		$total_o_vjt_south_rlink		$total_b_vjt_south_rlink \n");
print("vjt_south_security			$total_c_vjt_south_security		$total_o_vjt_south_security		$total_b_vjt_south_security \n");
print("vt_north_coherency			$total_c_vt_north_coherency		$total_o_vt_north_coherency		$total_b_vt_north_coherency \n");
print("vt_north_mpp				$total_c_vt_north_mpp		$total_o_vt_north_mpp		$total_b_vt_north_mpp \n");
print("vt_north_xprop				$total_c_vt_north_xprop		$total_o_vt_north_xprop		$total_b_vt_north_xprop \n");
print("Total					$total_c_total		$total_o_total		$total_b_total \n");

`echo "\nBelow report is for the total 0p8 PVIMs\n"  >> $output_file `;
`echo "DFD					$total_c_DFD		$total_o_DFD		$total_b_DFD " >> $output_file`;
`echo "DFT					$total_c_DFT		$total_o_DFT		$total_b_DFT " >> $output_file`;
`echo "ip_chassis_gpio				$total_c_ip_chassis_gpio		$total_o_ip_chassis_gpio		$total_b_ip_chassis_gpio " >> $output_file`;
`echo "ppt_performance				$total_c_ppt_performance		$total_o_ppt_performance		$total_b_ppt_performance " >> $output_file`;
`echo "uav_fivr				$total_c_uav_fivr		$total_o_uav_fivr		$total_b_uav_fivr " >> $output_file`;
`echo "uav_gpio				$total_c_uav_gpio		$total_o_uav_gpio		$total_b_uav_gpio " >> $output_file`;
`echo "uav_pmrctop				$total_c_uav_pmrctop		$total_o_uav_pmrctop		$total_b_uav_pmrctop " >> $output_file`;
`echo "uav_sideband				$total_c_uav_sideband		$total_o_uav_sideband		$total_b_uav_sideband " >> $output_file`;
`echo "vjt_fuses				$total_c_vjt_fuses		$total_o_vjt_fuses		$total_b_vjt_fuses " >> $output_file`;
`echo "vjt_nac					$total_c_vjt_nac		$total_o_vjt_nac		$total_b_vjt_nac " >> $output_file`;
`echo "vjt_north_cha_mesh_ubox_coh_con		$total_c_vjt_north_cha_mesh_ubox_coh_con		$total_o_vjt_north_cha_mesh_ubox_coh_con		$total_b_vjt_north_cha_mesh_ubox_coh_con " >> $output_file`;
`echo "vjt_north_clocks			$total_c_vjt_north_clocks		$total_o_vjt_north_clocks		$total_b_vjt_north_clocks " >> $output_file`;
`echo "vjt_north_concurrency			$total_c_vjt_north_concurrency		$total_o_vjt_north_concurrency		$total_b_vjt_north_concurrency " >> $output_file`;
`echo "vjt_north_core				$total_c_vjt_north_core		$total_o_vjt_north_core		$total_b_vjt_north_core " >> $output_file`;
`echo "vjt_north_iio				$total_c_vjt_north_iio		$total_o_vjt_north_iio		$total_b_vjt_north_iio " >> $output_file`;
`echo "vjt_north_interrupts			$total_c_vjt_north_interrupts		$total_o_vjt_north_interrupts		$total_b_vjt_north_interrupts " >> $output_file`;
`echo "vjt_north_mem				$total_c_vjt_north_mem		$total_o_vjt_north_mem		$total_b_vjt_north_mem " >> $output_file`;
`echo "vjt_north_pm				$total_c_vjt_north_pm		$total_o_vjt_north_pm		$total_b_vjt_north_pm " >> $output_file`;
`echo "vjt_north_ras				$total_c_vjt_north_ras		$total_o_vjt_north_ras		$total_b_vjt_north_ras " >> $output_file`;
`echo "vjt_north_rcf				$total_c_vjt_north_rcf		$total_o_vjt_north_rcf		$total_b_vjt_north_rcf " >> $output_file`;
`echo "vjt_north_reset				$total_c_vjt_north_reset		$total_o_vjt_north_reset		$total_b_vjt_north_reset " >> $output_file`;
`echo "vjt_north_security			$total_c_vjt_north_security		$total_o_vjt_north_security		$total_b_vjt_north_security " >> $output_file`;
`echo "vjt_north_virtualization		$total_c_vjt_north_virtualization		$total_o_vjt_north_virtualization		$total_b_vjt_north_virtualization " >> $output_file`;
`echo "vjt_south_rcf				$total_c_vjt_south_rcf		$total_o_vjt_south_rcf		$total_b_vjt_south_rcf " >> $output_file`;
`echo "vjt_south_rlink				$total_c_vjt_south_rlink		$total_o_vjt_south_rlink		$total_b_vjt_south_rlink " >> $output_file`;
`echo "vjt_south_security			$total_c_vjt_south_security		$total_o_vjt_south_security		$total_b_vjt_south_security " >> $output_file`;
`echo "vt_north_coherency			$total_c_vt_north_coherency		$total_o_vt_north_coherency		$total_b_vt_north_coherency " >> $output_file`;
`echo "vt_north_mpp				$total_c_vt_north_mpp		$total_o_vt_north_mpp		$total_b_vt_north_mpp " >> $output_file`;
`echo "vt_north_xprop				$total_c_vt_north_xprop		$total_o_vt_north_xprop		$total_b_vt_north_xprop " >> $output_file`;
`echo "Total					$total_c_total		$total_o_total		$total_b_total " >> $output_file`;



        }


open (input_file, "@ARGV[2]")or die "Couldn't open file , $!";;
my @data=<input_file>;
close(input_file);
# Create a new Excel workbook
my $workbook = Spreadsheet::WriteExcel->new("@ARGV[1]_analysis.xls");

# Add a worksheet
my $worksheet = $workbook->add_worksheet('ww');
#$worksheet = $workbook->add_worksheet(total);

#  Add and define a format
my $format = $workbook->add_format(); # Add a format
$format->set_bold();
$format->set_color('red');
$format->set_align('center');


 # $worksheet->write(0, 0, "Row Labels");
 # $worksheet->write(0, 1, "$data_1[1]");
  $worksheet->write(0, 2, "WW47.1");
 # $worksheet->write(0, 3, "$data_1[3]");

  $worksheet->write(1, 0, "Row Labels");
  $worksheet->write(1, 1, "Complete");
  $worksheet->write(1, 2, "Open");
  $worksheet->write(1, 3, "Blocked");
my $count=2;

foreach(@data)
##while(@data)
{
if ($data[$count] =~ m/Below report is for the total 0p8/ ) {$count++ ; last ;}
if ($data[$count] =~ /Below report is / | $data[$count] =~ /^$/) {$count++ ; next ;}
my @data_1 = split(" " , $data[$count]);
  $worksheet->write($count, 0, "$data_1[0]");
  $worksheet->write($count, 1, "$data_1[1]");
  $worksheet->write($count, 2, "$data_1[2]");
  $worksheet->write($count, 3, "$data_1[3]");
$count++;
}

###$count=0;
###foreach(@data)
###{
###  $worksheet->write($count, 5, "$data[$count]");
###$count++;
###}
{$worksheet = $workbook->add_worksheet('total');

 # $worksheet->write(0, 0, "Row Labels");
 # $worksheet->write(0, 1, "$data_1[1]");
  $worksheet->write(0, 2, "Total");
 # $worksheet->write(0, 3, "$data_1[3]");

  $worksheet->write(1, 0, "Row Labels");
  $worksheet->write(1, 1, "Complete");
  $worksheet->write(1, 2, "Open");
  $worksheet->write(1, 3, "Blocked");

}
my $count_1 = 2 ;
foreach(@data)
##while(@data)
{
##if ($data[$count] =~ m/Below report is for the total 0p8/ ) {$count++ ; last ;}
if ($data[$count] =~ /Below report is / | $data[$count] =~ /^$/) {$count++ ; next ;}
my @data_1 = split(" " , $data[$count]);
  $worksheet->write($count_1, 0, "$data_1[0]");
  $worksheet->write($count_1, 1, "$data_1[1]");
  $worksheet->write($count_1, 2, "$data_1[2]");
  $worksheet->write($count_1, 3, "$data_1[3]");
$count++;
$count_1++;
}

       ## }
