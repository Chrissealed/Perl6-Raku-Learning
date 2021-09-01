#!/usr/bin/env perl6
#
# Think Perl6 exercises chapter 2

# We've seen that $n = 42 is legal.
# What about 42 = $n ?
# 42 = $n;
# Cannot modify an immutable Int
#   in block <unit> at exe2-01.pl6 line 7

# How about $x = $y = 1 ?
# (Hint: note that you will have to declare both variables,
# for example with a statement such as my $x; my $y; or possibly my ($x, $y);
# before you can run the above).
my ($x, $y);
$x = $y = 1;
say $x;
say $y;

# In some languages, statements don't have to end with a semicolon, ;.
# What happens in script mode if you omit a semicolon at the end of a Perl statement ?
# my $z
# ===SORRY!=== Error while compiling /home/christian/Documents/etude/Informatique/Programmation/Langages/Perl/Perl6/ThinkPerl6/exe2-01.pl6
# Two terms in a row across lines (missing semicolon or comma?)
# at /home/christian/Documents/etude/Informatique/Programmation/Langages/Perl/Perl6/ThinkPerl6/exe2-01.pl6:26
# ------> my $z⏏<EOL>
#     expecting any of:
#         infix
#         infix stopper
#         statement end
#         statement modifier
#         statement modifier loop

# What if you put a period at the end of the statement ?
# my $z.
# ===SORRY!=== Error while compiling /home/christian/Documents/etude/Informatique/Programmation/Langages/Perl/Perl6/ThinkPerl6/exe2-01.pl6
# Unsupported use of . to concatenate strings; in Perl 6 please use ~
# at /home/christian/Documents/etude/Informatique/Programmation/Langages/Perl/Perl6/ThinkPerl6/exe2-01.pl6:38
# ------> <BOL>⏏<EOL>
#
# In math notation you can multiply x and y like this: xy.
# What happens if you try that in Perl ?
# $x = xy;
# ===SORRY!=== Error while compiling /home/christian/Documents/etude/Informatique/Programmation/Langages/Perl/Perl6/ThinkPerl6/exe2-01.pl6
# Undeclared routine:
#     xy used at line 44

