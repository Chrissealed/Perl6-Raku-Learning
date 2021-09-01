#!/usr/bin/env perl6
#
# Exercise 5-1.
# Draw a stack diagram for the following program. What does the program print?
# Please try to answer these questions before trying to run the program.
# sub b(Int $z) {
# my $prod = a($z, $z);
# say $z, " ", $prod;
# return $prod;
# }
# sub a(Int $x is copy, Int $y) {
# $x++;
# return $x * $y;
# }
# sub c(Int $x, Int $y, Int $z) {
# my $total = $x + $y + $z;
# my $square = b($total) ** 2;
# return $square;
# }
# my $x = 1;
# my $y = $x + 1;
# say c($x, $y + 3, $x + $y);

