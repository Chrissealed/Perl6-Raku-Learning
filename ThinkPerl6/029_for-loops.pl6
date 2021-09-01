#!/usr/bin/env perl6
#
# for Loops
#
# Suppose you need to compute and print the product of the first five positive digits (1
# to 5). This product is known in mathematics as the factorial of 5 and is sometimes
# written as 5!. You could write this program:

say 'A:';
my $product = 1 * 2 * 3 * 4 * 5;
say $product; # prints 120

# You could make it slightly simpler:

say 2 * 3 * 4 * 5; # prints 120

# The problem is that this syntactic construct does not scale well and becomes tedious
# for the product of the first 10 integers (or factorial 10). And it becomes almost a
# nightmare for factorial 100. Calculating the factorial of a number is a fairly common
# computation in mathematics (especially in the fields of combinatorics and probabil‐
# ity) and in computer science. We need to automatize it, and using a for loop is one of
# the most obvious ways of doing that:

say 'B:';
$product = 1;
for 1..5 {
    $product *= $_
}
say $product; # prints 120

# Now, if you need to compute factorial 100, you just need to replace the 5 in the code
# above with 100. Beware, though, the factorial function is known to grow extremely
# rapidly, and you’ll get a truly huge number, with 158 digits (i.e., a number much
# larger than the estimated total number of atoms in the known universe).
#
# In this script, 1..5 is the range operator, which is used here to generate a list of con‐
# secutive numbers between 1 and 5. The for keyword is used to iterate over that list,
# and $_ is a special variable that takes each successive value of this list: first 1, then 2,
# etc. until 5. In the code block forming the body of the loop, the $product variable is
# multiplied successively by each value of $_. The loop ends with 5 and the result, 120,
# is printed on the last line.
#
# This is a simple use of the for statement, but probably not the most commonly used
# in Perl 6; we will see more below. We will also see other types of loops. But that
# should be enough for now to let you write some loops. Loops are found everywhere
# in computer programming.
#
# The $_ special variable is known as the topical variable or simply the topic. It does not
# need to be declared and many syntactic constructs assign a value to it without explic‐
# itly mentioning it. Also, $_ is an implicit argument to methods called without an
# explicit invocant. For example, to print the first five integers, you might write:

say 'C:';
for 1..5 {.say}; # prints numbers 1 to 5, each on its line

# Here .say is a syntax shorthand equivalent to $_.say . And since, as we saw, $_ takes
# each successive value of the range introduced by the for keyword, this very short
# code line prints each number between 1 and 5, each on a different line. This is a typi‐
# cal example of the $_ topical variable being used without even being explicitly men‐
# tioned. We will see many other uses of the $_ special variable.
# Sometimes, you don’t use the $_ loop variable within the loop, for example if you just
# want to do something five times but don’t care each time through the loop at which
# iteration you have arrived. A subroutine that prints a message n times might look like
# this:

say 'D:';
sub print-n-times (Int $n, Str $message) {
    for 1..$n { say $message }
}
print-n-times 4, "Hello";

# The for loop also has a statement modifier or postfix form, used here to compute
# again the factorial of 5:

say 'E:';
$product *= $_ for 1..5;
say $product; # prints 120

# There is another syntax for the for loop, using an explicit loop variable:

say 'F:';
sub factorial (Int $num) {
    my $product = 1;
    for 1..$num -> $x {
        $product *= $x
    }
    return $product
}
say factorial 10; # 3628800

# The for loop in this subroutine is using what is called a “pointy block” syntax. It is
# essentially the same idea as the previous for loops, except that, instead of using the $_
# topical variable, we now declare an explicit $x loop variable with the 1..$num -> $x
# syntax to iterate over the range of values. Using an explicit loop variable can make
# your code clearer when things get more complicated, for example when you need to
# nest several for loops. We will see more examples of that later.
# We will also see several other ways of computing the factorial of a number in this
# book.

