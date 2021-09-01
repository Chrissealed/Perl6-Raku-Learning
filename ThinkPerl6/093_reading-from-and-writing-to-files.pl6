#!/usr/bin/env perl6
#
# Reading from and Writing to Files
#
# For the exercises in this chapter, we will need our programs to read text from files. In
# many programming languages, this often means that we need a statement to open a
# file, then a statement or group of statements to read the file’s content, and finally a
# statement to close the file (although this last operation may be performed automati‐
# cally in some circumstances).
# We are interested here in text files that are usually made of lines separated by logical
# newline characters; depending on your operating system, such logical newline char‐
# acters consist of either one (Linux, Mac) or two (Windows) physical characters
# (bytes).
# The Perl built-in function open takes the path and name of the file as a parameter and
# returns a file handle (IO::Handle object) which you can use to read the file (or to
# write to it):

say 'A:';
#my $fh = open("path/to/myfile.txt", :r);
my $fh = open("./092_case-study_word-play.txt", :r);
my $data = $fh.slurp-rest;
say $data;
$fh.close;

# The :r option is the file mode (read). $fh is a common name for a file handle. The
# file object provides methods for reading, such as slurp-rest, which returns the full
# content of the file from the current position to the end (and the entire content of the
# file if we’ve just opened it).
#
# This is the traditional way of opening and reading files in most languages.
# However, Perl’s IO role (in simple terms, a role is a collection of related methods)
# offers simpler methods which can open a file and read it all in one single instruction
# (i.e., without having to first open a file handle and then close it):

say 'B:';
#my $text = slurp "path/to/myfile.txt";
my $text = slurp "./092_case-study_word-play.txt";
say $text;
# or:
#my $text = "path/to/myfile.txt".IO.slurp;
$text = "./092_case-study_word-play.txt".IO.slurp;
say $text;

# slurp takes care of opening and closing the file for you.
#
# We can also read the file line by line, which is very practical if each line contains a
# logical entity such as a record, and is especially useful for very large files that might
# not fit into memory:

say 'C:';
#for 'path/to/hugefile.txt'.IO.lines -> $line {
for './Glossary.txt'.IO.lines -> $line {
    # Do something with $line
    say $line if $line ~~ / CHAPTER /;
}

# By default, the .lines method will remove the trailing newline characters from each
# line, so that you don’t have to worry about them.
#
# We haven’t studied arrays yet, but you can also read all lines of a file into an array,
# with each line of the file becoming an array item. For example, you can load the
# myfile.txt file into the @lines array:

say 'D:';
#my @lines = "myfile.txt".IO.lines;
my @lines = "./092_case-study_word-play.txt".IO.lines;

# Accessing any line can then be done with the bracket operator and an index. For
# example, to print the first and the seventh line:

say @lines[0];
say @lines[6];

# To write data to a file, it is possible to open a file just as when wanting to read from it,
# except that the :w (write) option should be used:

say 'E:';
#my $fh = open("path/to/myfile.txt", :w);
$fh = open("tmp/newtestfile.txt", :w);
$fh.say("line to be written to the file");
$fh.close;

# If the file already existed, any existing content will be clobbered. So be careful when
# you want to open a file in write mode.
#
# It is also possible to open the file in append mode, using the :a option. New data will
# then be added after the existing content.
#
# Writing to a file can be simplified using the spurt function, which opens the file,
# writes the data to it, and closes it:

say 'F:';
#spurt "path/to/myfile.txt", "line to be written to the file\n";
spurt "tmp/newtestfile.txt", "line to be written to the file\n";

# Used this way, spurt will clobber any existing content in the file. It may also be used
# in append mode with the :append option:

say 'G:';
#spurt "path/to/myfile.txt", "line to be added\n", :append;
spurt "tmp/newtestfile.txt", "line to be added\n", :append;

