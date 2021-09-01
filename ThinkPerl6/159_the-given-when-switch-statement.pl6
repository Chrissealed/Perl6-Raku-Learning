#!/usr/bin/env perl6
#
# The given ... when “Switch” Statement
#
# Perl 6 has a “switch” statement, written with the given and when keywords. The given
# keyword introduces the variable or expression that will be tested, and each of the
# when statements specify a condition followed by a block that will execute if the condi‐
# tion is true. By default, the process stops at the first condition that is satisfied.
#
# The example just above can be rewritten as follows:

say 'A:';
my $value = 100;
given $value {
    when 0..9      { say "One digit" }
    when $_ < 99   { say "Two digits" }
    when /^\d**3$/ { say "Three digits" }
    default        { say "More than three digits" }
}

# The given $value statement “topicalizes” the argument, i.e., assigns the content of
# $value to the $_ topical variable (or, more precisely, aliases it to $_). The argument to
# given is a simple variable in the example above, but it can be a complex expression
# whose evaluation is stored (and cached) into $_. Each of the when conditions is
# checked against $_. I have written these conditions in three different syntactical
# forms to illustrate some of the various possibilities:
#
# • The first one checks $_ (implicitly) against the 0..9 range.
# • The second one compares explicitly $_ to 99.
# • The third one uses a regex to check whether $_ has three digits.
# • The default statement runs only if the other conditions have failed.
#
# Only one message will be printed, because the matching process stops as soon as one
# condition has been satisfied, and the default clause will run if no other condition has
# been met.
#
# If there is no specific operator in the when clause, then it will smart match the expres‐
# sion in the when clause against $_ :
#
# when $foo { ... } # equivalent to: when $foo ~~ $_ { ... }
#
# Note that the given keyword is not doing much more than topicalizing its argument
# for the rest of the block. The when clauses are doing the bulk of the real work. In fact,
# you can even use the when clauses without a given, provided you assign the right
# value to $_, which, as you hopefully remember, can be done with a for block:

say 'B:';
my $val = 7;
for $val {
    when 0..6 { say "less than" }
    when 7    { say "Exact"; }
    when 8..* { say "greater than"; }
}

# It is possible to add a proceed clause at the end of any of the conditional code blocks
# to prevent the process from stopping after that code block has succeeded. For exam‐
# ple, you might write this:

say 'C:';
$value = 42;
given $value {
    when 0..9          { say "One digit" }
    when 10..99        { say "Two digits"; proceed }
    when 42            { say "The response to the ultimate question" }
    when /^\d**3$/     { say "Three digits" }
    default            { say  "More than three digits" }
}

# Here, if $value is 42, two messages will be displayed, “Two digits” and “The response
# to the ultimate question,” because the proceed clause in the second code block pre‐
# vents the process from stopping on the first successful match.
#
# Good, it seems, but there is a problem. The proceed clause should be used with some
# care, as it can easily lead to unexpected results. In fact, the code above is actually
# wrong: if $value has two digits but is not 42 (if it is, say, 43), the default block will also
# run, because the only other successful match had this proceed clause, and will say
# that there are “More than three digits” although this is obviously false.
#
# As an exercise, test the above code with various values and try to find a way to fix the
# bug with the proceed clause. Solution: “Exercise: The given ... when switch state‐
# ment” on page 405.

