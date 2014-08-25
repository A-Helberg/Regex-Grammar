#!/usr/bin/perl
use Test::Simple tests => 30;
use Fcntl;

# The brackets used for specifying a command
# ``


$testing_file_name = "testinput.txt";
$script_name = "amazon.pl";

# 1  
ok(1+1 ==2, 'Testing is possible');
#  2
ok(-e "$script_name",'Script file exists');

	
	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "SUM: 1,2";
	close (MYFILE);


#  3
ok (`perl $script_name $testing_file_name` eq "SUM 3\n","SUM Functionality");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "SUM: 6";
	close (MYFILE);
#  4
ok (`perl $script_name $testing_file_name` eq "SUM 6\n","SUM Allows single argument");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "SUM: 1,2,";
	close (MYFILE);
#  5
ok (`perl $script_name $testing_file_name` eq "Failure on 'SUM: 1,2,'; Invalid syntax or unknown command.\n","SUM Does not allow trailing ','");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "SUM: ";
	close (MYFILE);
#  6
ok (`perl $script_name $testing_file_name` eq "Failure on 'SUM: '; Invalid syntax or unknown command.\n","SUM Does not allow no arguments");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "SUM: a";
	close (MYFILE);
#  7
ok (`perl $script_name $testing_file_name` eq "Failure on 'SUM: a'; Invalid syntax or unknown command.\n","SUM Does not allow char input");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "SUM: 5.7";
	close (MYFILE);
#  8
ok (`perl $script_name $testing_file_name` eq "Failure on 'SUM: 5.7'; Invalid syntax or unknown command.\n","SUM Does not allow non integer values");

# ====================================
# MIN
# ====================================
	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MIN: 1,2";
	close (MYFILE);


#  9
ok (`perl $script_name $testing_file_name` eq "MIN 1\n","MIN Functionality");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MIN: 6";
	close (MYFILE);
#  10
ok (`perl $script_name $testing_file_name` eq "MIN 6\n","MIN Allows single argument");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MIN: 1,2,";
	close (MYFILE);
#  11
ok (`perl $script_name $testing_file_name` eq "Failure on 'MIN: 1,2,'; Invalid syntax or unknown command.\n","MIN Does not allow trailing ','");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MIN: ";
	close (MYFILE);
#  12
ok (`perl $script_name $testing_file_name` eq "Failure on 'MIN: '; Invalid syntax or unknown command.\n","MIN Does not allow no arguments");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MIN: a";
	close (MYFILE);
#  13
ok (`perl $script_name $testing_file_name` eq "Failure on 'MIN: a'; Invalid syntax or unknown command.\n","MIN Does not allow char input");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MIN: 5.7";
	close (MYFILE);
#  14
ok (`perl $script_name $testing_file_name` eq "Failure on 'MIN: 5.7'; Invalid syntax or unknown command.\n","MIN Does not allow non integer values");

# ====================================
# MAX
# ====================================
	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MAX: 1,2";
	close (MYFILE);


#  15
ok (`perl $script_name $testing_file_name` eq "MAX 2\n","MAX Functionality");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MAX: 6";
	close (MYFILE);
#  16
ok (`perl $script_name $testing_file_name` eq "MAX 6\n","MAX Allows single argument");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MAX: 1,2,";
	close (MYFILE);
#  17
ok (`perl $script_name $testing_file_name` eq "Failure on 'MAX: 1,2,'; Invalid syntax or unknown command.\n","MAX Does not allow trailing ','");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MAX: ";
	close (MYFILE);
#  18
ok (`perl $script_name $testing_file_name` eq "Failure on 'MAX: '; Invalid syntax or unknown command.\n","MAX Does not allow no arguments");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MAX: a";
	close (MYFILE);
#  19
ok (`perl $script_name $testing_file_name` eq "Failure on 'MAX: a'; Invalid syntax or unknown command.\n","MAX Does not allow char input");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "MAX: 5.7";
	close (MYFILE);
#  20
ok (`perl $script_name $testing_file_name` eq "Failure on 'MAX: 5.7'; Invalid syntax or unknown command.\n","MAX Does not allow non integer values");

# ====================================
# AVERAGE
# ====================================
	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "AVERAGE: 1,2";
	close (MYFILE);


#  21
ok (`perl $script_name $testing_file_name` eq "AVERAGE 1.5\n","AVERAGE Functionality");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "AVERAGE: 6";
	close (MYFILE);
#  22
ok (`perl $script_name $testing_file_name` eq "AVERAGE 6\n","AVERAGE Allows single argument");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "AVERAGE: 1,2,";
	close (MYFILE);
#  23
ok (`perl $script_name $testing_file_name` eq "Failure on 'AVERAGE: 1,2,'; Invalid syntax or unknown command.\n","AVERAGE Does not allow trailing ','");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "AVERAGE: ";
	close (MYFILE);
#  24
ok (`perl $script_name $testing_file_name` eq "Failure on 'AVERAGE: '; Invalid syntax or unknown command.\n","AVERAGE Does not allow no arguments");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "AVERAGE: a";
	close (MYFILE);
#  25
ok (`perl $script_name $testing_file_name` eq "Failure on 'AVERAGE: a'; Invalid syntax or unknown command.\n","AVERAGE Does not allow char input");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "AVERAGE: 5.7";
	close (MYFILE);
#  26
ok (`perl $script_name $testing_file_name` eq "Failure on 'AVERAGE: 5.7'; Invalid syntax or unknown command.\n","AVERAGE Does not allow non integer values");

	if( -e $testing_file_name){
		unlink $testing_file_name;
	}
	open (MYFILE, ">>$testing_file_name");
	print MYFILE "asdfg";
	close (MYFILE);
#  27
ok (`perl $script_name $testing_file_name` eq "Failure on 'asdfg'; Invalid syntax or unknown command.\n","Gibberish is treated as such");


# Delete test input file
	if( -e $testing_file_name){
		unlink $testing_file_name;
	}

ok (`perl $script_name $testing_file_name $2>1` eq "","Input file does not exist");
ok (`perl $script_name ` eq "Usage: amazon.pl file_name\n","No arguments (file) specified");
ok (`perl $script_name a b c d e f` eq "Usage: amazon.pl file_name\n","Too many arguments specified");