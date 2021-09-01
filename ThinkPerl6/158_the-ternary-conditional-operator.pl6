#!/usr/bin/env perl6
#
# The Ternary Conditional Operator
#
# Consider the following code that tests the value of a positive integer:

say 'A:';
my $num = 100;
my $result;
if $num < 10 {
    $result = "One digit";
} else {
    $result = "More than one digit";
}
say $result;

# This is quite simple, but a bit long. This can be rewritten in just one line of code:

say 'B:';
say $num < 10 ?? "One digit" !! "More than one digit";

# The operator is in two parts: the ?? and the !! , which separate three expressions
# (hence the name “ternary operator”):
#
# • The condition to be evaluated (is $num less than 10?)
# • The expression defining the value if the condition is true
# • The expression defining the value if the condition is false
#
# This statement checks if $num is less than 10 and, if true, prints “"One digit”; if the
# condition is false, it prints “More than one digit.”
# This operator does not provide any new functionality; it just offers a more concise
# syntax.
#
# It is possible to nest several ternary operators to examine successively multiple
# choices:

say 'C:';
my $value = 1000;
say $value < 10     ?? "One digit" !!
$value     < 100    ?? "Two digits" !!
$value     < 1000   ?? "Three digits" !!
                       "More than three digits";

# This construct is a form of what is sometimes called a switch statement, because the C
# language and many languages derived from it use the switch keyword to describe
# such a multiple choice conditional.
#
# This is much more concise and often more convenient than nested if ... then ...
# else conditionals, but the next section provides a more powerful switch type of
# statement.

