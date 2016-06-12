#!/usr/bin/perl
#
# FEDEX.PL - Look up the tracking history of your fedex package!
#           By Greg Palmier <palmier@purdue.edu>
#           Derived from DICT.PL by Cancer Omega <comega@attrition.org>
#
$date=`/bin/date +%m%d%y%H%M%S`;chomp($date); # Date in MMDDYYHHMMSS format
$tracking=shift(@ARGV);$tracking=~s/ //g;               # Read command-line variable
$url1="http://www.fedex.com/Tracking?tracknumbers="; # URL front side
$url2="&action=track&language=english"; # URL ass end
$temp="./temp."."$date";                      # Scratch file for processing
$wget="/usr/bin/wget";                        # Location of WGET
#
if ($tracking ne "") {
  system(`$wget -O $temp -q $url1$tracking$url2`);
} else {
  print"YOU FAIL AT THE INTERNET.\n";exit 1;
}
open (INPUT,"$temp")||die("Can't open $temp!");
print "Your Package Tracking History\:\n";
  while (<INPUT>) { chomp($_);
  if($_=~/Invalid/i){print "YOU FAIL AT THE INTERNET.\n";exit 1;}
    if ($_=~/<td valign="top" class="small">/i) {
      $_=~s/<td valign="top" class="small">//i;
      $_=~s/&nbsp;<\/td>//i;
      $_=~s/<b>//i;
      $_=~s/<\/b>//i;
      $_=~s/\s{2,}//i;
      if ($_=~/\w+/i){
      print "$_\n";
      }
    }
  }
close (INPUT);
