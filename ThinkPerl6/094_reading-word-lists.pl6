#!/usr/bin/env perl6
#
# Reading Word Lists
#
# For the exercises in this chapter we need a list of English words. There are lots of
# word lists available on the web, but one of the most suitable for our purpose is one of
# the word lists collected and contributed to the public domain by Grady Ward as part
# of the Moby lexicon project. It is a list of 113,809 official crosswords; that is, words
# that are considered valid in crossword puzzles and other word games. In the Moby
# collection, the filename is 113809of.fic; you can download a copy, with the simpler
# name words.txt, from http://thinkpython2.com/code/words.txt.
# This file is in plain text (with each word of the list on its own line), so you can open it
# with a text editor, but you can also read it from Perl. Let’s do so in the interactive
# mode (with the REPL):

say 'A:';
my $fh = open("tmp/words.txt", :r);
# IO::Handle<words.txt>(opened, at octet 0)
my $line = get $fh;
# aa
say "<<$line>>";
# <<aa>>

# The get function reads one line from the file handle.
# The first word in this particular list is “aa” (a kind of lava).
# Printing the $line variable between angle brackets within a string shows us that the
# get function removed implicitly the trailing newline characters, in this case a \r\n
# (carriage return and newline) character combination, since this file was apparently
# prepared under Windows.
# The file handle keeps track of what has been read from the file and what it should
# read next, so if you call get again, you obtain the next line:

say 'B:';
$line = get $fh;
# aah
say $line;

# The next word is “aah,” which is a perfectly legitimate word, so stop looking at me like
# that.
#
# This is good and fine if we want to explore the first few lines of the words.txt file, but
# we are not going to read the 113,809 lines of the file this way.
# We need a loop to do it for us. We could insert the above get instruction into a while
# loop, but earlier we discussed an easier and more efficient way of doing this with a
# for loop and the IO.lines method, without the hassle of having to open or close the
# file:

say 'C:';
for 'tmp/words.txt'.IO.lines -> $line {
    say $line;
    exit if $line ~~ / aba /;
}

# This code reads the file line by line, and prints each line to the screen. We’ll soon do
# more interesting things than just displaying the lines on the screen.

