#!/usr/bin/env perl6
#
# Fruitful Functions and Void Functions
#
# Some of the functions we have used, such as the math functions, return results and
# are useful only insofar we use that return value; for lack of a better name, we may call
# them fruitful functions. Other functions, like print-twice, perform an action but
# don’t appear to return a value (it does in fact return a value, True, but we don’t care
# about it). They are sometimes called empty or void functions in some other program‐
# ming languages.
# In some programming languages, such as Pascal or Ada, there is a strong distinction
# between a function (which returns a value) and a procedure (which doesn’t); they are
# even defined with different keywords. This distinction does not apply to Perl and to
# most modern programming languages.
# In fact, from a pure syntactic standpoint, Perl functions always return a result. So the
# distinction between “fruitful” and “void” functions does not really exist syntactically,
# but only semantically, i.e., from the standpoint of the meaning of the program: maybe
# we need to use the return value, or maybe we don’t.
# Another distinction commonly made is between functions and mutators: functions
# do not change the initial state of the arguments they were called on, and mutators do
# modify it. We will not use this distinction here, but it is useful to keep it in mind.
# When you call a fruitful function, you almost always want to do something with the
# result; for example, you might assign it to a variable or use it as part of an expression:

my $height = 0;
my $golden = 0;
my $radians = 10;
$height = sin $radians;
$golden = (sqrt(5) + 1) / 2;
say $height;
say $golden;

# When you call a function in interactive mode (under the REPL), Perl usually displays
# the result:

say sqrt 5; # 2.23606797749979

# But in a script, if you call a fruitful function all by itself, the return value is lost for‐
# ever! In some cases, the compiler will be able to warn you, but not always. For exam‐
# ple, consider the following program:
#
# my $five = 5;
# sqrt $five;
# say $five;
#
# It produces the following warning:
# WARNINGS for /home/Laurent/perl6_tests/sqrt.pl6:
# Useless use of "sqrt $five" in expression "sqrt $five" in sink context (line 2)
# 5
# This script computes the square root of 5, but since it doesn’t store or display the
# result, it is not very useful.
# Void functions might display something on the screen, save some data to a file, mod‐
# ify a variable or an object, or have some other effect, but they generally don’t have a
# return value, or at least not a useful one. If you assign the result to a variable, you may
# get the return value of the subroutine, the value of the last expression which was
# evaluated in the function, or a special value such as Any, which essentially means
# something that has not been defined, or Nil.
# The subroutines we have written so far were essentially printing things to the screen.
# In that case, they usually return True, at least when the printing was successful.
# Although they return a true value, what they return isn’t very useful and we can con‐
# sider them all void for our practical purposes.
# The following is an example of a very simple fruitful subroutine:

sub square($number) { return $number ** 2 } # sub square ($number) { #`(Sub|118134416) ... }
say square 5; # 25

# The Sub|118134416 message displayed by the REPL is just an internal identifier for
# the subroutine we’ve just defined.
# The return statement instructs the function to terminate the execution of the func‐
# tion at this statement and to return the value of the following expression to the caller.
# In such a simple case where the program is in fact running the last statement of a
# function, the return keyword can be omitted since the function will return the value
# of the last evaluated statement, so that the square subroutine could be written this
# way:
#
# sub square($number) {
#     $number ** 2
# }

# We will be using fruitful functions more intensively in a few chapters.

