#!/usr/bin/env perl6
#
# Keyboard Input
#
# The programs we have written so far accept no input from the user. They just do the
# same thing every time. Perl provides built-in functions that stop the program and
# wait for the user to type something.
#
# For example, the prompt function prompts the user with a question or an instruction.
# When the user presses Return or Enter, the program resumes and prompt returns
# what the user typed as a string (without the newline character corresponding to the
# Return key typed by the user):

my $user = prompt "Please type in your name: ";
say "Hello $user";

# This is probably one of the most common ways to obtain interactive user input,
# because it is usually a good idea to tell the user what is expected.
# Another possibility is to use the get method (which reads a single line) on standard
# input:

say "Please type in your name: ";
$user = $*IN.get;
say "Hello $user";
# or the get function, which reads a line from standard input by default:
say "Please type in your name: ";
$user = get;
say "Hello $user";

