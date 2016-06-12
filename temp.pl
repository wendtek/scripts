#!/usr/bin/perl
#
# TEMP.PL - Get local temperature report from weather.com by ZIP code.
#           By Greg Palmier <palmier@purdue.edu>
#           Derived from DICT.PL by Cancer Omega <comega@attrition.org>
#           Updated on 09/10/2002 by Cancer Omega to account for changes
#           to weather.com's HTML response.
#
$date=`/bin/date +%m%d%y%H%M%S`;chomp($date); # Date in MMDDYYHHMMSS format
$zip=shift(@ARGV);$zip=~s/ //g;               # Read command-line variable
$url="http://www.weather.com/weather/local/"; # weather.com URL
$temp="~/temp."."$date";                      # Scratch file for processing
$wget="/usr/bin/wget";                        # Location of WGET
#
if ($zip ne "") {
  system(`$wget -O $temp -q $url$zip\?lswe=$zip\&lwsa=WeatherLocalUndeclared`);
} else {
  print"\nRun as: $0 <zip code>\n\n";exit 1;
}
open (INPUT,"$temp")||die("Can't open $temp!");
  while (<INPUT>) { chomp($_);
    if ($_=~/Local Forecast for/i) {
      $_=~s/<A HREF="\/" CLASS="breadCrumb">Home<\/A> &gt; //i;
      $_=~s/<B>Local Forecast for (.*?)<\/B>/$1/; $location="$_";
      print "got location";
    }
    if ($_=~"obsTempTextA") {
      print "got here\n";
      $_=~s/\s+/ /g;
      $_=~s/<TD VALIGN=MIDDLE ALIGN=CENTER CLASS=obsInfo2 WIDTH=50%><B CLASS=obsTempTextA>//;
      $_=~s/<\/B><\/TD><\/TR>//;  
      $_=~s/\&deg;/°/; $conditions="It is "."$_"." in "; last;
    }
  }
close (INPUT);
print "$conditions$location\n";system(`/bin/rm $temp`);
