#!/usr/bin/env perl6
#
# CHAPTER 5
# Fruitful Subroutines
#
# Most of the Perl functions we have used, such as the math functions, produce return
# values. But most of the subroutines we’ve written so far are void: they have an effect,
# like printing a value, but they don’t have a return value. In this chapter you will learn
# to write fruitful functions.
#
# Return Values
#
# Calling a fruitful function generates a return value, which we usually assign to a vari‐
# able or use as part of an expression:

say 'A.';
my $radius = 4;
my $radians = 4;
my $pi = 4 * atan 1;
my $height = $radius * sin $radians;
say $pi;
say $height;

# Many of the subroutines we have written so far are void. Speaking casually, they have
# no usable return value; more precisely, their return value may be Any, (), or True.
# In this chapter, we are (finally) going to write fruitful subroutines. The first example
# is area, which returns the area of a circle with the given radius:

sub area($radius) {
    my $circular_area = pi * $radius**2;
    return $circular_area;
}

say 'B.';
my $area = area(15);
say $area;

# We have seen the return statement before, but in a fruitful function the return state‐
# ment includes an expression. This statement means: “Return immediately from this
# function and use the following expression as a return value.” The expression can be
# arbitrarily complicated, so we could have written this function more concisely:

sub area2($radius) {
    return pi * $radius**2;
}

$area = area2(30);
say $area;

# On the other hand, temporary variables like $circular_area can make debugging
# easier. They may also help document what is going on.
# Sometimes it is useful to have multiple return statements, for example one in each
# branch of a conditional:

say 'C.';
sub absolute_value($num){
    if $num < 0 {
        return -$num;
    } else {
        return $num;
    }
}

my $value = absolute_value -42;
say $value;

# Since these return statements are in an alternative conditional, only one runs.
# This could also be written more concisely using the statement modifier syntax:

sub absolute_value2($num){
    return -$num if $num < 0;
    return $num;
}

$value = absolute_value2 -1;
say $value;

# Here again, only one of the return statements runs: if the number is negative, the
# first return statement is executed and the subroutine execution stops there; if the
# number is positive or zero, then only the second return statement is executed.
# As soon as a return statement runs, the function terminates without executing any
# subsequent statements. Code that appears after an unconditional return statement,
# or any other place the flow of execution can never reach, is called dead code.
# In a fruitful function, it is a good idea to ensure that every possible path through the
# program hits a return statement. For example:

sub absolute_value3($num){
    if $num < 0 {
        return -$num;
    }
    if $num > 0 {
        return $num;
    }
}

$value = absolute_value3 0;
say $value;

# This subroutine is incorrect because if $num happens to be 0, neither condition is true,
# and the subroutine ends without hitting a return statement. If the flow of execution
# gets to the end of a function, the return value is (), which basically means “not
# defined” and is clearly not the absolute value of 0:
# > absolute_value(0)
# ()
# By the way, Perl provides a built-in function called abs that computes absolute values.

