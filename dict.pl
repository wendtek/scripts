#!/usr/bin/perl
#
# Dictionary Lookup - Cancer Omega - 08/23/99
#
# Using "www.dictionary.com", remotely fetch the definition of a word
# and weed out the extraneous garbage on the page.
#
# WARNING: You may need to change some of the following variables!
#
#
$date = `/bin/date +%m%d%y%H%M%S`;      # Date in MMDDYYHHMMSS format (for unique filename)
$term = shift(@ARGV);                   # Read command-line variable
$term =~ s/ //g;                        # Strip out spaces (this should be a single word)
$url  = "http://www.dictionary.com/cgi-bin/dict.pl?term=";  # Online dictionary URL
$start = 0;                             # Initialize variable
$bin1 = "/bin";                         # First binary directory
$bin2 = "/usr/bin";                     # First binary directory
$bin3 = "/usr/local/bin";               # First binary directory
chomp($date);                           # Strip out newline from date
$tempfile = "/tmp/$date.def";           # Scratch file for processing
#
print "\n";
if ($term ne "") {
  system(`$bin2/lynx -dump -nolist $url$term > $tempfile`);
} else {
  print "- ERROR: No word supplied for lookup.\n";
  print "         Run as ./dict.pl <term>\n\n";
  exit 1;
}
#
$cycle = 1;
print "Definition of: $term\n\n";
open (INPUT,"$tempfile") || die("Could not open $tempfile!");
  while (<INPUT>) {
    chomp ($_);
    if ($cycle == 1) { if ($_ =~ "$term") { $cycle = 0; $start = 1; } }
    if ($_ =~ "No entry found") { $start = 0; print "$_\n"; last; }
    if ($_ =~ "Search for $term at") { $start = 0; }
    if ($start == 1) { print "$_\n"; }
  }
close (INPUT);
print "\n";
system(`$bin2/rm $tempfile`);
