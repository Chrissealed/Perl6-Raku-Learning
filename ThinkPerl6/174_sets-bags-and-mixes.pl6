#!/usr/bin/env perl6
#
# Sets, Bags, and Mixes
#
# Perl 6 has a variety of data structure types called Set, Bag, and Mix that provide many
# common set operations. They are unordered collections of unique and weighed
# items. They are immutable (but there also exist mutable versions of these data struc‐
# tures, SetHash, BagHash, and MixHash ).
#
# You may create and use a set as follows:

say 'A:';
my $s = set <banana apple orange orange banana pear apple>;
# set(banana, orange, apple, pear)
say $s.perl;
# set("banana","orange","apple","pear")
say $s.elems;
# 4
say $s{'apple'};
# True
say $s{'strawberry'};
# False

# As you can see, duplicates have been removed. Sets only tell us whether or not at least
# one item of a given name has been seen.
#
# A bag, by contrast, also keeps track of how many of each item have been seen:

say 'B:';
my $b = bag <banana apple orange orange banana pear apple orange>;
# bag(banana(2), orange(3), pear, apple(2))
say $b{'banana'};
# 2

# Mixes are similar to bags, except that the elements’ weights don’t have to be integers.
# The interesting thing about these collections is that they can use many set operators
# commonly used in mathematics, such as the ∈ set membership operator (or use
# (elem) instead if you don’t know how to type ∈ in your editor, the ∩ or (&) set
# intersection operator, or the ⊂ or (<) subset operator:

say 'C:';
say "Found it!" if 'apple' ∈ $s;
# Found it!
say "Is subset!" if <orange banana> ⊂ $s;
# Is subset!
say <orange banana pineapple> ∩ $s;
# set(banana, orange)

# Notice that we havent’ used the set keyword to define the <orange banana> list in the
# second example above. This list has been coerced to a Set to check whether it was a
# subset of the $s set. This is one of the great things about these collections: most of
# these set operators can be used with lists, arrays, and hashes.
#
# We can rewrite the hash subtraction program using a set for the word list and the ∈
# (or (elem)) set membership operator:
#
# my %histogram;
# my $skip = True; # flag to skip the header
# sub process-line(Str $line is copy) {
# # (same as above)
# }
#
# Here is a program that reads the emma.txt file and builds a histogram of the words in
# the file:

say 'D:';
my %histogram;
my $skip = True; # flag to skip the header
sub process-line(Str $line is copy) {
    if defined index $line, "*END*THE SMALL PRINT!" {
        $skip = False;
        return;
    }
    return if $skip;
    $line ~~ s:g/<[-']>/ /; # Replacing dashes and apostrophes with spaces
    $line ~~ s:g/<[;:,!?.()"“”’_`]>//; # removing punctuation symbols
    $line = $line.lc; # setting string to lowercase
    for $line.words -> $word {
        %histogram{$word}++;
    }
}

process-line $_ for "tmp/emma.txt".IO.lines;

say 'E:';
my $word-list = set "tmp/words.txt".IO.lines;
my %unknown-words = subtract(%histogram, $word-list);
say %unknown-words.keys.head(20);

sub subtract (%main, $dict) {
    my %difference;
    for %main.keys -> $word {
        %difference{$word} = 1 unless $word ∈ $dict;
    }
    return %difference;
}

# The code line in the for loop could also be written as follows:
#
# %difference{$word} = 1 unless $word (elem) $dict;
# #or:
# %difference{$word} = 1 if $word ∉ $dict;
# #or:
# %difference{$word} = 1 if $word !(elem) $dict;
#  #or even with the (cont) or ∋ contain operator:
# %difference{$word} = 1 unless $dict (cont) $word;
#  #or:
# %difference{$word} = 1 unless $dict ∋ $word;
#  #or:
# %difference{$word} = 1 if $dict ∌ $word; # etc.
#
# The ∖ (note that this is unicode character \x2216, not the same as the \ backslash) or
# (-) operator provides a set difference, so that we needed neither to write a subtract
# subroutine nor to construct our own minus operator:

say 'F:';
process-line $_ for "tmp/emma.txt".IO.lines;
$word-list = set "tmp/words.txt".IO.lines;
my $unknown-words = %histogram.keys (-) $word-list;
say $unknown-words.keys.head(20);

# There are more than 30 set operators available, covering most of the set operators
# used in mathematics. I’ve only shown some that are the most likely to be useful.
# Check into the official documentation if you need some others.

