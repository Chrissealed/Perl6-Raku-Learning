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
#
# Another way to write a traversal is with a for loop:

say 'B:';
for $fruit.comb -> $letter {
    say $letter
}

# Each time through the loop, the next character in the string is assigned to the variable
# $letter . The loop continues until no characters are left.
#
# The loop could also use the substr function:

say 'C:';
for 0..$fruit.chars - 1 -> $index {
    say substr $fruit, $index, 1;
}

# The following example shows how to use concatenation and a for loop to generate an
# abecedarian series (that is, in alphabetical order). In Robert McCloskey’s book Make
# Way for Ducklings, the names of the ducklings are Jack, Kack, Lack, Mack, Nack,
# Ouack, Pack, and Quack. This loop outputs these names in order:

say 'D:';
my $suffix = 'ack';
for 'J'..'Q' -> $letter {
    say $letter ~ $suffix;
}
# The output is:
# Jack
# Kack
# Lack
# Mack
# Nack
# Oack
# Pack
# Qack

# Of course, that’s not quite right because “Ouack” and “Quack” are misspelled. As an
# exercise, modify the program to fix this error. Solution: “Exercise: The Ducklings” on
# page 366.
#
# Looping and Counting
#
# The following program counts the number of times the letter “a” appears in a string:

say 'E:';
my $word = 'banana';
my $count = 0;
for $word.comb -> $letter {
    $count++ if $letter eq 'a';
}
say $count;
# -> 3

# This program demonstrates another pattern of computation called a counter. The
# variable $count is initialized to 0 and then incremented each time an “a” is found.
# When the loop exits, $count contains the result—the total number of occurrences of
# letter “a”.
#
# As an exercise, encapsulate this code in a subroutine named count , and generalize it
# so that it accepts the string and the searched letter as arguments. Solution: “Exercise:
# Counting the Letters of a String” on page 367.

