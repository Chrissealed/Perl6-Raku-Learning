#!/usr/bin/env perl6
#
# Conditional Execution
#
# In order to write useful programs, we almost always need the ability to check condi‐
# tions and change the behavior of the program accordingly. Conditional statements
# give us this ability. The simplest form is the if statement:

say 'A:';
my $number = 1;
if $number > 0 {
    say '$number is positive';
}

# The Boolean expression after if is called the condition. If it is true, the subsequent
# block of code runs. If not, nothing happens. The block of code may contain any num‐
# ber of statements.
# It is conventional and highly recommended (although not strictly mandatory from
# the standpoint of the compiler) to indent the statements in the block, in order to help
# visualize the control flow of the program, i.e., its structure of execution: with such
# indentation, we can see much better that the statements within the conditional block
# will run only if the condition is true.
#
# The condition may be a compound Boolean expression:

say 'B:';
my $n = 10;
if $n > 0 and $n < 20 and $n %% 2 {
    say '$n is an even and positive number smaller than 20'
}

# Note that in the print statement above, the final semicolon has been omitted. When a
# statement is the last code line of a block, immediately before the curly brace } closing
# that code block, the final semicolon is optional and may be omitted, though it might
# be considered good form to include it.
# In theory, the overall code snippet above is itself a statement and should also end with
# a semicolon after the closing brace. But a closing curly brace followed by a newline
# character implies a statement separator, so you don’t need a semicolon here and it is
# generally omitted.
#
# Alternative Execution
#
# A second form of the if statement is “alternative execution,” in which there are two
# possibilities and the condition determines which one runs. Given a $number variable
# containing an integer, the following code displays two different messages depending
# on whether the value of the integer is even or odd:

say 'C:';
$number = 8;
if $number % 2 == 0 {
    say 'Variable $number is even'
} else {
    say 'Variable $number is odd'
}

# If the remainder when $number is divided by 2 is 0, then we know that $number is
# even, and the program displays an appropriate message. If the condition is false, the
# second set of statements runs. Since the condition must be true or false, exactly one of
# the alternatives will run. The alternatives are called branches, because they are
# branches in the flow of execution.
# Note that if $number is evenly divisible by two, this code will print:
#
# Variable $number is even
#
# The $number variable value is not interpolated, because we used single quotes for the
# purpose of printing out the variable name rather than its value. We would have to use
# double quotes if we wanted to display the variable’s value instead of its name.
#
# Chained Conditionals
#
# Sometimes there are more than two possibilities and we need more than two
# branches. One way to express a computation like that is a chained conditional:

say 'D:';
my ($x, $y) = 0, 0;
if $x < $y {
    say 'Variable $x is less than variable $y'
} elsif $x > $y {
    say 'Variable $x is greater than variable $y'
} else {
    say 'Variables $x and $y are equal'
}

# The elsif keyword is an abbreviation of “else if ” that has the advantage of avoiding
# nesting of blocks. Again, exactly one branch will run. There is no limit on the number
# of elsif statements.
# If there is an else clause, it has to be at the end, but there doesn’t have to be one:
#
# if $choice eq 'a' {
# draw_a()
# } elsif $choice eq 'b' {
# draw_b()
#
# } elsif $choice eq 'c' {
# draw_c()
# }
#
# Each condition is checked in order. If the first is false, the next is checked, and so on.
# If one of them is true, the corresponding branch runs and the statement ends. Even if
# more than one condition is true, only the first true branch runs.
#
# Nested Conditionals
#
# One conditional can also be nested within another. We could have written the exam‐
# ple in the previous section like this:

say 'E:';
$y = 5;
if $x == $y {
    say 'Variables $x and $y are equal'
} else {
    if $x < $y {
        say 'Variable $x is less than variable $y'
    } else {
        say 'Variable $x is greater than variable $y'
    }
}

# The outer conditional contains two branches. The first branch contains a simple
# statement. The second branch contains another if statement, which has two
# branches of its own. Those two branches are both simple statements, although they
# could have been conditional statements as well. The if $x < $y conditional is said to
# be nested within the else branch of the outer conditional.
# Such nested conditionals show how critical it is for your own comprehension to
# properly indent conditional statements, as it would be very difficult here to visually
# grasp the structure without the help of correct indentation.
# Although the indentation of the statements helps make the structure apparent, nested
# conditionals become difficult to read very quickly. It is a good idea to avoid them
# when you can. Logical operators often provide a way to simplify nested conditional
# statements. For example, consider the following code (which assumes $x to be an
# integer):

say 'F:';
my Int $z;
# ... $z = ...;
$z = 9;
if 0 < $z {
    if $z < 10 {
        say 'Value of $z is a positive single-digit number.'
    }
}

# The say statement runs only if we make it past both conditionals, so we can get the
# same effect with the and Boolean operator, and the code can be rewritten using a sin‐
# gle conditional:

if 0 < $z and $z < 10 {
    say '$z is a positive single-digit number.'
}

# For this kind of condition, Perl 6 provides a more concise option using the chained
# relational operators described earlier:

if 0 < $x < 10 {
    say '$x is a positive single-digit number.'
}

# if Conditionals as Statement Modifiers
#
# There is also a form of if called a statement modifier (or sometimes “postfix condi‐
# tional”) form when there is only one conditional statement. In this case, the if and
# the condition come after the code you want to run conditionally. Note that the condi‐
# tion is still always evaluated first:

say 'G:';
$number = -1;
say '$number is negative.' if $number < 0;
# This is equivalent to:
if $number < 0 {
    say '$number is negative.'
}

# This syntactic form is more concise as it takes only one code line instead of three. The
# advantage is that you can see more of your program code on one screen, without hav‐
# ing to scroll up and down. However, this syntax is neat and clean only when both the
# condition and the statement are short and simple, so it is probably best used only in
# these cases.
# The statement modifier form does not allow else and elsif statements.
#
# Unless Conditional Statement
#
# If you don’t like having to write negative conditions in a conditional if statement
# such as:

say 'H:';
if not $number >= 0 {
    say '$number is negative.'
}

# you may write this instead:

unless $number >= 0 {
    say '$number is negative.'
}

# This unless keyword does exactly what the English says: it will display the sentence
# “$number is negative.” unless the number is greater than or equal to 0.
# You cannot use else or elsif statements with unless, because that would end up
# getting confusing.
# The unless conditional is most commonly used in its statement modifier (or postfix
# notation) form:

say '$number is negative.' unless $number >= 0;

