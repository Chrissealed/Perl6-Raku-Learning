#!/usr/bin/env perl6
#
# The Reduction Metaoperator
#
# Perl 6 also has a reduction operator, or rather a reduction metaoperator. An operator
# usually works on variables or values; a metaoperator acts on other operators. Given a
# list and an operator, the [...] metaoperator iteratively applies the operator to all the
# values of the list to produce a single value.
# For example, the following also prints the sum of all the elements of a list:

say 'A:';
say [+] 1, 2, 3, 4; # -> 10

# This basically takes the first two values, adds them up, and adds the result to the next
# value, and so on. Actually, there is a form of this operator, with a backslash before the
# operator, which also returns the intermediate results:

say 'B:';
say [\+] 1, 2, 3, 4; # -> (1 3 6 10)

# This metaoperator can be used to transform basically any associative infix operator (1)
# into a list operator returning a single value.
#
# 1) An infix operator is an operator that is placed between its two operands.
#
# The factorial function can now be rewritten as:

say 'C:';
sub fact(Int $x){
    [*] 1..$x;
}
my $factorial = fact(10); # -> 3628800
say $factorial;

# The reduction metaoperator can also be used with relational operators to check
# whether the elements of an array or a list are in the correct numerical or alphabetical
# order:

say 'D:';
say [<] 3, 5, 7; # -> True
say [<] 3, 5, 7, 6; # -> False
say [lt] <a c d f r t y>; # -> True

