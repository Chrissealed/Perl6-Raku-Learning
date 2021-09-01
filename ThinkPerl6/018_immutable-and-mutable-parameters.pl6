#!/usr/bin/env perl6
#
# Immutable and Mutable Parameters
#
# By default, subroutine parameters are immutable aliases for the arguments passed to
# the subroutine. In other words, they cannot be changed within the function and you
# cannot accidentally modify the argument in the caller:

# sub plus-three(Int $number) { $number += 3}
# my $value = 5;
# say plus-three $value; # ERROR: Cannot assign to an immutable value

# In some other languages, this behavior is named a “call by value” semantic: loosely
# speaking, the subroutine receives (by default) a value rather than a variable, and the
# parameter therefore cannot be modified.
# If you want to change the value of the parameter within the subroutine (but without
# changing the argument in the caller) you can add the is copy trait to the signature:

sub plus-three(Int $number is copy) { $number += 3}
my $value = 5;
say plus-three $value; # 8
say $value; # 5 (unchanged)

# A trait is a property of the parameter defined at compile time. Here, the $number
# parameter is modified within the subroutine and the incremented value is returned to
# the caller and printed as 8, but, within the caller, the variable used as an argument to
# the function, $value, is not modified (it is still 5).
# Although this can sometimes be dangerous, you may also want to write a subroutine
# that modifies its argument at the caller side. For this, you can use the is rw trait in
# the signature:

sub rw-plus-three(Int $number is rw) { $number += 3}
say rw-plus-three $value; # 8
say $value; # 8 ($value modified)

# With the is rw trait, the $number parameter is now bound to the $value argument, so
# that any change made using $number within the subroutine will immediately be
# applied to $value at the caller side, because $number and $value are just different
# names for the same thing (they both refer to the same memory location). The argu‐
# ment is now fully mutable.
# In some other languages, this is named a “call by reference” parameter passing mech‐
# anism, because, in those languages, if you pass a reference (or a pointer) to a variable
# to a function, then it is possible for the function to modify the variable referred to by
# the reference.

