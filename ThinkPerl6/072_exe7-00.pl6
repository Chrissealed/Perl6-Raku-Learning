#!/usr/bin/env perl6
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

