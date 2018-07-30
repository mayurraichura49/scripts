# Date 01/07/2018
# Author :- Mayur Vijay Raichura 
# This script is to run multiple commands after one another.
# This script will not check if previous command pass or fail . It will run next command irrespective of the result of previous command.
# You have to replace the appropriate command inside system to run it.
# If you want the scipt having same basic function but with more features then refer to script "fullauto.pl" 

#!/usr/bin/perl
system('simbuild -dut hcp');

#### Following commands are to run lintra for all 3 partitions.
system('simbuild -dut hcp -s all +s ace_gen,lintra_build,febe_gen'); 
system('trex ose_main_top_lintra_test -dut hcp -ace_args -static_check -use_lintra_mcrd -ace_args- -save &');
system('trex ose_arm_ccm_top_lintra_test -dut hcp -ace_args -static_check -use_lintra_mcrd -ace_args- -save &');
system('trex ose_gbe_dma_top_lintra_test -dut hcp -ace_args -static_check -use_lintra_mcrd -ace_args- -save &');
