#!/usr/bin/env perl6
#
# Function Calls
#
# We have already seen examples of function calls

say 'A:';
say 42; # 42

# The name of the function is say . The expression following the function name is
# called the argument of the function. The say function causes the argument to be dis‐
# played on the screen. If you need to pass several values to a function, then just sepa‐
# rate the arguments with commas:

say "The answer to the ultimate question is ", 42; # The answer to the ultimate question is 42

# Many programming languages require the arguments of a function to be inserted
# between parentheses. This is not required (and usually not recommended) in Perl 6
# for most built-in functions (except when needed for precedence), but if you do use
# parentheses, you should make sure to avoid inserting spaces between the function
# name and the opening parenthesis. For example, the round function usually takes two
# arguments: the value to be rounded and the unit or scale. You may call it in any of the
# following ways:

say 'B:';
say round 42.45, 1; # 42
say round 42.45, .1; # 42.5
say round(42.45, .1); # 42.5 # But not: round (42.45, .1);
say round( 42.45, .1); # 42.5 # Space is OK *after* the opening paren

# Experienced Perl programmers usually prefer to omit the parentheses when they can.
# Doing so makes it possible to chain several functions with a visually cleaner syntax.
# Consider for example the differences between these two calls:

say round 42.45, 1; # 42
say(round(42.45, 1)); # 42

# The second statement is explicitly saying what is going on, but the accumulation of
# parentheses actually makes things not very clear. By contrast, the first statement can
# be seen as a pipeline to be read from right to left: the last function on the right, round,
# is taking two arguments, 42.45, 1, and the value produced by round is passed as an
# argument to say .
# It is common to say that a function “takes” one or several arguments and “returns” a
# result. The result is also called the return value.
# Perl provides functions that convert values from one type to another. When called
# with only one argument, the round function takes any value and converts it to an
# integer, if it can, or complains otherwise:
#
# > round 42.3; # 42
# > round "yes" # Cannot convert string to number: base-10 number must begin with valid
# digits or '.' in '<HERE>yes' (indicated by <HERE>)
# in block <unit> at <unknown file> line 1
#
# Note that, in Perl 6, many built-in functions can also use a method invocation syntax
# with the so-called dot notation. The following statements display the same result:

say 'C:';
say round 42.7; # 43 # Function call syntax
say 42.7.round; # 43 # Method invocation syntax

# The round function can round off rational and floating-point values to integers.
# There is an Int method that can also convert noninteger numerical values into inte‐
# gers, but it doesn’t round off; it chops off the fraction part:

say round 42.7; # 43
say 42.7.Int; # 42

# We’ll come back to methods in the next section.
# The Rat built-in function converts integers and strings to rational numbers (if
# possible):

say 'D:';
say 4.Rat; # 4
say 4.Rat.WHAT; # (Rat)
say Rat(4).WHAT; # (Rat)
say Rat(4).nude; # (4 1)
say Rat('3.14159'); # 3.14159
say Rat('3.14159').nude; # (314159 100000)

# (As you might remember, the nude method displays the numerator and denominator
# of a rational number.)
# Finally, Str converts its argument to a string:

say 'E:';
say 42.Str.WHAT; # (Str)
say Str(42).WHAT; # (Str)

# Note that these type conversion functions often don’t need to be called explicitly, as
# Perl will in many cases try to do the right thing for you. For example, if you have a
# string that looks like an integer number, Perl will coerce the string to an integer for
# you if you try to apply an arithmetic operation on it:

say 'F:';
say "21" * "2"; # 42

# Similarly, integers will be coerced to strings if you apply the string concatenation
# operator to them:

say 'G:';
say 4 ~ 2; # 42
say (4 ~ 2).WHAT; # (Str)

# The coercion can even happen twice within the same expression if needed:

say (4 ~ 1) + 1; # 42
say ((4 ~ 1) + 1).WHAT; # (Int)

