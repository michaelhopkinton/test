#!/usr/bin/perl
use strict;
use POSIX;  # use floor to get the floor value for a number
use warnings;
 
my $file = $ARGV[0] or die "Need to get tab separated file(.tile) on the command line\n";
 
my @HS;
my @HSS; # start value
my @HSE; # end  value
my $index=0;

open(my $data, '<', $file) or die "Could not open '$file' $!\n";
while (my $line = <$data>) {
  chomp $line;
  my @fields = split "\t" , $line;
  $HS[$index] = substr($fields[0],2); # get rid of the first 2 characaters (hs)
  $HSS[$index] = floor($fields[1]/1000000); # get floor value 
  $HSS[$index] -=1;
  if ($HSS[$index]< 0) { $HSS[$index] = 0; }
  $HSE[$index] = floor($fields[2]/1000000);  #get floor value
  $HSE[$index] +=2;
  $index = $index+1;
}
my $old_file = $ARGV[1];  # Source Configration file
my $new_file = $ARGV[2];  # generated Dest Configuration file

open my $rf, '<', $old_file or die "Cannot open $old_file for reading.";
open my $wf, '>'. $new_file or die "Cannot open $new_file for writing.";
while ( <$rf> ) {
    if (/chromosomes(\s*)=(.*)/) {
        my $value=$2;
        $_ = "chromosomes$1=";
        for (my $i=0; $i <$index; $i++) {
            $_.="hs".$HS[$i].":".$HSS[$i]."-".$HSE[$i].";";
        }
        chop($_); # get rid of the last ;
        $_ .="\r\n";
        s/$value/abcdd/;
    }
      print $wf $_;
}

close $rf;
close $wf;
