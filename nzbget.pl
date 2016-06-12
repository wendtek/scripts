#!/usr/bin/perl

#Wed Feb  2 13:59:07 2011
$day = `/bin/date +%a`;
$month = `/bin/date +%b`;
$daynum = `/bin/date +%_d`;
$hour = `/bin/date +%H`;
chomp ($day,$month,$daynum,$hour);

$nzblog = "/var/log/nzbget/nzbget.log";
$subj = "Done!";
$towho = "email\@example.com";

open(NZBLOG,"$nzblog") || die("Could not open $nzblog!");
while (<NZBLOG>){
  if($_ =~ /^$day\s+$month\s+$daynum\s+$hour/ && /completely/){ system(`/bin/echo -n "$_" | /bin/mail -s $subj $towho`); 
  }
}
close (NZBLOG);
