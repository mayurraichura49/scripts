# Date 25/07/2017
# Author :- Mayur Vijay Raichura
# This script can be use if a command gives "final status is 0" and this cannot be use if it showing something different on successful run 
# Also you should not use this script if you want to run the job in background . If you want to do so then give that command as last command.
# Also this script will not give output on standard output for some commands . If you want to check the progress of a command then you can check the log file of that command or you can check the file "exit_status" which is the copy of log file of corresponding command . This file will be deteted and will be regenerated for next command.
# This script will automatically send the on complition of the command.
# you have to provide valid sender and receiver mail ID.

#!/usr/bin/perl
$command[0] = "simbuild -dut hcp ";
$command[1] = "simbuild -dut hcp -s all +s ace_gen,lintra_build,febe_gen" ;
#$command[2] = "" :
#$command[3] = "" :
#$command[4] = "" :
#$command[5] = "" :
#$command[6] = "" :

$to = 'mayurraichura49@gmail.com';
$from = 'mayurraichura49@gmail.com';
$subject = 'Test Email';

$stages_passed = 0;	# This is the counter which will increment if the particular stage is passed.

open (result_file , ">result_file"); # This is the output file where you are writing the status of command whether it is passing or failing.

`$command[0] |tee exit_status` ; 

LOOP : open (exit_status , "exit_status") or die "Couldn't open file";       # This is the file where we are storing the complete output of particular command.
 @final_status = <exit_status>;
if($final_status[-1] =~ m/final\sstatus\sis\s0/)	# Here we are greping the "final status is 0" phrase which shows if our command is passing or not.
{
	open (result_file , ">result_file");
	$stages_passed = $stages_passed + 1;
	goto LOOP1 ;		# We are going to LOOP1 which is for sending the mail after every command.
}
LOOP2 : if($final_status[-1] =~ m/final\sstatus\sis\s0/)
	{
		close(exit_status);
		`rm exit_status`;
		use Switch ;
		switch($stages_passed) { 
		case 1 {`$command[1] |tee exit_status`; goto LOOP ; } ## Add next command which you want to run before |tee in this line.
	#	case 2 {`$command[2] |tee exit_status`; goto LOOP ; } 
	#	case 3 {`$command[3] |tee exit_status`; goto LOOP ; } 
	#	case 4 {`$command[4] |tee exit_status`; goto LOOP ; } 
	#	case 5 {`$command[5] |tee exit_status`; goto LOOP ; } 
	#	case 6 {`$command[6] |tee exit_status`; goto LOOP ; } 
		else { goto LOOP3}
		}
	} 
else
	{
		open (result_file , ">result_file");
		print "$stages_passed";	
		print "$command[$stages_passed] IS FAILED. CANNOT PROCEED FURTHER\n";
		print result_file "$command[$stages_passed] IS FAILED. CANNOT PROCEED FURTHER\n";
	}
LOOP1 : if($stages_passed != 0)
		{
			print "Following stages are pass\n"; 
			print result_file "Following stages are pass\n" ;
		}
for($pass_status = 0; $pass_status < $stages_passed ; $pass_status = $pass_status +1 )
	{
	print("$command[$pass_status] \n");	
	print result_file "$command[$pass_status] \n";
	}
$message = `cat result_file`; 
open(MAIL, "|/usr/sbin/sendmail -t");
 
# Email Header
print MAIL "To: $to\n";
print MAIL "From: $from\n";
print MAIL "Subject: $subject\n\n";
# Email Body
print MAIL $message;

close(MAIL);
print "Email Sent Successfully\n";
`rm result_file`;
if($final_status[-1] =~ m/final\sstatus\sis\s000/)
{
goto LOOP2 ;
}
LOOP3 :
