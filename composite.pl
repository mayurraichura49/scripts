# Date 20/06/2018
# Author :- Mayur Vijay Raichura
# This script is for specific for one task in sandbox integration project.
# you can take reference of this script to do manipulation task on file.



#!/usr/bin/perl

$SBX_PATH = "/nfs/site/stod/stod2092vs/w.mraichux.100/ww_25/sr_database/sbx_5.2";
$IP_PATH = "/nfs/site/stod/stod2092vs/w.mraichux.100/OSE_PRE_0.5/ww24.7/ip-ish-superset" ;
$TARGET_PATH = "/nfs/site/stod/stod2092vs/w.mraichux.100/trash/signal_24.7_drop_trial_1" ;

`mkdir $TARGET_PATH`;
`cp $SBX_PATH/target/hcp/aceroot/collage_work/soc/reports/subsystem_opens/ish.dfx.opens $TARGET_PATH/sbx_input_signal`;
`cat $SBX_PATH/target/hcp/aceroot/collage_work/soc/reports/subsystem_opens/ish.no_dfx.opens >> $TARGET_PATH/sbx_input_signal`;

`sed -i '/output/d' $TARGET_PATH/sbx_input_signal`;			# To delete all lines containing keyword "output".
`sed -i 's%ose_main_top/%%g' $TARGET_PATH/sbx_input_signal`;		# To replace keyword "ose_main_top" with nothing . 
`sed -i 's%ose_arm_ccm_top/%%g' $TARGET_PATH/sbx_input_signal`;
`sed -i 's%ose_gbe_dma_top/%%g' $TARGET_PATH/sbx_input_signal`;
`sed -i 's%/%%g' $TARGET_PATH/sbx_input_signal`;
`sed -i 's%input %%g' $TARGET_PATH/sbx_input_signal`;
`sed -i '/^\$/d' $TARGET_PATH/sbx_input_signal`;			# To remove empty line from file

open (sbx_input_signal, "$TARGET_PATH/sbx_input_signal");
while(<sbx_input_signal>)
{
  chomp($_);
`grep -i "$_" $IP_PATH/source/rtl/ose_top/ose_top.sv >>  $TARGET_PATH/coreesponding_input_signal_durty` ;	#To grep everyline of "sbx_input_signal" in ose_top.sv and storing the result in "coreesponding_input_signal_durty".
}
close (sbx_input_signal);

`cp $TARGET_PATH/coreesponding_input_signal_durty $TARGET_PATH/coreesponding_input_signal_clean`;
`sed -i 's%(%%g' $TARGET_PATH/coreesponding_input_signal_clean` ; 	# To replace keyword "(" with nothing .
`sed -i 's%)%%g' $TARGET_PATH/coreesponding_input_signal_clean` ;
`sed -i 's%,%%g' $TARGET_PATH/coreesponding_input_signal_clean` ;
`sed -i '/^\$/d' $TARGET_PATH/coreesponding_input_signal_clean` ;
`sed -i '/wire/d' $TARGET_PATH/coreesponding_input_signal_clean` ;

open (coreesponding_input_signal_clean_file , "$TARGET_PATH/coreesponding_input_signal_clean");
open (final_input_file, ">$TARGET_PATH/final_input_signls");
while(<coreesponding_input_signal_clean_file>)
{
@signal_name = split (' ', $_);				# To split every line of "final_input_signals" with space and storing it in @signal_name
print final_input_file "$signal_name[1]\n";
}
close(coreesponding_input_signal_clean_file);
close(final_input_file);

`sed -i 's#\[[0-9]*:[0-9]*]##g' $TARGET_PATH/final_input_signls ` ;	# To replace keyword "[65: 96]" kind of phrase with nothing .
`sed -i 's#\[[0-9]*]##g' $TARGET_PATH/final_input_signls ` ;		# To replace keyword "[65]" kind of phrase with nothing .
`sed -i '/^\$/d' $TARGET_PATH/final_input_signls `;

$i=0;

open (final_input_signals, "$TARGET_PATH/final_input_signls");
while(<final_input_signals>)
{
 $i++;
  chomp($_);
`echo  "$i $_"  >> $TARGET_PATH/grep_output_tb`;
`grep -ir "$_" $IP_PATH/verif/tb >> $TARGET_PATH/grep_output_tb`;
}
close(final_input_signals);
