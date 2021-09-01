#!/usr/bin/env perl6
#
# Boolean Functions
#
# Functions can return Boolean values, which is often convenient for hiding compli‐
# cated tests inside functions. For example:

sub is-divisible(Int $x, Int $y) {
    if $x % $y == 0 {
        return True;
    } else {
        return False;
    }
}

# It is common to give Boolean functions names that sound like yes/no questions; is-
# divisible, for instance, returns either True or False to indicate whether x is divisi‐
# ble by y .
# Here is an example:

my $result = is-divisible(6, 4);
say $result;
# False
$result = is-divisible(6, 3);
say $result;
# True

# The result of the == operator is a Boolean value, so we can write the subroutine more
# concisely by returning it directly:

sub is-divisible2(Int $x, Int $y) {
    return $x % $y == 0
}

$result = is-divisible2(6, 4);
say $result;
# False
$result = is-divisible2(6, 3);
say $result;
# True

# If there is no return statement, a Perl subroutine returns the value of expression on
# the last code line of the subroutine (provided the last code line is an expression that
# gets evaluated), so that the return statement is not required here. In addition, since 0
# is a false value and any other integer a true value, this could be further rewritten as
# follows:

sub is-divisible3(Int $x, Int $y) {
    not $x % $y;
}

$result = is-divisible3(6, 4);
say $result;
# False
$result = is-divisible3(6, 3);
say $result;
# True

# The Int type declarations in the subroutine signatures above are not necessary. The
# subroutine would work without them, but they can provide some form of protection
# against using this subroutine with faulty arguments.
#
# Boolean functions are often used in statement modifiers:

my $x = 6; my $y = 3;
say "$x is divisible by $y" if is-divisible($x, $y);

# It might be tempting to write something like:
#
# say "$x is divisible by $y" if is-divisible($x, $y) == True;
#
# But the extra comparison is unnecessary: is-divisible returns a Boolean value that
# can be interpreted directly by the if conditional.

