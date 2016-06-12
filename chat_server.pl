#!/usr/bin/perl

#This is a telnet chat server.  all you have to do is run this perl script
#and telnet into the port specified.  It requires no client, just a telnet window :D !!
#it was written by greg palmier

use IO::Socket;
# include the select package
use IO::Select;
use Time::localtime;
$count_message = $count_joins = $count_action = $count_invis = 0;
$count_quits = $count_boss = $count_nick = 0;
$max_clients = 666;
$port = 1234;
$new_client = IO::Socket::INET->new(Proto=>"tcp",
		LocalPort=>$port, Listen=>$max_clients, Reuse=>1);
$server = $new_client->sockhost();
# create a new selection and add our basic socket for incoming connections
$sel = IO::Select->new($new_client);

while (@ready = $sel->can_read) {
# for every readable socket
	foreach $client (@ready) {
# check if it is the basic socket
		if ($client == $new_client) {
# if it is establish new connection
			$add = $client->accept;
# print status to new user
			$count = $sel->count;
			print $add "\n\nChat Thing by Greg Principato and greg palmier\n\n";
			print $add "--- enter \"/commands\" for list of commands ---\n\n";

# add new socket to the selection
			$sel->add($add);
			$connection = $add;
			$count_joins++;
			$USERS{$connection} = $add->peerhost;
			print $add "***** CURRENT USER LIST *****\n";
			foreach (keys %USERS){
				print $add "$USERS{$_}\n";
			}
			print $add "*****************************\n\n";
			foreach ($sel->can_write) {
				$tm = localtime;
				print $_ ($tm->hour,":", $tm->min,":", $tm->sec);
				print $_ " **** ",$USERS{$connection}," has joined the room ****\n";
			}
			print ($tm->hour,":", $tm->min,":", $tm->sec);			      
			print " **** ",$USERS{$connection}," has joined the room ****\n";

# if it is a already established connectection
		} else {
# get the message
			$message = <$client>;
# remove last newline characters     
			chomp($message);
			$message =~ s/\r//;
			$message =~ s/^\s*//;
#actions
			if ($message =~ /^\/me/) {
				$message =~ s/\/me\s*//;
				$count_action++;
				$connection = $client;
				if ($USERS{$connection} ne ''){
					foreach ($sel->can_write) {
						$tm = localtime;
						print $_ $tm->hour,":", $tm->min,":", $tm->sec;
						print $_ " ** ",$USERS{$connection}," ".$message," **\n";
					}
				}else{
					print $client "** You must select a nick **\n";
				}
			}
#list users
			elsif ($message eq "/users" or $message eq "/user") {
				print $client "***** CURRENT USER LIST *****\n";
				foreach (keys %USERS){
					print $client "$USERS{$_}\n";
				}
				print $client "*****************************\n";

			}
#undocumented feature >:D
			elsif ($message =~ /^\/invisible/){
				$count_invis++;
				$connection = $client;
				$tm = localtime;
				print $tm->hour,":", $tm->min,":", $tm->sec;
				print " ** $USERS{$connection} has gone incognito **\n";
				delete $USERS{$connection};
				print $client "** You will remain invisible until you change your nick **\n";
			}
			elsif ($message =~ /^\/nick/){
				$message =~ s/\/nick\s*//;
				$connection = $client;
				$count_nick++;
				$nick_old = $USERS{$connection};
				$USERS{$connection} = $message;
				if($nick_old eq ''){
					print $client "** You are now known as ".$message;
					print $client " **\n";
					print $tm->hour,":", $tm->min,":", $tm->sec;
					print " ** ",$nick_old," is now known as ".$message," **\n";

				}else{
					foreach ($sel->can_write) {
						$tm = localtime;
						print $_ $tm->hour,":", $tm->min,":", $tm->sec;
						print $_ " ** ",$nick_old," is now known as ".$message," **\n";
					}
					print $tm->hour,":", $tm->min,":", $tm->sec;
					print " ** ",$nick_old," is now known as ".$message," **\n";

				}#end else
			}
			elsif($message eq "/stats") {
				print $client "***** Chat Room Stats *****\n";
				print $client "$count_message messages were written\n";
				print $client "$count_nick nicks were changed\n";
				print $client "$count_boss bosses walked by\n";
				print $client "$count_action actions were done\n";
				print $client "$count_joins sessions were started\n";
				print $client "$count_invis people were spying on you\n";
				print $client "***************************\n";    
			}
#undocumented feature >:D
			elsif($message eq "/boss") {
				$count_boss++;
				$connection = $client;
				foreach ($sel->can_write) {
					$tm = localtime;
					print $_ $tm->hour,":", $tm->min,":", $tm->sec;
					print $_ " ***** ",$USERS{$connection},"'s boss just walked by *****\n";
				}
				print $client `cat lunch.p`;
				print $tm->hour,":", $tm->min,":", $tm->sec;
				print " ***** ",$USERS{$connection},"'s boss just walked by *****\n";

			}
#clear command
			elsif ($message eq "/clear") {
				print $client ("\n")x66;
				print $client "\n\nChat Thing by Greg \"keyboard samurai\" Principato and greg \"c0d3 monkey\" palmier\n\n";
			}
			elsif ($message eq "/connections") {
				$total = 0;
				foreach ($sel->can_write) {
					$total++;
				}#end foreach

				print $client "***** CURRENT NUMBER OF CONNECTIONS: $total *****\n";
			}
#show command list
			elsif ($message eq "/commands" or $message eq "/command" or $message eq "/help") {
				print $client "***** USER COMMAND LIST *****\n";
				print $client "/users --> shows connected users\n";
				print $client "/nick --> changes nickname (/nick <nickname>)\n";
				print $client "/me --> displays an action (/me <action>)\n";
				print $client "/invisible --> Invisible to room until nick change\n";
				print $client "/quit --> quits chat (/quit <reason>) reason optional\n";
				print $client "/clear --> clears screen\n";
				print $client "/stats --> Stats since last server restart\n";
				print $client "*****************************\n";
			}
# if user wants to quit
			elsif ($message =~ /^\/quit/) {
				$reason = $message;
				$reason =~ s/\/quit\s*//;
				if ($reason eq ''){
					$reason = "Leaving";
				}
# remove him from selection
				$connection = $client;
				if ($USERS{$connection} ne ''){
					foreach ($sel->can_write) {
						$tm = localtime;
						print $_ ($tm->hour,":", $tm->min,":", $tm->sec);
						print $_ " **** ",$USERS{$connection}," has quit (Reason: $reason) ****\n";
					}#end foreach
					print ($tm->hour,":", $tm->min,":", $tm->sec);			     
					print " **** ",$USERS{$connection}," has quit (Reason: $reason) ****\n";
				}#end if
				else{
					print $client "**** You have quit Chat thing ****\n";
				}
				delete $USERS{$connection};
				$sel->remove($client);
# close his socket
				close $client;
# otherwise
			}
#command not found syntax, must be last
			elsif($message =~ /^\//){
				print $client "** command not found **\n";
		} 
			else {
# send the message to all chatters
				$connection = $client;
				if($USERS{$connection} ne '' and $message ne ''){
					$count_message++;
					foreach ($sel->can_write) {
						$tm = localtime;
						print $_ $tm->hour,":", $tm->min,":", $tm->sec;
						print $_ " [",$USERS{$connection},"] ", "$message\n";
					}#end foreach
				}#end if
				else{
				}
			}
		}
	}
}

