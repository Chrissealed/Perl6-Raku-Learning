#!/usr/bin/env perl6
#
# Program Arguments and the MAIN Subroutine
#
# There is another (and often better) way to have a program use varying input defined
# by the user, which is to pass command-line arguments to the program, just as we
# have passed arguments to our subroutines.
# The easiest way to retrieve arguments passed to a program is to use a special subrou‐
# tine named MAIN. A program that has a defined MAIN subroutine will usually start its
# execution with that subroutine and the command-line arguments supplied to the
# program will be passed as arguments to MAIN. The MAIN signature will thus enable you
# to retrieve the arguments provided in the command line and possibly also check their
# validity.
# For example, the greet.pl6 program might look like this:

sub MAIN (Str $name) {
    say "Hello $name";
}

# You may call this program twice with different command-line arguments as follows:

# $ perl6 greet.pl6 Larry
# Hello Larry
# $ perl6 greet.pl6 world
# Hello world
#
# It is very easy to change the argument, since all you need to do under the operating
# system command line is use the up arrow and edit the end of the previous command
# line.
# If you forget to supply the argument (or provide the wrong number of arguments, or
# arguments not matching the signature), the program will die and Perl 6 will nicely
# generate and display a usage method:
# $ perl6 greet.pl6
# Usage:
# greet.pl6 <name>

