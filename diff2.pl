#!/usr/bin/perl -w
binmode STDOUT, ":utf8"; #This suppress warning when print out Unicode character

my $src = "./key.txt";  

my $fh;
my @srcF;
my $index =0; 
open ($fh, "<:encoding(UTF-8)", $src);
while (defined($line = <$fh>)) {
         chomp($line);
         $line =~/(chr.*)/;
	 $srcF[$index]=$1;
         $index++;
} 
close $fh;

my $flist = "./list.txt";
my $flistH;
my @fList;
my $j = 0;
open ($flistH, "<:encoding(UTF-8)", $flist);
while (defined($line = <$flistH>)) {
         chomp($line);
         push @fList, $line;
         doOneFile($line);
}


sub doOneFile {
 my $file = shift;
 open ($theF, "<:encoding(UTF-8)", $file);
 print("====$file===\n");
 my $fName;
 while (defined($line = <$theF>)) {
         chomp($line);
         $line =~/(.*?)(chr.*?)\.(.*?)\.(.*?)\ -(.*)/;
         $fName = "$2.$3.$4";
        $srcLine= "$2.$3";  # Get each line
         my $key="";
         my $size = @srcF;
         for (my $i = 0; $i <$size;$i++) {
           $key = $srcF[$i];
           $key =~ /^(.*?)\.(.*?)\.(.*)/;
           $key ="$1.$2";
#	   print "key==>$key\n";
#           print "src==>$srcLine\n";
           if ($key eq $srcLine) {
		print "==>$fName\n";
           } 
         }
 }
}


