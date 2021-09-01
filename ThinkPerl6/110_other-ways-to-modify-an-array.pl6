#!/usr/bin/env perl6
#
# Other Ways to Modify an Array
#
# The shift and pop functions remove respectively the first and the last item of an
# array and return that item. It is possible to do almost the same operation on any item
# of an array, using the delete adverb:

say 'A:';
my @fruit = <apple banana pear cherry pineapple orange>;
say @fruit;
my $removed = @fruit[2]:delete;
say $removed; # -> pear
say @fruit; # -> [apple banana (Any) cherry pineapple orange]

# Notice that the third element (“pear”) is removed and returned, but the array is not
# reorganized; the operation leaves a sort of “empty slot,” an undefined item, in the
# middle of the array. The colon (“:”) syntax used here is the operator for an adverb (we
# discussed adverbs in “Regular Expressions (Regexes)” on page 116); for the time
# being, you may think of it as a kind of special method operating on one element of an
# item collection.
#
# We have seen how to use array slices to retrieve several items of an array or a list at a
# time. The same slice syntax can also be used on the left side of an assignment to mod‐
# ify some elements of an array:

say 'B:';
my @digits = <1 2 3 6 5 4 7 8 9>;
say @digits;
@digits[2..4] = 4, 5, 6;
say @digits; # -> [1 2 4 5 6 4 7 8 9]

# Of course, you can’t do this with lists, since, as you remember, they are immutable.
#
# The splice function may be regarded as the Swiss Army knife of arrays. It can add,
# remove, and return one or several items to or from an array. The general syntax is as
# follows:

say 'C:';
my @array = <1 3 5 7 9>;
say @array;
my $start = 0;
say $start;
my $num_elems = 2;
say $num_elems;
my @replacement = <11, 13>;
say @replacement;
my @out_array = splice @array, $start, $num_elems, @replacement;
say @out_array;

# The arguments for splice are the input array, the index of the first element on which
# to make changes, the number of elements to be affected by the operation, and a list of
# replacements for the elements to be removed. For example, to perform the slice
# assignment shown just above, it is possible to do this:

@digits = <1 2 3 6 5 4 7 8 9>;
my @removed_digits = splice @digits, 3, 3, 4, 5, 6;
say @removed_digits; # -> [6 5 4]
say @digits; # -> [1 2 4 5 6 7 8 9]

# Here, the splice statement removed three elements (6, 5, 4) and replaced them with
# the replacement arguments (4, 5, 6). It returned the removed items to @removed_dig
# its. The number of replacements does not need to be the same as the number of
# removed items, in which case the array size will grow or shrink. For example, if no
# replacement is provided, then splice will just remove and return the required num‐
# ber of elements and the array size will be reduced by the same number:

say 'D:';
@digits = 1..9;
@removed_digits = splice @digits, 3, 2;
say @removed_digits; # -> [4 5]
say @digits; # -> [1 2 3 6 7 8 9]

# Conversely, if the number of elements to be removed is zero, no element will be
# removed, an empty array will be returned, and the elements in the replacement list
# will be added in the right place:

say 'E:';
@digits = <1 2 3 6 4 7 8 9>;
@removed_digits = splice @digits, 3, 0, 42;
say @removed_digits; # -> []
say @digits; # -> [1 2 3 42 6 4 7 8 9]

# Assuming the shift function did not exist in Perl, you could write a my-shift sub‐
# routine to simulate it:

say 'F:';
multi sub my-shift (@array) {
    my @result = splice @array, 0, 1;
    return @result[0];
}
my @letters = 'a'..'j';
my $letter = my-shift @letters;
say $letter; # -> a
say @letters; # -> [b c d e f g h i j]

# We might raise an exception if the array passed to my-shift is empty. This could be
# done by modifying the subroutine as follows:

say 'G:';
sub my-shift2 (@array) {
    die "Cannot my-shift from an empty array" unless @array;
    my @result = splice @array, 0, 1;
    return @result[0];
}
$letter = my-shift2 @letters;
say $letter;
say @letters;

# or by adding a nonempty constraint on the array in the subroutine signature:

say 'H:';
multi sub my-shift (@array where @array > 0) {
    my @result = splice @array, 0, 1;
    return @result[0];
}
$letter = my-shift @letters;
say $letter;
say @letters;

# The @array > 0 expression evaluates to True if the number of elements of the array is
# more than 0, i.e., if the array is not empty. It is equivalent to @array.elems > 0.

