#!/usr/bin/env perl6
#
# Reverse Lookup
#
# Given a hash %hash and a key $k, it is easy to find the corresponding value $val =
# %hash{$k}. This operation is called a lookup and, as already mentioned, this is fast
# even when the hash is very large.
# But what if you have $val and you want to find $k ? You have three problems: first,
# there might be more than one key that maps to the value $val; depending on the
# application, you might be able to pick one, or you might have to make an array that
# contains all of them. Second, there is no simple syntax to do a reverse lookup; you
# have to search. Third, it might be time-consuming if the hash is large.
#
# Here is a function that takes a value and returns the first key that maps to that value:

say 'A:';
sub reverse-lookup (%hash, $val) {
    for %hash -> $pair {
        return $pair.key if $pair.value eq $val;
    }
    return;
}

# This subroutine is yet another example of the search pattern. If we get to the end of
# the loop, that means $val doesn’t appear in the hash as a value, so we return an unde‐
# fined value (Nil). Here, the responsibility to react to that situation is left to the caller.
# An alternative might be to raise an exception, which would still have to be dealt with
# by the caller. However, since direct lookup with the key is not raising an exception
# but simply returning an undefined value when the key does not exist, it makes sense
# for reverse-lookup to have the same behavior when the value is not found.
#
# Here is an example of a successful reverse lookup:

sub histogram (Str $string) {
    my %histo;
    for $string.comb -> $letter {
        %histo{$letter}++;
    }
    return %histo;
}

say my %histo = histogram('parrot');
# a => 1, o => 1, p => 1, r => 2, t => 1

say 'B:';
my $key = reverse-lookup %histo, "2";
# r
# And an unsuccessful one:
say reverse-lookup %histo, "3";
# Nil

# Another more concise way to do reverse lookup would be to use grep to retrieve a list
# of values satisfying our condition:

say 'C:';
say grep { .value == 2 }, %histo.pairs; # (r => 2)

# Another option is to use an expression with the first built-in function to retrieve
# only the first one:

say 'D:';
%histo = histogram('parrot');
say %histo.pairs.first: *.value == 1; # -> p => 1

# This latter example uses the “*” whatever parameter, which we haven’t covered yet in
# this book. Let’s just say that, here, the “*” stands successively for every pair of the
# hash, and the first function returns the first pair that matches the condition on the
# value (see “Currying with the Whatever Star Parameter” on page 324 for details on
# the “*” parameter).
# A reverse lookup is much slower than a forward lookup; if you have to do it often, or
# if the hash gets big, the performance of your program will suffer.

