#!/usr/bin/perl

#'Lunch Anybody?' was written by greg palmier on 6.9.2000
#Its sole purpose is to get ideas for where to go to lunch.

#This program is not a role model.


srand( time() ^ ($$ + ($$ << 15)) );

@amer_list = (
	   "Fuddruckers",
	   "Buffalos",
	   "Walker Brothers",
	   "Applebees",
	   "California Pizza Kitchen",
	   "Rainforest Cafe",
	   "Portillos",
	   "Quiznos",
	   "Panera Bread Co.",
	   "Papadeuxs",
	   "Kostas",
	   "Prarie Rock",
	   "Outback",
	   "Lonestar",
           "Cheesecake Factory"
	   );

@mex_list = (
             "La Margarita",
	     "Chevys",
	     "Taco Bell"
	     );
	      
@orient_list = (
		"Mongolian Buffet",
	        "Hong Kong Cafe",
		"House of Hunan",
		"Yen Yens",
		"Wing Wah",
		"Absolutely Chinese",
		);

@ital_list = (
	      "Olive Garden",
	      "Lou Malnatis",
	      "Garabaldi's"
	      );

sub food{
$type_len=0;
foreach(@_){$type_len++;}
$rand_idx = int rand($type_len);
$rest = $_[$rand_idx];
$food_result = "\nI would suggest\n$rest\nfor lunch today.\n\n";
return($food_result);
} #end sub food()

use Tk;
my $lunch = MainWindow->new();
$lunch->title('Lunch Anyone?');

#create the frames
$type = $lunch->Frame(-relief => 'groove', -borderwidth => 2);
$answer = $lunch->Frame(-relief => 'groove', -borderwidth => 2, -height => 200, -width => 300);
		    		      
#pack the frames
$type->pack(-side => 'right', -fill => 'y');
$answer->pack(-side => 'right');	     

#create the buttons
$amer_b = $type->Button(-text => "American/Other", -command => sub {&food(@amer_list);})->pack(-side => 'top', -expand => 1, -fill => 'both');
$mex_b = $type->Button(-text => "Mexican", -command => sub {&food(@mex_list);})->pack(-side => 'top', -expand => 1, -fill => 'both');
$orient_b = $type->Button(-text => "Oriental", -command => sub {&food(@orient_list);})->pack(-side => 'top', -expand => 1, -fill => 'both');
$ital_b = $type->Button(-text => "Italian", -command => sub {&food(@ital_list);})->pack(-side => 'top', -expand => 1, -fill => 'both');
$exit_b = $type->Button(-text => "This program sux", -command => sub {exit})->pack(-side => 'top', -expand => 1, -fill => 'both');

$food_l = $answer->Label(-textvariable => \$food_result, -justify => 'center', -height => 10, -width=>50)->pack(-side => 'top', -fill => 'y');


MainLoop();
