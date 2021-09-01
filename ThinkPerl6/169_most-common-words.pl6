#!/usr/bin/env perl6
#
# Most Common Words
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

# To find the most common words in emma.txt, we can sort the %histogram hash
# according to the values (word frequencies) and retrieve the 10 most frequent words
# into an array.

say 'B:';
my @most_commons = (sort { %histogram{$^b} cmp %histogram{$^a} },
%histogram.keys)[0..9];
say $_ for map { "$_ \t%histogram{$_} "}, @most_commons;

# The sort function receives the keys of the histogram and its comparison function
# compares the values associated with those keys. Since we use the key $^b before the
# key $^a , the sort will produce a reverse (descending) sort order. The whole sort pro‐
# cedure is placed within parentheses, so that the subscript range [0..9] acts as a slice
# on the list produced by sort and retains only the first 10 most frequent words. The
# result is stored in the @most_commons array. The next code line just reprocesses the
# array to display the words and their respective frequency.
#
# This displays the following output:
# to
# the
# and
# of
# i
# a
# it
# her
# was
# she
# 5241
# 5205
# 4897
# 4295
# 3192
# 3130
# 2529
# 2490
# 2400
# 2364
#
# If you want to see more interesting words, you might, as a further exercise, filter the
# histogram and retain only words that have more than, say, four letters.
# The @most_commons temporary array is not really needed. We could do the whole
# thing in a single statement:

say 'C:';
say $_ for map { "$_ \t%histogram{$_} "},
        (sort { %histogram{$^b} cmp %histogram{$^a} },
        %histogram.keys)[0..9];

# This is an example of data pipeline (or stream) programming. Such a statement needs
# to be read from bottom to top and from right to left. The first step is %histo
# gram.keys, which produces a list of the histogram keys; this list is fed into the sort
# statement to produce a list of the keys sorted (in descending order) according to their
# values; once this whole part between parentheses is completed, the subscript range
# [0..9] retains the 10 most frequent words and feeds them into the map statement,
# which produces the list of words and frequencies for the final output.
# Let me add one word of caution here: sorting the histogram by values and picking up
# the top 10 to get the most frequent words is probably the easiest way to solve the
# problem and the shortest code to do it. That’s the reason I have used this solution
# here. But it is not the most efficient solution from the standpoint of runtime, because
# it involves the cost of sorting a relatively large data set, whereas we are using only a
# small part of the sorted data. There are some better algorithms to do that from the
# standpoint of runtime efficiency, but they are more complicated. So, there is a trade‐
# off here between coding efficiency and performance. Assuming this is code that we
# want to run only once, I have chosen to favor coding efficiency.

