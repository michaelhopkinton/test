#!/usr/bin/perl
  use warnings;
  use Carp;
  use strict;
  
  use Venn::Chart;
  
  # Create the Venn::Chart constructor
  my $venn_chart = Venn::Chart->new( 400, 400 ) or die("error : $!");
  
  # Set a title and a legend for our chart
  $venn_chart->set_options(-title=>'5mC',-colors=>[[98,66,238,0],[98,211,124,0] ]);
  $venn_chart->set_legends( 'iPS', 'DN');
  
  # 3 lists for the Venn diagram
  my @team1;# = qw/abel edward momo albert jack julien chris/;
  my @team2;# = qw/edward isabel antonio delta albert kevin jake/;
  my $upto1=23;
  my $upto2=13;
  my $upto3=100;
  my $upto4=100;
  my $upto5=100;
  my $upto6=100;

  my $upto11=100;
  my $upto12=100;
  my $upto13=100;
  my $upto14=100;
  my $upto15=100;
  my $upto16=100;

  for (my $i=1; $i<$upto1; $i++) { $team1[$i]="$i";}  
  for (my $i=0; $i<$upto2; $i++) { $team2[$i]="$i";}  
  # Create a diagram with gd object
  my $gd_venn = $venn_chart->plot( \@team1, \@team2);
  
  # Create a Venn diagram image in png, gif and jpeg format
  #WT-5mC
  open my $fh_venn, '>', 'WT-5mC.png' or die("Unable to create png file\n");
  binmode $fh_venn;
  print {$fh_venn} $gd_venn->png;
  close $fh_venn or die('Unable to close file');

  #WT-5hmC
  open my $fh_venn2, '>', 'WT-5hmC.png' or die("Unable to create png file\n");
  binmode $fh_venn2;
  print {$fh_venn2} $gd_venn->png;
  close $fh_venn2 or die('Unable to close file');
  
  #WT-5fC/caC
  open my $fh_venn3, '>', 'WT-5fC-caC.png' or die("Unable to create png file\n");
  binmode $fh_venn3;
  print {$fh_venn3} $gd_venn->png;
  close $fh_venn3 or die('Unable to close file');

  #PSEN2-5mC
  open my $fh_venna, '>', 'PSEN2-5mC.png' or die("Unable to create png file\n");
  binmode $fh_venna;
  print {$fh_venna} $gd_venn->png;
  close $fh_venna or die('Unable to close file');

  #PSEN2-5hmC
  open my $fh_vennb, '>', 'PSEN2-5hmC.png' or die("Unable to create png file\n");
  binmode $fh_vennb;
  print {$fh_vennb} $gd_venn->png;
  close $fh_vennb or die('Unable to close file');
  
  #PSEN2-5fC/caC
  open my $fh_vennc, '>', 'PSEN2-5fC-caC.png' or die("Unable to create png file\n");
  binmode $fh_vennc;
  print {$fh_vennc} $gd_venn->png;
  close $fh_vennc or die('Unable to close file');

  # Create an histogram image of Venn diagram (png, gif and jpeg format)
 if (0) {
  my $gd_histogram = $venn_chart->plot_histogram;
  open my $fh_histo, '>', 'VennHistogram.png' or die("Unable to create png file\n");
  binmode $fh_histo;
  print {$fh_histo} $gd_histogram->png;
  close $fh_histo or die('Unable to close file');
  
  # Get data list for each intersection or unique region between the 3 lists
  my @ref_lists = $venn_chart->get_list_regions();
  my $list_number = 1;
  foreach my $ref_region ( @ref_lists ) {
    print "List $list_number : @{ $ref_region }\n";
    $list_number++;
  }
}
