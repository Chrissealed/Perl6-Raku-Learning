#!/usr/bin/env perl6
#
# Mapping a List to Another List
#
# Sometimes you want to traverse one list while building another. For example, the fol‐
# lowing function takes a list of strings and returns a new list that contains capitalized
# strings:

say 'A:';
sub capitalize_all(@words) {
    my @result;
    push @result, $_.uc for @words;
    return @result;
}

my @lc_words = <one two three>;
say @lc_words;
my @all_caps = capitalize_all(@lc_words); # -> [ONE TWO THREE]
say @all_caps;

# @result is declared without any assignment and is thus created as an empty array;
# each time through the loop, we append the next element. So @result is another kind
# of accumulator.
#
# An operation like capitalize_all is sometimes called a map because it “maps” a
# function (in this case the uc method) to each of the elements in a sequence.
# Perl has a map function that makes it possible to do that in just one statement:

say 'B:';
@lc_words = <one two three>;
say @lc_words;
@all_caps = map { .uc }, @lc_words; # -> [ONE TWO THREE]
say @all_caps;

# Here, the map function applies the uc method to each item of the @lc_words array and
# returns them to the @all_caps array. More precisely, the map function iteratively
# assigns each item of the @lc_words array to the $_ topical variable, applies the code
# block following the map keyword to $_ in order to create new values, and returns a list
# of these new values.
#
# To generate a list of even numbers between 1 and 10, we might use the range operator
# to generate numbers between 1 and 5 and use map to multiply them by two:

say 'C:';
my @evens = map { $_ * 2 }, 1..5; # -> [2 4 6 8 10]
say @evens;

# Instead of using the $_ topical variable, we might also use a pointy block syntax with
# an explicit iteration variable:

say 'D:';
@evens = map -> $num { $num * 2 }, 1..5; # -> [2 4 6 8 10]
say @evens;

# or an anonymous block with a placeholder variable:

say 'E:';
@evens = map { $^num * 2 }, 1..5; # -> [2 4 6 8 10]
say @evens;

# Instead of a code block, the first argument to map can be a code reference (a subrou‐
# tine reference):

say 'F:';
sub double-sq-root-plus-one (Numeric $x) {
    1 + 2 * sqrt $x;
}

my @results = map &double-sq-root-plus-one, 4, 16, 42;
say @results; # -> [5 9 13.9614813968157]

# The subroutine name needs to be prefixed with the ampersand sigil to make clear that
# it is a parameter to map and not a direct call of the subroutine.
# If the name of the array on the left side and on the right side of the assignment is the
# same, then the modification seems to be made “in place,” i.e., it appears as if the origi‐
# nal array is modified in the process.
# This is an immensely powerful and expressive function; we will come back to it later.

