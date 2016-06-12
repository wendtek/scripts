#!/usr/bin/perl
#
# strip_.pl
# This script strips out underscores in filenames and replaces them with spaces
# good for MP3's
# written by Greg Palmier (palmier@purdue.edu)
# run as: ./strip_.pl <filename>
# wildcards accepted
#
print "\n";
while (@ARGV)
{
	$filename = shift(@ARGV);		# Read command-line filenames
	$target = $filename;
	$target =~ s/_/ /g;			# new filename

	print $filename, " is now ", $target,"\n";
	system(`/bin/mv ./"$filename" ./"$target"`);
}
print "\nstrip_.pl by Greg Palmier (palmier\@purdue.edu).  May 16th, 2002\n\n";
