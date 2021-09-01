#!/usr/bin/env perl6
#
# Optional Parameters
#
# Here is a program that reads the emma.txt file and builds a histogram of the words in
# the file:

say 'A:';
my %histogram;
my $skip = True; # flag to skip the header
sub process-line(Str $line is copy) {
    if defined index $line, "*END*THE SMALL PRINT!" {
        $skip = False;
        return;
    }
    return if $skip;
    $line ~~ s:g/<[-']>/ /; # Replacing dashes and apostrophes with spaces
    $line ~~ s:g/<[;:,!?.()"“”’_`]>//; # removing punctuation symbols
    $line = $line.lc; # setting string to lowercase
    for $line.words -> $word {
        %histogram{$word}++;
    }
}

process-line $_ for "tmp/emma.txt".IO.lines;

# We saw earlier in this chapter that subroutines can take optional parameters. We can
# use this functionality to write a subroutine that prints the most common words in the
# %histogram hash extracted from emma.txt:

say 'B:';
display-most-common(%histogram, 5);
sub display-most-common (%hist, Int $num = 10) {
    say $_ for map { "$_ \t%hist{$_} "},
    (sort { %hist{$^b} cmp %hist{$^a} },
    %hist.keys)[0..$num - 1];
}

# This will display the five top words of the list above (“Most Common Words” on page
# 212). If we call it without the second parameter:

say 'C:';
display-most-common(%histogram);

# we will get the 10 most common words (same list as the one shown in “Most Com‐
# mon Words” on page 212 above), because the default value for the second parameter
# is 10.

