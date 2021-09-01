#!/usr/bin/env perl6
#
# Expressions and Statements
#
# An expression is a combination of terms and operators. Terms may be variables or lit‐
# erals, i.e., constant values such as a number or a string. A value all by itself is consid‐
# ered an expression, and so is a variable, so the following are all legal expressions:
#
# say 42 # 42

say 'A:';
my $n = 17;
say $n; # 17
say $n + 25; # 42

# When you type an expression at the prompt, the interpreter evaluates it, which means
# that it finds the value of the expression. In this example, $n has the value 17 and $n +
# 25 has the value 42.
# A statement is a unit of code that has an effect, like creating a variable or displaying a
# value, and usually needs to end with a semicolon ; (but the semicolon can sometimes
# be omitted, as we will see later):
#
# > my $n = 17;
# 17
# > say $n;
# 17
#
# The first line is an assignment statement that gives a value to $n. The second line is a
# print statement that displays the value of $n.
# When you type a statement and then press Enter, the interpreter executes it, which
# means that it does whatever the statement says.
# An assignment can be combined with expressions using arithmetic operators. For
# example, you might write:

say 'B:';
my $answer = 17 + 25; # 42
say $answer; # 42

# The + symbol is obviously the addition operator and, after the assignment statement,
# the $answer variable contains the result of the addition. The terms on each side of the
# operator (here 17 and 25) are sometimes called the operands of the operation (an
# addition in this case).
# Note that the REPL actually displays the result of the assignment (the first line with
# “42”), so the print statement was not really necessary in this example under the REPL;
# from now on, for the sake of brevity, we will generally omit the print statements in
# the examples where the REPL displays the result.
# In some cases, you want to add something to a variable and assign the result to that
# same variable. This could be written:

say 'C:';
$answer = 17; # 17
$answer = $answer + 25; # 42
say $answer;

# Here, $answer is first declared with a value of 17. The next statement assigns to
# $answer the current value of $answer (i.e., 17) + 25. This is such a common operation
# that Perl, like many other programming languages, has a shortcut for this:

$answer += 25;
say $answer; # 42

# The += operator combines the arithmetic addition operator and the assignment oper‐
# ator to modify a value and apply the result to a variable in one go, so that $n += 2
# means take the current value of $n, add 2, and assign the result to $n . This syntax
# works with all other arithmetic operators. For example, -= similarly performs a sub‐
# traction and an assignment, *= a multiplication and an assignment, etc. It can even be
# used with operators other than arithmetic operators, such as the string concatenation
# operator that we will see later.
# Adding 1 to a variable is a very common version of this, so that there is a shortcut to
# the shortcut, the increment operator, which increments its argument by one, and
# returns the incremented value:

say 'D:';
$n = 17; # 17
say ++$n; # 18
say $n; # 18

# This is called the prefix increment operator, because the ++ operator is placed before
# the variable to be incremented. There is also a postfix version, $n++, which first
# returns the current value and then increments the variable by one. It would not make
# a difference in the code snippet above, but the result can be very different in slightly
# more complex expressions.
# There is also a decrement operator --, which decrements its argument by one and
# also exists in a prefix and a postfix form.

