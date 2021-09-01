#!/usr/bin/env perl6
#
# New Looping Constructs
#
# Since the subject of this chapter is arrays and lists, it is probably the right time to
# briefly study two looping constructs that I left aside so far.
# The first one uses the same for keyword as above, but with a different syntax for the
# iteration variable(s):

say 'A:';
my @letters = 'a'..'e';
for @letters {
    say $^a-letter;
}

# The ^ in the $^a-letter variable is called a twigil, i.e., sort of a secondary sigil. When
# there is a twigil, the first symbol (here, the $ sign) has the same meaning as usual
# sigils (here, it denotes a scalar variable), and the second one (here, ^) extends the
# variable description and usually modifies its scope. In this specific case, the second
# character states that the $^a-letter variable is a placeholder parameter or a self-
# declared positional parameter. This is a positional parameter of the current block that
# needs not be declared in the signature.
# If the block uses more than one placeholder, they are associated to the input accord‐
# ing to their lexicographic (alphabetic) order:

say 'B:';
for @letters.kv {
    say "$^a -> $^b";
}
# which will print:
# 0 -> a
# 1 -> b
# 2 -> c
# 3 -> d
# 4 -> e

# As seen just above, the kv function returns an interleaved sequence of indexes and
# values. Since $^a comes before $^b in alphabetic order, $^a will be bound to the index
# and $^b with the value for each pair of the input.
#
# Placeholders can also be used for subroutines:

say 'C:';
sub divide { $^first / $^second }
# sub divide ($first, $second) { #`(Sub|230787048) ... }
say divide 6, 4;
# 1.5

# These placeholders aren’t used very often for simply traversing arrays, but we will see
# later how they are very useful in cases where is would be quite unpractical to have to
# declare the parameters.
#
# The second new looping construct I want to introduce here uses the loop keyword
# and is similar to the C-style for loop (i.e., the loop of the C programming language).
# In this type of loop, you declare between a pair of parentheses three expressions sepa‐
# rated by semicolons: the iteration variable’s initial value, the condition on which the
# loop should terminate, and the change made to the iteration variable on each
# iteration:

say 'D:';
loop (my $i = 0; $i < 5; $i++) {
    say $i, " -> " ~ @letters[$i];
}

# For most common loops, the for loops seen earlier are easier to write and usually
# more efficient than this construct. This special loop construct should probably be
# used only when the exit condition or the change made to the iteration variable is
# quite unusual and would be difficult to express in a regular for loop. As an exception,
# the loop construct with no three-part specification is quite common and even
# idiomatic for making an infinite loop:

say 'E:';
my $j = 0;
loop {
    # do something
    $j++;
    print $j;
    last if $j > 100;
}
print "\n";

