#!/usr/bin/env perl6
#
# Testing for Existence
#
# A quite common task is to determine whether something exists or if a given value has
# already been seen in a program. Using a hash is usually the best solution because
# finding out whether there is an entry for a given key is very simple and also very effi‐
# cient: you just need to store the values that you want to watch as a key entry in a hash,
# and then check for its existence when needed.
# In such a case, you often don’t really care about the value and you might put basically
# anything. It is quite common in that case to use “1” as a value, but you might as well
# store True or any other value you like.
#
# Suppose we want to generate 10 random integers between 0 and 49, but want to make
# sure that the integers are unique. We can use the rand method 10 times on the desired
# range. But the likelihood to twice hit the same number is far from negligible (see
# Exercise 9-8 on the so-called Birthday Paradox and its solution (“Exercise 9-8: Simu‐
# lating the Birthday Paradox” on page 392) for a similar situation). For example, trying
# this:

say 'A:';
my @list;
say @list;
# []
push @list, 50.rand.Int for 1..10;
say @list;
# [12 25 47 10 19 20 25 42 33 20]

# produced a duplicate value in the list (25) on the first try. And the second try pro‐
# duced three pairs of duplicates:

push @list, 50.rand.Int for 1..10;
say @list;
# [45 29 29 27 12 27 20 5 28 45]

# We can use a hash to reject any generated random integer that has already been seen.
# The following is a possible way to code this:

say 'B:';
my %seen;
while @list.elems < 10 {
    my $random = 50.rand.Int;
    next if %seen{$random}:exists;
    %seen{$random} = 1;
    push @list, $random;
}
say @list;

# Every valid integer generated is added to both the %seen hash and the output list. But
# before doing that, the generated integer is checked against the %seen hash to verify
# that it has not been seen yet. When this program is finished running, the list has 10
# unique (pseudo)random integers.
#
# We have made it step by step and kept two separate data structures, the @list output
# array and the %seen hash, to make the process as clear as possible. If you think about
# it, however, @list and %seen have essentially the same content at any step through
# the loop. We don’t really need to keep track of the same data in two places. Since hav‐
# ing a hash is important for checking that the output values are unique, we can get rid
# of @list and write a more concise and probably more idiomatic version of the same
# program:

say 'C:';
while %seen.elems < 10 {
    my $random = 50.rand.Int;
    push %seen, ($random => 1) unless %seen{$random}:exists;
}
say keys %seen; # -> (39 12 46 27 14 21 4 38 25 47)

# This can be further simplified. It is not really necessary here to check whether the
# generated integer exists in the hash: if it does exist, the old hash element will be
# replaced by the new one, and the hash will be essentially unchanged. In addition,
# when evaluated in a scalar numeric context, a hash returns the number of elements,
# so the call to .elems is not necessary. This is the new version:

say 'D:';
%seen{50.rand.Int} = 1 while %seen < 10;
say keys %seen; # -> (46 19 5 36 33 1 20 45 47 30)

# This last version is probably more concise and more idiomatic, but that’s not meant
# to say that it is better. It is perfectly fine if you prefer the second or the first version,
# maybe because you find it clearer. Use whichever version you like better, or your own
# modified version provided it does the expected work. This is Perl, there is more than
# one way to do it (TIMTOWTDI).
#
# Note however that the pure hash version doesn’t keep the order in which the numbers
# were generated, so (pseudo)randomness might not be as good.
# Also note, by the way, that Perl has a pick function or method to choose elements at
# random from a list without repetition.

