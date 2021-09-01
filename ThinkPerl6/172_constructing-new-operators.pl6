#!/usr/bin/env perl6
#
# Constructing New Operators
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

say 'B:';
my %word-list = map { $_ => 1 }, "tmp/words.txt".IO.lines;

# Learning about hash subtraction is an excellent opportunity to introduce a very inter‐
# esting functionality of Perl 6: the capacity to construct new operators or to redefine
# existing ones.
#
# Since we are subtracting two lists of words, it is tempting to use the minus sign to
# denote this subtraction operation. It is very easy to create such an operator in Perl 6:

say 'C:';
multi sub infix:<-> (%main, %dict) {
    my %difference;
    for %main.keys -> $word {
        %difference{$word} = 1 unless %dict{$word}:exists;
    }
    return %difference;
}

# Compared to the definition of the subtract subroutine, the only differences are in
# the header line. We will cover the details in a later chapter, but let us briefly explain
# here. Most Perl 6 operators are defined as “multi” subroutines, i.e., subroutines that
# can be defined several times with different signatures and bodies; Perl will know
# which one to use depending on the signature. Here we define the minus operator as a
# multi subroutine whose parameters are two hashes; this will be enough for the Perl
# compiler to know that we don’t want the regular subtraction between numerical val‐
# ues, but something else that applies to two hashes. The minus operator is defined as
# “infix,” which means that the operator will be placed between its two operands.
# Calling this new operator is now just as easy as calling the regular subtraction opera‐
# tor between numbers; we just need to use two hashes as operands:

my %unknown-words = %histogram - %word-list;
say 'Unknown words :';
say %unknown-words.keys;

# The rest of the program works just as before.
# This ease of creating new operators is one of the facilities offered by Perl 6 to extend
# the language from within itself. We’ll come back to that and other ways to extend the
# language in later chapters.

