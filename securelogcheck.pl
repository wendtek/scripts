#!/usr/bin/perl
# monitors logs and detects if users were added.
#Feb  2 13:59:07
$month = `/bin/date +%b`;
$daynum = `/bin/date +%_d`;
$hour = `/bin/date +%H`;
chomp ($month,$daynum,$hour);

$hour = 16;
$daynum = 26;

$secure = "/var/log/secure";
$subj = "Useradd!";
$towho = "email\@example.com";

print "$month\n";
print "$daynum\n";
print "$hour\n";

open(SECURE,"$secure") || die("Could not open $secure!");
while (<SECURE>){
  if($_ =~ /^$month\s+$daynum\s+$hour/ && /useradd/){ system(`/bin/echo -n "$_" | /bin/mail -s $subj $towho`);
  }
}
close (SECURE);
