#!/usr/bin/env perl6
#
# Arrays Are Mutable
#
# The syntax for accessing the elements of an array or a list uses the square brackets
# operator. The expression inside the brackets specifies the index or subscript, which
# can be a literal integer (or some value that can be coerced into an integer), a variable
# containing a numerical value, a list or a range of numerical values, an expression or a
# piece of code returning a numerical value, etc. Indices are offsets compared to the
# beginning of the array or the list (much in the same way as the values returned by the
# index function on strings), so they start at 0. Thus, the first item of an array has index
# 0, the second item index 1, and so on:

say 'A:';
say <sat sun>[1]; # (accessing a list item)
# -> sun
my @weekdays = <mon tue wed thu fri>; # assigning an array
say "The third day is @weekdays[2]"; # -> The third day is wed

# You may also use ranges or lists of indices to access slices of an array or a list:

say 'B:';
my @even-digits = 0, 2, 4, 6, 8;
say @even-digits;
# [0 2 4 6 8]
my @small-even_digits = @even-digits[0..2];
say @small-even_digits;
# [0 2 4]
my @min-max-even-digits = @even-digits[0, 4];
say @min-max-even-digits;
# [0 8]

# If you need a slice in the opposite order, you can use the reverse function to reverse
# the range:

say 'C:';
my @reverse-small-even_digits = @even-digits[reverse 0..2];
say @reverse-small-even_digits;
# [4 2 0]
# or reverse the data returned by the slice expression:
@reverse-small-even_digits = reverse @even-digits[0..2];
say @reverse-small-even_digits;
# [4 2 0]

# Unlike lists, arrays are mutable. When the bracket operator appears after an array on
# the left side of an assignment, it identifies the element of the array that will be
# assigned:

say 'D:';
@even-digits = 0, 2, 2, 6, 8;
say @even-digits;
# Oops, error on the second 2
# [0 2 2 6 8]
@even-digits[2] = 4; # fixing the faulty third digit
# 4
say @even-digits;
# [0 2 4 6 8]

# The third element of even-digits , which was (presumably by mistake) 2, is now 4. If
# the index corresponds to an item which does not exist yet in the array, the array will
# be expanded to include the new element:

say 'E:';
my @odds = 1, 3, 5;
say @odds;
# [1 3 5]
@odds[3] = 7;
# 7
say @odds;
# [1 3 5 7]

# The elems function or method returns the number of elements of an array. The end
# function or method returns the index of the last elements of an array:

say 'F:';
my @nums = 1..5;
say @nums;
say @nums.elems;
say elems @nums;
say @nums.end;
# [1 2 3 4 5]
# 5
# 5
# 4

# The end method returns the result of the elems method minus one because, since
# indices start at 0, the index of the last element is one less than the number of ele‐
# ments.
#
# The unique function or method returns a sequence of unique elements of the input
# list or array (i.e., it returns the original list without any duplicate values):

say 'G:';
say < a b d c a f d g>.unique;
# (a b d c f g)

# If you know that the input is sorted (and that, therefore, duplicates are adjacent), use
# the squish function instead of unique, as this is likely to be more efficient. The
# squish function removes adjacent duplicates.
#
# To know whether two arrays are identical (structurally the same, with the same type
# and same values), use the eqv equivalence operator. To know whether they just con‐
# tain the same elements, use the ~~ smart match operator. Between two arrays or lists,
# the == numeric equality operator will return True if the arrays have the same number
# of elements and False otherwise, because == coerces its arguments to numeric type,
# so that it compares the number of elements:

say 'H:';
my @even1 = 0, 2, 4, 6, 8;
say @even1;
# [0 2 4 6 8]
my @even2 = reverse 8, 6, 4, 2, 0;
say @even2;
# [0 2 4 6 8]
say @even1 eqv @even2; # same items, structurally the same
# True
say <1 2 3 4 5> eqv 1..5; # same items, structurally different
# False
say <1 2 3 4 5> ~~ 1..5; # same items, True
# True
my @array = 1..5;
say @array;
# [1 2 3 4 5]
say <1 2 3 4 5> ~~ @array; # same elements, True
# True
say <1 2 3 4 6> ~~ @array; # not the same elements
# False
say <1 2 3 4 5> == <5 6 7 8 9>; # compares the numbers of items
# True

# The <1 2 3 4 5> eqv 1..5 statement returns False because, although they have the
# same items, the arguments are structurally different entities (one is a list and the
# other one a range).

