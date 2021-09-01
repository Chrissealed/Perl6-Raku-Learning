#!/usr/bin/env perl6
#
# More Advanced Sorting Techniques
#
# The sort routine typically takes two arguments, a code object and a list of items to be
# sorted, and returns a new sorted list. If no code object is specified, as in the examples
# we have seen above, the cmp built-in comparison operator is used to compare the ele‐
# ments. If a code object is provided (and if it accepts two arguments), then it is used to
# perform the comparison, which tells sort which of the two elements should come
# first in the final order.
#
# There are three built-in comparison operators that can be used for sorting. They are
# sometimes called three-way comparators because they compare their operands and
# return a value meaning that the first operand should be considered less than, equal to,
# or more than the second operand for the purpose of determining in which order
# these operands should be sorted. The leg operator coerces its arguments to strings
# and performs a lexicographic comparison. The <=> operator coerces its arguments to
# numbers (real) and does a numeric comparison. The aforementioned cmp operator is
# the “smart” three-way comparator, which compares strings with string semantics and
# numbers with number semantics.
#
# Most of our simple examples above worked well with strings and numbers because
# they implicitly used the default cmp operator, which “guesses” quite well which type of
# comparison to perform.
#
# In other words, this:

say 'A:';
say sort <4 6 2 9 1 5 11>; # -> (1 2 4 5 6 9 11)

# is equivalent to this:

say 'B:';
say sort { $^a cmp $^b }, <4 6 2 9 1 5 11>; # -> (1 2 4 5 6 9 11)

# The code block used here as the first argument to the sort routine again uses the
# placeholder parameters (or self-declared parameters) seen earlier in this chapter. The
# cmp routine receives two arguments that are bound to $^a and $^b and returns to the
# sort function information about which of the two items should come first in the
# resulting order.
#
# If you wanted to sort in reverse order, you could just swap the order of the two place‐
# holder parameters:

say sort { $^b cmp $^a }, <4 6 2 9 1 5 11>; # -> (11 9 6 5 4 2 1)

# Note that this example is given only for the purpose of explaining some features of
# the placeholder parameters. To sort the array we’ve presented here in descending
# order, it might just be easier to obtain the same result with the following code:

say reverse sort <4 6 2 9 1 5 11>; # -> (11 9 6 5 4 2 1)

# The reason sort does a good job even with mixed strings and integers is because the
# default comparison function, cmp, is pretty clever and guesses by looking at its argu‐
# ments whether it should perform a lexicographic order or numeric order comparison.
# If sorting gets too complicated for cmp, or, more generally, when a specific or custom
# order is required, then you have to write your own ad-hoc comparison subroutine.
# For example, if we take again the example of strings with mixed-case letters, we may
# achieve a case-insensitive alphabetical order this way:

say 'C:';
say sort { $^a.lc cmp $^b.lc}, <a ab abc A bc BAC AC>; # -> (a A ab abc AC BAC bc)

# or this way:

say sort { $^a.lc leg $^b.lc}, <a ab abc A bc BAC AC>; # -> (a A ab abc AC BAC bc)

# Here, when the comparison code block receives its two arguments, the lc method
# casts them to lowercase before performing the comparison. Notice that this has no
# impact on the case of the output, since the lowercase transformation is local to the
# comparison code block and has no impact on the data handled by sort. We will see
# shortly that there is a simpler and more efficient way of doing such a transformation
# before comparing the arguments.
#
# If the comparison specification is more complicated, we may need to write it in a sep‐
# arated subroutine and let sort call that subroutine. Suppose we have a list of strings
# that are all formed of leading digits followed by a group of letters and possibly fol‐
# lowed by other irrelevant characters, and that we want to sort the strings according to
# the group of letters that follows the digits.
#
# Let’s start by writing the comparison subroutine:

say 'D:';
sub my_comp ($str1, $str2) {
    my $cmp1 = $0 if $str1 ~~ /\d+(\w+)/;
    my $cmp2 = $0 if $str2 ~~ /\d+(\w+)/;
    return $cmp1 cmp $cmp2;
}

# Nothing complicated: it takes two arguments, uses a regex for extracting the group of
# letters in each of the arguments, and returns the result of the cmp function on the
# extracted strings. In the real world, something might need to be done if either of the
# extractions fails, but we will assume for our purposes here that this will not happen.
# The sorting is now quite straightforward; we just need to pass the above subroutine
# to the sort function:

say sort &my_comp, < 22ac 34bd 56aa3 12c; 4abc( 1ca 45bc >; # -> (56aa3 4abc( 22ac 45bc 34bd 12c; 1ca)

# We only need to prefix the comparison subroutine with the “&” ampersand sigil and
# it works fine: the strings are sorted in accordance to the letter groups that follow the
# leading digits.
#
# In all the examples above, the comparison subroutine accepted two parameters, the
# two items to be compared. The sort function may also work with a code object tak‐
# ing only one parameter. In that case, the code object is not a comparison code block
# or subroutine, but is a code object implementing the transformation to be applied to
# the items before using the default cmp comparison routine.
#
# For example, if we take once more the example of strings with mixed-case letters, we
# may achieve a case-insensitive alphabetical order yet in a new way:

say 'E:';
say sort { $_.lc }, <a ab abc A bc BAC AC>; # -> (a A ab abc AC BAC bc)

# This could also be written with a placeholder parameter:

say sort { $^a.lc }, <a ab abc A bc BAC AC>; # -> (a A ab abc AC BAC bc)

# Here, since the comparison code block takes only one argument, it is meant to trans‐
# form each of the items to be compared before performing the standard cmp routine
# on the arguments. This not only makes things simpler, but is also probably more effi‐
# cient, especially if the number of items to be sorted is large and if the transformation
# subroutine is relatively costly: the transformed values are actually cached (i.e., stored
# in memory for repeated use), so that the transformation is done only once for each
# item, despite the fact that the comparison routine is called many times for each item
# in a sort.
#
# Similarly, we could sort numbers according to their absolute values:

say 'F:';
say sort {$_.abs}, <4 -2 5 3 -12 42 8 -7>; # -> (-2 3 4 5 -7 8 -12 42)

# If you think about it, the “more complicated” example with digits and letters requir‐
# ing a separate subroutine is also applying the same transformation to both its argu‐
# ments. As an exercise, write a (simpler) sorting program using a transformation
# subroutine and the default cmp operator on transformed items. Solution: “Exercise:
# Advanced Sorting Techniques” on page 386.
#
# Needless to say, the (so-called) advanced uses of the sort function presented in this
# section are yet more examples of the functional programming style. The comparison
# subroutines and the transformation subroutines are passed around as arguments to
# the sort function, and, more broadly, all of the functions, subroutines, and code
# blocks used here are higher-order functions or first-class functions.

