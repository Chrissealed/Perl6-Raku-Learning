#!/usr/bin/env perl6
#
# Parameters and Arguments
#
# Some of the functions we have seen require arguments. For example, when you call
# sin you pass a number as an argument. Some functions take more than one argu‐
# ment: for example the round function seen at the beginning of this chapter took two,
# the number to be rounded and the scale (although the round function may accept a
# single argument, in which case the scale is defaulted to 1).
# Inside the subroutine, the arguments are assigned to variables called parameters. Here
# is a definition for a subroutine that takes a single argument:

sub print-twice($value) {
    say $value;
    say $value;
}

# This subroutine assigns the argument to a parameter named $value . Another com‐
# mon way to say it is that the subroutine binds the parameter defined in its header to
# the argument with which it was called. When the above subroutine is called, it prints
# the content of the parameter (whatever it is) twice.
# This function works with any argument value that can be printed:

print-twice("Let freedom ring");
# Let freedom ring
# Let freedom ring
print-twice(42);
# 42
# 42
print-twice(pi);
# 3.14159265358979
# 3.14159265358979

# The same rules of composition that apply to built-in functions also apply to
# programmer-defined subroutines, so we can use any kind of expression as an argu‐
# ment for print-twice :

print-twice('Let freedom ring! ' x 2);
# Let freedom ring! Let freedom ring!
# Let freedom ring! Let freedom ring!
print-twice(cos pi);
# -1
# -1

# The argument is evaluated before the function is called, so in the examples the
# expressions 'Let freedom ring! ' x 2 and cos pi are only evaluated once.
# You can also use a variable as an argument:

my $declaration = 'When in the Course of human events, ...';
print-twice($declaration);
# When in the Course of human events, ...
# When in the Course of human events, ...

# The name of the variable we pass as an argument ($declaration) has nothing to do
# with the name of the parameter ($value). It doesn’t matter what the variable was
# called back home (in the caller); here, within print-twice, we call the parameter
# $value, irrespective of the name or content of the argument passed to the subroutine.

# Variables and Parameters Are Local
#
# When you create a variable inside a subroutine with the my keyword, it is local, or,
# more accurately, lexically scoped, to the function block, which means that it only
# exists inside the function. For example:

sub concat_twice($part1, $part2) {
    my $concatenation = $part1 ~ $part2;
    print-twice($concatenation);
}

# This function takes two arguments, concatenates them, and prints the result twice.
# Here is an example that uses it:

my $start = 'Let freedom ring from ';
my $end = 'the mighty mountains of New York.';
concat_twice($start, $end);
# Let freedom ring from the mighty mountains of New York.
# Let freedom ring from the mighty mountains of New York.

# When concat_twice terminates, the variable $concatenation is destroyed. If we try
# to print it, we get an exception:
# > say $concatenation;
# ===SORRY!=== Error while compiling <unknown file>
# Variable '$concatenation' is not declared
# at <unknown file>:1
# ------> say <HERE>$concatenation;
# Parameters are also scoped to the subroutine. For example, outside print-twice,
# there is no such thing as $value .
#
# Stack Diagrams
#
# To keep track of which variables can be used where, it is sometimes useful to draw a
# stack diagram. Like state diagrams, stack diagrams show the value of each variable,
# but they also show the function each variable belongs to.
# Each function is represented graphically by a frame. A frame is a box with the name
# of a function beside it and the parameters and variables of the function inside it. The
# stack diagram for the previous example is shown in Figure 3-1.
# Figure 3-1. Stack diagram (015_stack-diagrams.png)
# The frames are arranged in a stack that indicates which function called which, and so
# on. In this example, print-twice was called by concat_twice, and concat_twice
# was called by main, which is a special name for the topmost frame. When you create a
# variable outside of any function, it belongs to main.
# Each parameter refers to the same value as its corresponding argument. So, $part1
# has the same value as $start, $part2 has the same value as $end, and $value has the
# same value as $concatenation.

