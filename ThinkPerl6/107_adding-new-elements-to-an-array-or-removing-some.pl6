#!/usr/bin/env perl6
#
# Adding New Elements to an Array or Removing Some
#
# We’ve just seen that assigning an item to an index that does not yet exist will expand
# the array. There are other ways of expanding an array.
# Perl has operators to add elements to, or remove one element from, an array:
# shift
# Removes the first item of an array and returns it
# pop
# Removes the last item of an array and returns it
# unshift
# Adds an item or a list of items to the beginning of an array
# push
# Adds an item or a list of items to the end of an array
#
# These are a few examples for each:

say 'A:';
my @numbers = <2 4 6 7>;
say @numbers;
# [2 4 6 7]
push @numbers, 8, 9;
say @numbers;
# [2 4 6 7 8 9]
unshift @numbers, 0, 1;
say @numbers;
# [0 1 2 4 6 7 8 9]
my $num = shift @numbers;
say $num;
# 0
$num = pop @numbers;
say $num;
# 9
say @numbers;
# [1 2 4 6 7 8]

# As you might expect by now, these routines also come with a method invocation syn‐
# tax. For example:

say 'B:';
@numbers = <2 4 6 7>;
say @numbers;
# [2 4 6 7]
@numbers.push(8, 9);
say @numbers;
# [2 4 6 7 8 9]

# Note, however, that if you push or unshift an array onto another array, you’ll get
# something different than what you might expect:

say 'C:';
@numbers = <2 4 6 7>;
say @numbers;
# [2 4 6 7]
my @add-array = 8, 10;
say @add-array;
# [8 10]
@numbers.push(@add-array);
say @numbers;
# [2 4 6 7 [8 10]]

# As you can see, when @add-array is added as an entity to the @numbers array, @add-
# array becomes the new last item of the original array. If you want to add the items of
# @add-array to the original array, you may use the append method instead of push :

say 'D:';
@numbers = <2 4 6 7>;
say @numbers;
# [2 4 6 7]
@numbers.append(@add-array);
say @numbers;
# [2 4 6 7 8 10]

# Or you can use the “|” prefix operator to flatten the added array into a list of argu‐
# ments:

say 'E:';
@numbers = <2 4 6 7>;
say @numbers;
# [2 4 6 7]
@numbers.push(|@add-array);
say @numbers;
# [2 4 6 7 8 10]

# There is also a prepend method that can replace unshift to add individual items of
# an array at the beginning of an existing array (instead of adding the array as a single
# entity).

