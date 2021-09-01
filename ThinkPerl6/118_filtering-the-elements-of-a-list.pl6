#!/usr/bin/env perl6
#
# Filtering the Elements of a List
#
# Another common list operation is to select some elements from a list and return a
# sublist. For example, the following function takes a list of strings and returns a list
# that contains only the strings containing a vowel:

say 'A:';
sub contains-vowel(Str $string) {
    return True if $string ~~ /<[aeiouy]>/;
}

sub filter_words_with_vowels (@strings) {
    my @kept-string;
    for @strings -> $st {
        push @kept-string, $st if contains-vowel $st;
    }
    return @kept-string;
}

my @with_wowels = <one two three four five>;
say filter_words_with_vowels(@with_wowels);


# contains-vowel is a subroutine that returns True if the string contains at least one
# vowel (we consider “y” to be a vowel for our purpose).
# The filter_words_with_vowels subroutine will return a list of strings containing at
# least one vowel.
#
# An operation like filter_words_with_vowels is called a filter because it selects some
# of the elements and filters out the others.
#
# Perl has a function called grep to do that in just one statement:

say 'B:';
my @input = <one two three four five>;
say my @filtered = grep { /<[aeiouy]>/ }, @input;

# The name of the grep built-in function used to filter some input comes from the
# Unix world, where it is a utility that filters the lines that match a given pattern from
# an input file.
# In the code example above, all of @input strings will be tested against the grep block,
# and those matching the regex will go into the filtered array. Just like map, the grep
# function iteratively assigns each item of the @input array to the $_ topical variable,
# applies the code block following the grep keyword to $_, and returns a list of the val‐
# ues for which the code block evaluates to true. Here, the code block is a simple regex
# applied to the $_ variable.
#
# Just as for map , we could have used a function reference as the first argument to grep :

say 'C:';
say @filtered = grep &contains-vowel, @input;

# To generate a list of even numbers between 1 and 10, we might use the range operator
# to generate numbers between 1 and 10 and use grep to filter out odd numbers:

say 'D:';
say my @evens = grep { $_ %% 2 }, 1..10; # -> [2 4 6 8 10]

# Most common list operations can be expressed as a combination of map, grep and
# reduce .

