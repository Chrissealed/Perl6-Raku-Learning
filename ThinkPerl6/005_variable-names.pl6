#!/usr/bin/env perl6
#
# Variable Names
#
# Programmers generally choose names for their variables that are meaningful—they
# document what the variable is used for.
# Variable names can be as long as you like. They can contain both letters and numbers,
# but user-defined variable names can’t begin with a number. Variable names are case-
# sensitive, i.e., $message is not the same variable as $Message or $MESSAGE. It is legal to
# use uppercase letters, but it is conventional to use only lowercase for most variables
# names. Some people nonetheless like to use $TitleCase for their variables or even
# pure $UPPERCASE for some special variables.
# Unlike most other programming languages, Perl 6 does not require the letters and
# digits used in variable names to be plain ASCII. You can use all kinds of Unicode let‐
# ters, i.e., letters from almost any language in the world, so that, for example, $brücke,
# $payé, or $niño are valid variable names, which can be useful for non-English pro‐
# grammers (provided that these Unicode characters are handled correctly by your text
# editor and your screen configuration). Similarly, instead of using $phi for the name
# of the golden ratio variable, we might have used the Greek small letter phi, φ (Uni‐
# code code point U+03C6), just as we could have used the Greek small letter pi, π, for
# the well-known circle circumference-to-diameter ratio:

my $φ = (5 ** .5 + 1)/2; # golden ratio # 1.61803398874989
say 'Variable $φ = ', $φ; # Variable $φ = 1.61803398874989
my $π = 4 * atan 1; # 3.14159265358979
# you could also use the pi or π built-in constant:
say pi # 3.14159265358979

# The underscore character, _ , can appear anywhere in a variable name. It is often used
# in names with multiple words, such as $your_name or $airspeed_of_unladen_swallow.
# You may even use dashes to create so-called “kebab case” [1] and name those variables
# $your-name or $airspeed-of-unladen-swallow , and this might make them slightly
# easier to read: a dash is valid in variable names provided it is immediately followed by
# an alphabetical character and preceded by an alphanumerical character. For example,
# $double-click or $la-niña are legitimate variable names. Similarly, you can use an
# apostrophe ' (or single quote) between letters, so $isn't or $o'brien's-age are
# valid identifiers.
#
# [1] Because the words appear to be skewered like pieces of food prepared for a barbecue.
#
# If you give a variable an illegal name, you get a syntax error:
# > my $76trombones = 'big parade'
# ===SORRY!=== Error while compiling <unknown file>
# Cannot declare a numeric variable
# at <unknown file>:1
# ------> my $76<HERE>trombones = "big parade";
# >
# > my $more§ = 100000;
# ===SORRY!=== Error while compiling <unknown file>
# Bogus postfix
# at <unknown file>:1
# ------> my $more<HERE>§ = 100000;
# (...)
#
# $76trombones is illegal because it begins with a number. $more§ is illegal because it
# contains an illegal character, §.
# If you’ve ever used another programming language and stumbled across a terse mes‐
# sage such as "SyntaxError: invalid syntax" , you will notice that the Perl designers
# have made quite a bit of effort to provide detailed, useful, and meaningful error mes‐
# sages.
# Many programming languages have keywords or reserved words that are part of the
# syntax, such as if, while, or for, and thus cannot be used for identifying variables
# because this would create ambiguity. There is no such problem in Perl: since variable
# names start with a sigil, the compiler is always able to tell the difference between a
# keyword and a variable. Names such as $if or $while are syntactically valid variable
# identifiers in Perl (whether such names make sense is a different matter).

