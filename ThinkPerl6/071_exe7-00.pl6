#!/usr/bin/env perl6
#
# String Traversal with a while or for Loop
#
# A lot of computations involve processing a string one character at a time. Often they
# start at the beginning, select each character in turn, do something to it or with it, and
# continue until the end. This pattern of processing is called a traversal. One way to
# write a traversal is with a while loop and the index function:

say 'A:';
my $index = 0;
my $fruit = "banana";
while $index < $fruit.chars {
    my $letter = substr $fruit, $index, 1;
    say $letter;
    $index++;
}

# This will output each letter, one at a time:
# b
# a
# n
# a
# n
# a

# This loop traverses the string and displays each letter on a line by itself. The loop con‐
# dition is $index < $fruit.chars, so when $index is equal to the length of the string,
# the condition is false, and the body of the loop doesn’t run. In other words, the loop
# stops when $index is the length of the string minus one, which corresponds to the
# last character of the string.
#
# As an exercise, write a function that takes a string as an argument and displays the
# letters backward, one per line. Do it at least once without using the flip function.
# Solution: “Exercise: String Traversal” on page 365.

