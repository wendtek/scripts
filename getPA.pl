#!/usr/bin/perl
################################################################################
#                                                                              #
#   Name: get8bit.pl                                                           #
#   Description: To retrieve every Penny-Arcade from the archive               #
#   Written By: Greg Palmier (palmier@purdue.edu)                              #
#   Date:  July 9th, 2002                                                      #
#                                                                              #
################################################################################

for($year=1999;$year<2003;$year=$year+1)
	{
	for($mo=1;$mo<13;$mo=$mo+1)
		{
		if($mo<10){$mo="0$mo";}
		for($day=1;$day<32;$day=$day+1)
			{
			if($day<10){$day="0$day";}


system(`/usr/bin/lynx -dump "http://www.penny-arcade.com/images/$year/$year$mo$day",l,".gif" > temp.file`); 
		
print "checking http://www.penny-arcade.com/images/$year/$year$mo$day...\n";

open(TEMP,"temp.file");
while(<TEMP>){if ($_ =~ /Not Found/) { $write_flag = 0;}}
close(TEMP);

if($write_flag){
print "Saving http://www.penny-arcade.com/images/$year/$year$mo$day",l,".gif...\n";
system(`/usr/bin/lynx -dump "http://www.penny-arcade.com/images/$year/$year$mo$day",l,".gif" > "$year$mo$day.gif"`); 
print "Saving http://www.penny-arcade.com/images/$year/$year$mo$day\h.gif...\n";
system(`/usr/bin/lynx -dump http://www.penny-arcade.com/images/$year/$year$mo$day\h.gif > $year$mo$day\h.gif`);
}

$write_flag=1;
system(`/bin/rm temp.file`);			}
		}
	}
