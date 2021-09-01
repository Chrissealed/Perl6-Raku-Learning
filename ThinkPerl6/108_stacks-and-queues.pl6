#!/usr/bin/env perl6
#
# Stacks and Queues
#
# Stacks and queues are very commonly used data structures in computer science.
# A stack is a last in/first out (LIFO) data structure. Think of piled-up plates. When
# you put a clean plate on the stack, you usually put it on top; when you take one out,
# you also take it from the top. So the first plate that you take is the last one that you
# added. A CS stack implements the same idea: you use it when the first piece of data
# you need from a data structure is the last one you added.
#
# A queue, by contrast, is a first in/first out (FIFO) data structure. This is the idea of
# people standing in a line waiting to pay at the supermarket. The first person that will
# be served is the first person who entered the queue.
#
# A stack may be implemented with an array and the push and pop functions, which
# respectively add an item (or several) at the end of an array and take one from the end
# of the array. This is a somewhat simplistic implementation of a stack:

sub put-in-stack (@stack, $new_item) {
    push @stack, $new_item;
}
sub take-from-stack (@stack) {
    my $item = pop @stack;
    return $item;
}
my @a-stack = 1, 2, 3, 4, 5;
put-in-stack @a-stack, 6;
say @a-stack;
say take-from-stack @a-stack for 1..3;

# This example will print this:
# [1 2 3 4 5 6]
# 6
# 5
# 4

# This stack is simplistic because, at the very least, a more robust implementation
# should do something sensible when you try to take-from-stack from an empty
# stack. It would also be wise to add signatures to the subroutines. In addition, you
# might want to put-in-stack more than one element in one go. Take a look at the
# solution to the exercise on queues below (“Exercise: Implementing a Queue” on page
# 379) to figure out on how this stack may be improved.
#
# You could obtain the same stack features using the unshift and shift functions
# instead of push and pop. The items will be added at the beginning of the array and
# taken from the beginning, but you will still have the LIFO behavior.

