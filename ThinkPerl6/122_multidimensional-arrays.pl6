#!/usr/bin/env perl6
#
# Multidimensional Arrays
#
# The arrays we have seen so far are one-dimensional. In some languages, such arrays
# are called vectors. But arrays can also be multidimensional (you may then call them
# matrices).
# For example, you might use a two-dimensional array to store a list of employees with
# their respective salaries:

say 'A:';
my @employees;
# []
@employees[0;0] = "Liz";
# Liz
@employees[0;1] = 3000;
# 3000
@employees[1] = ["Bob"; 2500];
# [Bob 2500]
@employees[2] = ["Jack"; 2000];
# [Jack 2000]
@employees[3] = ["Betty"; 1800];
# [Betty 1800]
say @employees[1;1];
# 2500
say @employees[2];
# [Jack 2000]
say @employees;
# [[Liz 3000] [Bob 2500] [Jack 2000] [Betty 1800]]

# It is possible to have more than two dimensions. For example, we could have a
# tridimensional matrix to store the temperatures in a chemical reactor, measured in
# various locations identified by their x, y, and z coordinates:

say 'B:';
my @temp;
@temp[1;3;4] = 80;
say @temp;

# For this type of data, however, it is often easier to use the data structure that we will
# cover in Chapter 10.
#
# Multidimensional arrays can also have a fixed size. For example, this may be a decla‐
# ration for two-dimensional array where the first dimension is the month in the year
# and the second the day in the month:

say 'C:';
my @date[12;31];
for 0..11 -> $i {
    for 0..30 -> $j {
        @date[$i; $j] = [$i+1; $j+1];
    }
}
say @date;

