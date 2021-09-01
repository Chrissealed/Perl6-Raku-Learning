#!/usr/bin/env perl6
#
# The while Statement
#
# Computers are often used to automate repetitive tasks. Repeating identical or similar
# tasks without making errors is something that computers do well and people do
# poorly. In a computer program, repetition is also called iteration.
# We have already seen two functions, countdown and print-n-times, that iterate
# using recursion (see “Recursion” on page 66). Because iteration is so common, most
# programming languages including Perl provide language features to make it easier.
# One is the for statement we saw in “for Loops” on page 64. We’ll get back to that later.
# Another is the while statement. Here is a version of countdown that uses a while
# statement:

sub countdown(Int $n is copy) {
    while $n > 0 {
        say $n;
        $n--;
    }
    say 'Blastoff!';
}

countdown 5;

# You can almost read the while statement as if it were English. It means, “While $n is
# greater than 0, display the value of n and then decrement $n. When you get to 0, dis‐
# play the word Blastoff!”
# More formally, here is the flow of execution for a while statement:
#
# 1. Determine whether the condition is true or false.
# 2. If false, exit the while statement and continue execution at the next statement.
# 3. If the condition is true, run the body and then go back to step 1.
#
# This type of flow is called a loop because the third step loops back around to the top.
# The body of the loop should change the value of one or more variables so that the
# condition becomes false eventually and the loop terminates. Otherwise, the loop will
# repeat forever, which is called an infinite loop. An endless source of amusement for
# computer scientists is the observation that the directions on shampoo, “Lather, rinse,
# repeat,” are an infinite loop.
# In the case of countdown, we can prove that the loop terminates: if $n is zero or nega‐
# tive, the loop never runs. Otherwise, $n gets smaller each time through the loop, so
# eventually we have to get to 0.
#
# For some other loops, it is not so easy to tell whether the loop terminates. For
# example:

sub sequence($n is copy) {
    while $n != 1 {
        say $n;
        if $n %% 2 { # $n is even
            $n = $n / 2;
        } else {     # $n is odd
            $n = $n*3 + 1;
        }
    }
    return $n;
}

sequence 42;

# The condition for this loop is $n != 1, so the loop will continue until $n is 1, which
# makes the condition false.
# Each time through the loop, the program outputs the value of $n and then checks
# whether it is even or odd. If it is even, $n is divided by 2. If it is odd, the value of $n is
# replaced with $n*3 + 1. For example, if the argument passed to sequence is 42, the
# resulting values of n are 42, 21, 64, 32, 16, 8, 4, 2, 1.
# Since $n sometimes increases and sometimes decreases, there is no obvious proof that
# $n will ever reach 1, or that the program terminates. For some particular values of n ,
# we can prove termination. For example, if the starting value is a power of two, n will
# be even every time through the loop until it reaches 1. The previous example ends
# with such a sequence of powers of two, starting with 64.
# The hard question is whether we can prove that this program terminates for all posi‐
# tive values of n. So far, no one has been able to prove it or disprove it! (See http://
# en.wikipedia.org/wiki/Collatz_conjecture.)
#
# As an exercise, you might want to rewrite the function print-n-times from “Recur‐
# sion” on page 66 using iteration instead of recursion.
#
# The while statement can also be used as a statement modifier (or postfix syntax):

my $val = 5;
print "$val " while $val-- > 0;
print "\n";

# prints 4 3 2 1 0
# The while loop statement executes the block as long as its condition is true. There is
# also an until loop statement, which executes the block as long as its condition is
# false:

$val = 1;
until $val > 5 {
    print $val++;
}
say "";

# print "\n";
# # prints 12345

