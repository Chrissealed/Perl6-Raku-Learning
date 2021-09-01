#!/usr/bin/env perl6
#
# Binary Heaps
#
# A binary heap is a binary tree that keeps a partial order: each node has a value larger
# that its parent and less than either of its two children; there is no specific order
# imposed between siblings. (You could also do it the other way around: you could
# design heaps in which any node has a value less than its parent.)
# Because there is no order between siblings, it is not possible to find a particular ele‐
# ment without potentially searching the whole heap. Therefore, a heap is not very
# good if you need random access to specific nodes. But if you’re interested in always
# finding the smallest item, then a heap is a very efficient data structure.
# Heaps are used for solving a number of CS problems, and serve as the basis for an
# efficient and very popular sorting technique called heap sort.
#
# For a human, it is useful to represent a heap in a tree-like form. But a computer can
# store a heap as a simple array (not even a nested array). For this, the index of an ele‐
# ment is used to compute the index of its parent or its two children. The children of an
# element are the two locations where the indices are about double its index; con‐
# versely, the parent of a node is located at about half its index. If the heap starts at
# index 0, the exact formulas for a node with index $n are commonly as follows:
#
# • parent: int( ($n-1)/2 )
# • left child: 2*$n + 1
# • right child: 2*$n + 2
#
# The root node is at index 0. Its children are at positions 1 and 2. The children of 1 are
# 3 and 4 and the children of 2 are 5 and 6. The children of 3 are 7 and 8, and so on.
#
# Thus, if interpreted as a binary heap, the array:
#
# [0, 1, 2, 3, 4, 5, 6, 7, 8]
#
# is associated with the tree displayed in Figure 11-1.
# Figure 11-1. The heap corresponding to an array containing the digits 0 to 8
#
# Here is one way to build a heap (in partial alphabetic order) from a list of unordered
# letters:

say 'A:';
sub build-heap (@array, $index is copy) {
    my $index-val = @array[$index];
    while ($index) {
        my $parent = Int( ($index - 1) / 2);
        my $parent-val = @array[$parent];
        last if $parent-val lt $index-val;
        @array[$index] = $parent-val;
        $index = $parent;
    }
    @array[$index] = $index-val;
}

sub heapify (@array) {
    for @array.keys -> $i {
        build-heap @array, $i;
    }
}

my @input = <m t f l s j p o b h v k n q g r i a d u e c>;
heapify @input;
say @input;

# Note that the heap is built in place (there is no need for a second array). The resulting
# array is displayed as follows:
#
# [a b g d c k j l f h e m n q p t r o i u s v]
#
# Is this a correct heap? It’s difficult to say at first glance and checking it manually is
# somewhat tedious. When writing a program for building such a data structure, it is
# often useful to write some subroutines to display the content in a way that makes it
# easier to understand the result and check its correctness. The following code shows
# two examples of such possible subroutines:

say 'B:';
sub print-heap (@array) {
    my $start = 0;
    my $end = 0;
    my $last = @array.end;
    my $step = 1;
    loop {
        say @array[$start..$end];
        last if $end == $last;
        $start += $step;
        $step *= 2;
        $end += $step;
        $end = $last if $end > $last;
    }
}

print-heap(@input);

say 'C:';
sub print-heap2 (@array) {
    my $step = 0;
    for @array.keys -> $current {
        my $left_child = @array[2 * $current + 1];
        say "$current\tNode = @array[$current];\tNo child"
        and next unless defined $left_child;
        my $right_child = @array[2 * $current + 2] // "' '";
        say "$current\tNode = @array[$current];\tChildren: " ~
        " $left_child and $right_child";
        $step++;
    }
}

print-heap2(@input);

# The first one displays the related tree level by level:
#
# (a)
# (b g)
# (d c k j)
# (l f h e m n q p)
# (t r o i u s v)
#
# which makes it easy to draw the tree (see Figure 11-2).
# Figure 11-2. The heap corresponding to the array of letters
#
# The second one shows the children for each node and makes it possible to easily
# check that the partial alphabetic order constraint is satisfied (i.e., each node is smaller
# than its children):
#
# 0      Node = a;       Children: b and g
# 1      Node = b;       Children: d and c
# 2      Node = g;       Children: k and j
# 3      Node = d;       Children: l and f
# 4      Node = c;       Children: h and e
# 5      Node = k;       Children: m and n
# 6      Node = j;       Children: q and p
# 7      Node = l;       Children: t and r
# 8      Node = f;       Children: o and i
# 9      Node = h;       Children: u and f
# 10     Node = e;       Children: v and ' '
# 11     Node = m;       No child
# 12     Node = n;       No child
# (...)
# 21     Node = v;       No child

