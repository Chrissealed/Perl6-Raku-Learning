#!/usr/bin/env perl6
#
# Traversing a List
#
# The most common way to traverse the elements of a list or an array is with a for loop.
# The syntax for an array is the same as what we have already seen in earlier chapters
# for lists:

say 'A:';
my @colors = <red orange yellow green blue indigo violet>;
for @colors -> $color {
    say $color;
}

# This works well if you only need to read the elements of the list. But if you want to
# write or update the elements of an array, you need a doubly pointy block. For exam‐
# ple, you might use the tc (title case) function to capitalize the first letter of each word
# of the array:

for @colors <-> $color {$color = tc $color};
say @colors; # -> [Red Orange Yellow Green Blue Indigo Violet]

# Here the $color loop variable is a read-and-write alias on the array’s items, so that
# changes made to this alias will be reflected in the array. This works well with arrays,
# but would not work with lists, which are immutable. You would get an error with a
# list:
#
# > for <red orange yellow> <-> $color { $color = tc $color}
#
# Parameter '$color' expected a writable container, but got Str value...
#
# You may also use the syntax of a for loop with the $_ topical variable. For example,
# this uses the uc (uppercase) function to capitalize each word of the previous array:

for @colors {
    $_ = $_.uc;
}
say @colors; # -> [RED ORANGE YELLOW GREEN BLUE INDIGO VIOLET]

# Sometimes, you want to traverse an array and need to know the index of the elements
# you are visiting. A common way to do that is to use the .. range operator to iterate
# on the indices. For instance, to print the index and the value of each element of an
# array:

say 'B:';
for 0..@colors.end -> $idx {
    say "$idx @colors[$idx]";
}

# This is useful, for example, for traversing two (or more) arrays in parallel:

say 'C:';
my @letters = 'a'..'e';
my @numbers = 1..5;
for 0..@letters.end -> $idx {
    say "@letters[$idx] -> @numbers[$idx]";
}
# which will print:
# a -> 1
# b -> 2
# c -> 3
# d -> 4
# e -> 5

# You don’t really need to specify the index range yourself, as the keys function will
# return a list of indices for the array or the list:

say 'D:';
for keys @colors -> $idx {
    say "$idx @colors[$idx]";
}

# Another way to iterate over the indices and values of an array is the kv (“keys values”)
# function or method, which returns the index and value of each array item:

say 'E:';
for @letters.kv -> $idx, $val {
    say "$idx $val";
}

# In list context, @letters.kv simply returns an interleaved sequence of indexes and
# values:

say 'F:';
say @letters.kv; # -> (0 a 1 b 2 c 3 d 4 e)

# It is the pointy block with two iteration variables that makes it possible to process
# both an index and a value at each step of the loop. You can of course have more than
# two iteration variables if needed.

