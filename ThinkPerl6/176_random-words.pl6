#!/usr/bin/env perl6
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

# To choose random words from the histogram, the simplest algorithm is to build a list
# with multiple copies of each word, according to the observed frequency, and then
# choose from the list with the pick function:

my @array = map {| (.key xx .value)}, %histogram;
say pick 30, @array;

# The expression map {| (.key xx .value)} reads each pair of the histogram and
# creates a list with .value copies of the string in .key. The pick function selects 30
# random words from the array.
#
# This algorithm works, but it is not very efficient; each time you choose one or some
# random words, it rebuilds the list, which is as big as the original book. An obvious
# improvement is to build the list once and then make multiple selections, but the list is
# still big.
#
# An alternative is:
#
# 1. Use keys to get a list of the words in emma.txt.
#
# 2. Build a list that contains the cumulative sum of the word frequencies (see Exer‐
# cise 9-2). The last item in this list is the total number of words in the book, n.
#
# 3. Choose a random number from 1 to n. Use a bisection search (see Exercise 9-10)
# to find the index where the random number would be inserted in the cumulative
# sum.
#
# 4. Use the index to find the corresponding word in the newly created word list.

