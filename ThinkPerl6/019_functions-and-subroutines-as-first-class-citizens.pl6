#!/usr/bin/env perl6
#
# Functions and Subroutines as First-Class Citizens
#
# Subroutines and other code objects can be passed around as values, just like any vari‐
# able, literal, or object. Functions are said to be first-class objects or sometimes first-
# class citizens or higher-order functions. This means that a Perl function (its code, not
# the value returned by it) is a value you can assign to a variable or pass around as an
# argument. For example, do-twice is a subroutine that takes a function as an argu‐
# ment and calls it twice:

say 'A:';
sub do-twice($code) {
    $code();
    $code();
}

# Here, the $code parameter refers to a function or some other callable code object.
# This is an example that uses do-twice to call a function named greet twice:

sub greet {
    say "Hello World!";
}
do-twice &greet;

# This will print:
# Hello World!
# Hello World!
# The & sigil placed before the subroutine name in the argument list tells Perl that you
# are passing around a subroutine or some other callable code object (and not calling
# the subroutine at the moment).
# In fact, it would be more idiomatic to also use the & sigil in the do-twice subroutine
# definition, to better specify that the parameter is a callable code object:

say 'B:';
sub do-twice-b(&code) {
    &code();
    &code();
}
do-twice-b &greet;

# or even:

say 'C:';
sub do-twice-c(&code) {
    code();
    code();
}
do-twice-c &greet;

# The syntax with the & sigil has the benefit that it will provide a better error message if
# you make a mistake and pass something noncallable to do-twice .
# All the functions we have seen so far had a name, but a function does not need to
# have a name and can be anonymous. For example, it may be stored directly in a scalar
# variable:

say 'D:';
my $anonymous-greet = sub {
    say "Hello World!";
};
$anonymous-greet(); # prints "Hello World"
do-twice $anonymous-greet; # prints "Hello World" twice

# It could be argued that the above $greet subroutine is not really anonymous, since it
# is stored in a scalar variable that could in a certain way be considered its name. But
# the subroutine really has no name; it just happens to be assigned to a scalar variable.
# Just to show that the subroutine can really have no name at all, consider this:

say 'E:';
do-twice(sub {say "Hello World!"} );

# It will happily print “Hello World” twice. If the $do-twice function was declared ear‐
# lier, you can even simplify the syntax and omit the parentheses:

do-twice sub {say "Hello World!"};

# For such a simple case where there is no need to pass an argument or return a value;
# you can even omit the sub keyword and pass a code block directly to the function:

say 'F:';
do-twice {say "Hello World!"};
do-twice {say "what's up doc"};

# As you can see, do-twice is a generic subroutine in charge of just performing twice
# any function or code block passed to it, without any knowledge about what this func‐
# tion or code block is doing. This is a powerful concept for some relatively advanced
# programming techniques that we will cover later in this book.
# Subroutines may also be passed as return values from other subroutines:

say 'G:';
sub create-func ($person) { return sub { say "Hello $person!"}} # Creating two greeting functions
# sub create-func ($person) { #`(Sub|176738440) ... }
my $greet_world = create-func "World"; # sub () { #`(Sub|176738592) ... }
my $greet_friend = create-func "dear friend"; # sub () { #`(Sub|176739048) ... }

# Using the greet functions

$greet_world(); # Hello World!
$greet_friend(); # Hello dear friend!

# Here, create-func returns a subroutine greeting someone. It is called twice with two
# different arguments in order to create two different functions at runtime,
# $greet_world and $greet_friend. A function such as create-func is sometimes a
# function factory because you may create as many functions as you like by just calling
# create-func. This example may seem to be a slightly complicated way of doing
# something quite simple. At this point, it is just a bit too early to give really useful
# examples, but this is also a very powerful programming technique.
# We’ll come back to these techniques in various places in this book and even devote an
# entire chapter (Chapter 14) to this subject and related topics.

