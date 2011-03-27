#!/usr/bin/perl

# Simple slang translater example
# Copyleft (ↄ) 2010-2011
# Z. Cliffe Schreuders

# This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.

my %translations;
my $filename = "slang.txt";
my $fileline;

# read in translations
open(IN, "$filename") or die "Can't open $filename: $!";
while(chomp($fileline = <IN>)) {
	# read translation lines
	if($fileline =~ /^\s*(.+)\s*:\s*(.+)\s*$/) {
		$translations{$1} = $2;
	# ignore blank lines or comments
	} elsif($fileline =~ /^\s*#|^\s*$/) {
	} else {
		warn "$filename includes an invalid line: $fileline\n";
	}
}

# read line to translate
print "Welcome to the example slang translater program\n";
print "Please enter a sentence to translate\n";
chomp($line = <STDIN>);

# do conversions
foreach $key (keys %translations) {
	$line =~ s/\b\Q$key\E\b/$translations{$key}/ig;
}

# print result
print "Translation: $line\n";