#!/usr/bin/perl
#
# TEMP.PL - Get all the sinfest comics.
#           By Greg Palmier <palmier@purdue.edu>
#           Derived from DICT.PL by Cancer Omega <comega@attrition.org>
#
$url="http://www.sinfest.net/comics/"; # sinfest.net comic archive URL
$wget="/usr/bin/wget";                 # Location of WGET
$begin_date = 20000117;                #see the format? 1/17/2000
$end_date = 20030213;
$year = 2000;
$month = 1; #start january
$date = 16; #17th
#
while($current_date <= $end_date){
	$date = $date + 1;
	if ($date == 32){$date = 1;$month = $month + 1;}
	if ($month == 13){$date = 1;$month = 1; $year = $year + 1;}
	#put in perl check first char for 0 for month and date < 10
	$date =~ s/^0?//;
	if ($date < 10){$date = "0$date";}
	$month =~ s/^0?//;
	if ($month < 10){$month = "0$month";}

	$target="sf"."$year"."$month"."$date".".gif";
	system(`$wget -q $url$target --output-document=./$target`);
	open (INPUT,"$target")||die("Can't open $target!");
  		while (<INPUT>) {
			chomp($_);
			if ($_=~/<html>/i) {
			print "$target not a comic";	
			system(`/bin/rm ./$target`);
			last 1;
			}
		}
	close (INPUT);
	print "\n$url$target saved.";
}
