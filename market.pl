#!/usr/bin/perl
#
# quote.pl
# This script tells you the current dow and nasdaq status.
# written by Greg Palmier
# run as: ./quote.pl
# thx for the guts Cancer Omega
# WARNING: I'm new at this shell scripting nonsense!
#
$date = `/bin/date +%m%d%y%H%M%S`;      # Date in MMDDYYHHMMSS format (for unique filename)
$url  = "http://money.cnn.com/";        # money.cnn.com URL
chomp($date);                           # Strip out newline from date
$tempfile = "/tmp/pw."."$date";         # Scratch file for processing
#
print "\n";
system(`/usr/bin/lynx -dump -nolist $url > $tempfile`);
#
open (INPUT,"$tempfile") || die("Could not open $tempfile!");
  while (<INPUT>) {
    if ($x) { $DOW_c = $_; $x = 0; }
    if ($y) { $NASDAQ_c = $_; $y = 0; }
    if ($z) { $SP_c = $_; $z = 0; }
    if ($_ =~ /DOW/) { $DOW = $_; $x = 1;}
    if ($_ =~ /NASDAQ/) { $NASDAQ = $_; $y = 1;}
    if ($_ =~ /S&P/) { $SP = $_; $z = 1; }
    }
close (INPUT);
#chomp $DOW;
#chomp $NASDAQ;
#chomp $SP;
#chomp $DOW_c;
#chomp $NASDAQ_c;
#chomp $SP_c;

$DOW_c =~ s/_\[\w*/ /g;
$DOW =~ s/_\[\w*/ /g;
$NASDAQ =~ s/_\[\w*/ /g;
$NASDAQ_c =~ s/_\[\w*/ /g;
$SP =~ s/_\[\w*/ /g;
$SP_c =~ s/_\[\w*/ /g;




print $DOW.$DOW_c,"\n";
print $NASDAQ.$NASDAQ_c,"\n";
print $SP.$SP_c,"\n\n";
system(`/usr/bin/rm $tempfile`);
