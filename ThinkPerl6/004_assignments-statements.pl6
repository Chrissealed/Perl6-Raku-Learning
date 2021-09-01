#!/usr/bin/env perl6
#
# Assignment Statements
#
# An assignment statement uses the equals sign (=) and gives a value to a variable, but,
# before you can assign a value to a variable, you first need to create the variable by
# declaring it (if it does not already exist):

my $message; # variable declaration, no value yet
say $message;
$message = 'And now for something completely different'; # And now for something completely different
say $message;
my $number = 42;  # variable declaration and assignment # 42
say $number;
$number = 17;  # new assignment # 17
say $number;
my $phi = 1.618033988; # 1.618033988
say $phi;

# This example makes four assignment statements. The first assigns a string to a new
# variable named $message, the second assigns the integer 42 to $number, the third
# reassigns the integer 17 to $number, and the fourth assigns the (approximate) value of
# the golden ratio to $phi .
# There are two important syntax features to understand here.
# First, in Perl, variable names start with a so-called sigil, i.e., a special non-
# alphanumeric character such as $, @, %, &, and some others. This special character tells
# us and the Perl compiler (the program that reads the code of our program and trans‐
# forms it into computer instructions) which kind of variable it is. For example, the $
# character indicates that the variables above are all scalar variables, which means that
# they can contain only one value at any given time. We’ll see later other types of vari‐
# ables that may contain more than one value.
# Second, notice that all three variables above are first introduced by the keyword my,
# which is a way of declaring a new variable. Whenever you create a new variable in
# Perl, you need to declare it, i.e., tell Perl that you’re going to use that new variable; this
# is most commonly done with the my keyword, which declares a lexical variable. We
# will explain later what a lexical variable is; let’s just say for the time being that it ena‐
# bles you to make your variable local to a limited part of your code. One of the good
# consequences of the requirement to declare variables before you use them is that, if
# you accidentally make a typo when writing a variable name, the compiler will usually
# be able to tell you that you are using a variable that has not been declared previously
# and thus help you find your error. This has other far-reaching implications, which we
# will examine later.
# When we wrote at the beginning of this section that a variable has to be declared
# before it is used (or just when it is used), it plainly means that the declaration has to
# be before (or at the point of) the variable’s first use in the text file containing the pro‐
# gram. We will see later that programs don’t necessarily run from top to bottom in the
# order in which the lines or code appear in the program file; still, the variable declara‐
# tion must be before its use in the text file containing the program.
#
# If you neglect to declare a variable, you get a syntax error:
# > $number = 5;
# ===SORRY!=== Error while compiling <unknown file>
# Variable '$number' is not declared
# at <unknown file>:1
# ------> <BOL><HERE>$number = 5;
#
# Please remember that you may obtain slightly different error messages depending on
# the version of Rakudo you run. The above message was obtained in February 2016;
# with a newer version (October 2016), the same error is now displayed somewhat
# more cleanly as:
#
# > $number = 5;
# ===SORRY!=== Error while compiling:
# Variable '$number' is not declared
# at line 2
# ------> <BOL><HERE>$number = 5;
#
# A common way to represent variables on paper is to write the name with an arrow
# pointing to its value. This kind of figure is called a state diagram because it shows
# what state each of the variables is in (think of it as the variable’s state of mind).
# Figure 2-1 shows the result of the previous example (cf. 004_state-diagram.png).

