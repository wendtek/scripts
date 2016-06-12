#!/usr/bin/perl
################################################################################
#                                                                              #
#   Name: get8bit.pl                                                           #
#   Description: To retrieve every 8-bit theater cartoon from the archive      #
#   Written By: Greg Palmier (palmier@purdue.edu)                              #
#   Date:  July 9th, 2002                                                      #
#                                                                              #
################################################################################
for($url=10302;$url<30209;$url=$url+1)
	{
	print "Saving http://www.nuklearpower.com/comics/0$url...\n";	
	system(`/usr/bin/lynx -dump http://www.nuklearpower.com/comics/0$url.jpg > 0$url.jpg`);
	}
	system(`/bin/rm -rf ./404*`);
