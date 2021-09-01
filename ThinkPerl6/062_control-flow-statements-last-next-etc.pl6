#!/usr/bin/env perl6
#
# Control Flow Statements (last, next, etc.)
#
# Sometimes you don’t know it’s time to end a loop until you get halfway through the
# body. In that case, you can use a control flow statement such as last to jump out of
# the loop.
# For example, suppose you want to take input from the user until they type done. You
# could write:

say 'A:';
while True {
    my $line = prompt "Enter something ('done' for exiting)\n";
    last if $line eq "done";
    say $line;
}
say 'Done!';

# The loop condition is True, which is always true, so the loop runs until it hits the
# last statement.
# Each time through, it prompts the user to type something. If the user types done, the
# last statement exits the loop. Otherwise, the program echoes whatever the user types
# and goes back to the top of the loop. Here’s a sample run:
#
# $ perl6 while_done.pl6
# Enter something ('done' for exiting)
# Not done
# Not done
# Enter something ('done' for exiting)
# done
# Done!
#
# This way of writing while loops is common because you can check the condition
# anywhere in the loop (not just at the top) and you can express the stop condition
# affirmatively (“stop when this happens”) rather than negatively (“keep going until
# that happens”).
# Using a while loop with a condition that is always true is a quite natural way of writ‐
# ing an infinite loop, i.e., a loop that will run forever until something else in the code
# (such as the last statement used above) forces the program to break out of the loop.
# This is commonly used in many programming languages, and this works well in Perl.
#
# There is, however, another common and more idiomatic way of constructing infinite
# loops in Perl 6: using the loop statement, which we will study in “New Looping Con‐
# structs” on page 164. For now, we’ll use the while True statement, which is fairly
# legitimate.
# Sometimes, rather than simply breaking out of the while loop as with the last con‐
# trol statement, you need to start the body of the loop at the beginning. For example,
# you may want to check whether the user input is correct with some (unspecified) is-
# valid subroutine before processing the data, and ask the user to try again if the input
# was not correct. In this case, the next control statement lets you start at the top the
# loop body again:

say 'B:';
sub is-valid($string) {
    if $string {
        return True;
    } else {
        return False;
    }
}

while True {
    my $line = prompt "Enter something ('done' for exiting)\n";
    last if $line eq "done";
    next unless is-valid($line); # further processing of $line;
}
say('Done!');

# Here, the loop terminates if the user types “done.” If not, the user input is checked by
# the is-valid subroutine; if the subroutine returns a true value, the processing con‐
# tinues forward; if it returns a false value, then the control flow starts again at the
# beginning of the body of the loop, so the user is prompted again to submit a valid
# input.
#
# The last and next control statements also work in for loops. For example, the fol‐
# lowing for loop iterates in theory on a range of integer numbers between 1 and 20,
# but discards odd numbers by virtue of a next statement and breaks out of the loop
# with a last statement as soon as the loop variable is greater than $max (i.e., 10 in this
# example):

say 'C:';
my $max = 10;
for 1..20 -> $i {
    next unless $i %% 2; # keeps only even values
    last if $i > $max; # stops loop if $i is greater than $max
    say $i; # prints 2 4 6 8 10
}

# You may have as many last and next statements as you like, just as you may have as
# many return statements as you like in a subroutine. Using such control flow state‐
# ments is not considered poor practice. During the early days of structured program‐
# ming, some people insisted that loops and subroutines have only one entry and one
# exit. The one-entry notion is still a good idea, but the one-exit notion has led people
# to bend over backward and write a lot of unnatural code. Much of programming con‐
# sists of traversing decision trees. A decision tree naturally starts with a single trunk
# but ends with many leaves. Write your code with the number of loop controls (and
# subroutine exits) that is natural to the problem you’re trying to solve. If you’ve
# declared your variables with reasonable scopes, everything gets automatically cleaned
# up at the appropriate moment, no matter how you leave the block.

