#!/usr/bin/env perl6
#
# Linked Lists
#
# A linked list is a collection of items in which each item holds a value (or several val‐
# ues) and a link to the next item of the collection. In many programming languages,
# arrays have a fixed size (contrary to Perl in which arrays can usually grow according
# to your needs). In those programming languages, a linked list is often used to repre‐
# sent a variable-size collection of items.
#
# We saw in “Stacks and Queues” on page 159 how to use arrays to build stacks and
# queues. It was fairly easy. In some lower-level programming languages, you would
# need linked lists for that.
#
# In Perl, a linked list item may be represented by a pair (an object of type Pair). The
# following code is a very simple example showing how we could implement a stack
# using a linked list in Perl:

sub add-to-stack (Pair $stack-top, $item) {
    my $new-pair = $item => $stack-top;
    return $new-pair;
}

sub take-from-stack (Pair $stack-top) {
    my $new-top = $stack-top.value;
    return $stack-top.key, $new-top;
}

sub create-stack ($item) {
    return $item => Nil;
}

my $stack = create-stack (0);
    for 1..5 -> $item {
    $stack = add-to-stack($stack, $item);
}

say "The stack is: ", $stack.perl;
for 1..5 {
    my $value;
    ($value, $stack) = take-from-stack($stack);
    say "$value -- ", $stack;
}

# Once populated, the resulting stack looks like this:
# 5 => 4 => 3 => 2 => 1 => 0 => Nil
#
# This is just given as an example for the construction of a linked list. There is usually
# no need to use anything like this in Perl, since it is much easier to implement a stack
# using an array, as seen in “Stacks and Queues” on page 159, although the same princi‐
# ple can be used for building more advanced data structures.
#
# You might still want, as an exercise, to implement a queue (see “Stacks and Queues”
# on page 159) using a linked list.

