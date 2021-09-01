#!/usr/bin/env perl6
#
# Hash Subtraction
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

# Finding the words from emma.txt that are not in the word list words.txt is a problem
# you might recognize as set subtraction; that is, we want to find all the words from one
# set (the words in emma.txt) that are not in the other (the words in words.txt).
# subtract takes hashes %main and %dict and returns a new hash that contains all the
# keys from %main that are not in %dict . Since we don’t really care about the values, we
# set them all to 1:

sub subtract (%main, %dict) {
    my %difference;
    for %main.keys -> $word {
        %difference{$word} = 1 unless %dict{$word}:exists;
    }
    return %difference;
}

# To find the words in emma.txt that are not in words.txt, we need to load the word list
# into a hash and call subtract , passing the two hashes as arguments. We also add
# some code to print the first 20 words not found in the word list:

my %word-list = map { $_ => 1 }, "tmp/words.txt".IO.lines;
my %unknown-words = subtract(%histogram, %word-list);
say %unknown-words.keys.head(20);

# Notice that rather than using a subscript slice, I have used here the head method to
# print out the first 20 words of the list. This is just another way to get the first “n”
# items of a list or array. There is also a tail method to retrieve the last “n” items of a
# list or an array.
#
# Here are some of the results from Emma:
# (penetrated unsullied bateses outstepped particularity experienced
# italian sunday solicitously blockhead unbleached ult 26th
# christian 7th untouched iii greensward houseroom tete)
#
# Some of these words are names and ordinal numbers. Others are rare or no longer in
# common use. But a few are common words that should really be in the list!
# Note that I have used a hash (%unknown-words) here to store the words of emma.txt
# not found in the word list. Since we are using the data only to print a sample of 20
# words, we could have used an array as well.

