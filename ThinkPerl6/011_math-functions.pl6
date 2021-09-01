#!/usr/bin/env perl6
#
# Math Functions
#
# Perl provides most of the familiar mathematical functions.
# For some less common functions, you might need to use a specialized module such as
# Math::Matrix or Math::Trig. A module is a file that contains a collection of related
# functions.
#
# Before we can use the functions in a module, we have to import it with a use
# statement:

# use Math::Trig;

# This statement will import a number of functions that you will then be able to use as
# if you had defined them in your main source file, for example deg2rad to perform
# conversion of angular values from degrees to radians, or rad2deg to perform the
# opposite conversion.
# For most common mathematical functions, however, you don’t need any math mod‐
# ule, as they are included in the core of the language:

say 'A:';
my $noise-power = 5.5; # 5.5
my $signal-power = 125.6; # 125.6
my $decibels = 10 * log10 $signal-power / $noise-power; # 13.5862694990693
say "Noise power : $noise-power";
say "Signal power : $signal-power";
say "Decibels : $decibels";

# This example uses log10 (common logarithm) to compute a signal-to-noise ratio in
# decibels (assuming that signal-power and noise-power are defined in the proper
# units). Perl also provides a log function which, when receiving one argument, com‐
# putes logarithm base e of the argument, and, when receiving two arguments, com‐
# putes the logarithm of the first argument to the base of the second argument:

say 'B:';
say e; # 2.71828182845905 # e is predefined as Euler's constant
my $val = e ** e; # 15.1542622414793
say log $val; # 2.71828182845905 # natural logarithm
say log $val, e; # 2.71828182845905 # logarithm base e or natural logarithm
say log 1024, 2; # 10 # binary logarithm or logarithm base 2

# Perl also provides most common trigonometric functions:

say 'C:';
my $radians = 0.7; # 0.7
my $height = sin $radians; # 0.644217687237691
say "Radians : $radians";
say "Height : $height";

# This example finds the sine of $radians. The name of the variable is a hint that sin
# and the other trigonometric functions (cos, tan, etc.) take arguments in radians. To
# convert from degrees to radians, you may use the deg2rad function of the
# Math::Trig module , or simply divide by 180 and multiply by π:

say 'D:';
my $degrees = 45; # 45
$radians = $degrees / 180.0 * pi; # pi, predefined constant # 0.785398163397448
say sin $radians; # should be square root of 2 divided by 2 # 0.707106781186547

# The expression pi is a predefined constant for an approximation of π, accurate to
# about 14 digits.
# If you know trigonometry, you can check the previous result by comparing it to the
# square root of two divided by two:

say 'E:';
say sqrt(2) / 2; # 0.707106781186548

