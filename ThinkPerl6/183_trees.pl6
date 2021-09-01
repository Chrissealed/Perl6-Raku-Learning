#!/usr/bin/env perl6
#
# Trees
#
# A tree is usually a collection of items in which each item (or node) holds a value (or
# possibly several values) and two or several links to other items of the collection, the
# children. Think of a family tree or a tree of directories on a hard disk drive to get the
# general idea. The ultimate nodes that don’t have their own children are often called
# the leaves. There is usually only one ultimate grandparent node, sometimes called the
# root (if there is more than one ultimate grandparent, then it is not really a tree but
# several trees or a “forest”).
#
# Dozens of different types of trees have been invented and their descriptions have fil‐
# led entire books about computer science algorithms. Some are designed to keep the
# data sorted, others to maintain balance between the tree branches, and so on. The
# data structure is often not very complicated, but the algorithms needed to maintain
# the required properties sometimes can be a bit hairy.
#
# For example, a typical tree might hold one value and two links, one to the left child
# and one to the right child. You might implement such a binary tree in a similar way as
# the linked list described above, except that the value would no longer be a link to the
# next element, but an array of two elements, the links to the two children. Or you
# could follow more closely the linked list model above and have nested pairs. For
# example, a binary tree might look like this:

my $tree = 1 => (( 2 => 3 ) => (4 => (5 => ((6 => 7) => 8))));
say $tree;

# The implementation is left as an exercise to the reader.
# Quite often, though, a tree may be implemented in Perl as a simpler data structure
# such as a nested array or hash. The next section examines such an example.

