#!/usr/bin/env perl6
#
# Word Histogram
#
# You should attempt the previous exercises before you go on.
# For the purpose of presenting the solutions to the above exercises, I’ve used the plain
# text of Emma (1816), the novel by Jane Austen, downloaded from the Gutenberg
# project and saved in a file called emma.txt. Use the same text if you want to compare
# your solutions and results with mine.
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

# The program reads each line of the emma.txt file and, for each line, calls process-
# line .
# The process-line subroutine skips the header lines (i.e., all the lines until a line con‐
# taining the string “*END*THE SMALL PRINT!” is met). It replaces dashes and apos‐
# trophes with spaces, removes various punctuation characters, and sets the line to
# lowercase. Finally, it splits the line into individual words that are stored and counted
# with an accumulator in the %histogram hash.
#
# To know whether the program is doing something like what it is supposed to do, we
# can display a few entries of the %histogram hash:
#
# displaying 20 lines of the histogram

say 'B:';
my $count;
for %histogram -> $pair {
    say sprintf "%-24s %d", $pair.key, $pair.value;
    $count++;
    last if $count > 20;
}
# This prints out the following output:
# embarrassing       1
# hows               1
# appealed           2
# bestow             2
# articulate         1
# demands            2
# closely            1
# dull               9
# hearts             1
# column             1
# possesses          1
# attributed         1
# jumped             2
# forwards           2
# wittier            2
# expert             2
# attractive         2
# asserted           2
# oftentimes         1
# fancy              38
# finds              1
#
# To count the total number of words in the file, we can add up the values in the histo‐
# gram:

say 'C:';
my $word_count = [+] %histogram.values;
say "There are $word_count words in the book.";

# The number of different words is just the number of items in the hash:

say 'D:';
my $distinct-words = %histogram.elems;
say "There are $distinct-words distinct words in the book.";

# Note that you could reduce the above to one code line by interpolating a code block
# within the output string:

say 'E:';
say "There are {%histogram.elems} distinct words in the book."
# And the results:
# There are 161991 words in the book.
# There are 7110 distinct words in the book.

