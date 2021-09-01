#!/usr/bin/env perl6
#
# Programmer-Defined Types
#
# We have used many of Perl’s built-in types; now we are going to define a new type. As
# an example, we will create a type called Point2D that represents a point in two-
# dimensional space.
# In mathematical notation, points are often written in parentheses with a comma sepa‐
# rating the coordinates. For example, in Cartesian or rectangular coordinates, 0, 0
# represents the origin, and x, y represents the point x units to the right and y units up
# from the origin. x is called the abscissa of the point, and y the ordinate.
#
# There are several ways we might represent points in Perl:
#
# • We could store the coordinates separately in two variables, $x and $y .
# • We could store the coordinates as elements in a list, an array, or a pair.
# • We could create a new type to represent points as objects.
#
# Creating a new type is a bit more complicated than the other options, but it has
# advantages that will be apparent soon.
# A programmer-defined type is usually created by a class (or a role, but we will come
# back to that later). A barebones class definition for a point type looks like this:

class Point2D {
    has $.abscissa; # "x" value
    has $.ordinate; # "y" value
}

# The header indicates that the new class is called Point2D. The body is defining two
# attributes, i.e., named properties associated with the class, here the abscissa and ordi‐
# nate (or x and y coordinates) of the point.
#
# Defining a class named Point2D creates a type object.
# The type object is like a factory for creating objects. To create a point, you call the new
# method on the Point2D class:

my $point = Point2D.new(
    abscissa => 3,
    ordinate => 4
);
say $point.WHAT; # -> (Point2D)
say $point.isa(Point2D); # -> True
say $point.abscissa; # -> 3

# You can of course create as many points as you wish.
# The new method is called a constructor and has not been defined in this example; this
# is not needed because Perl 6 supplies a default new constructor method for every class
# (we’ll see later how). The method invocation syntax, with the dot notation, is the
# same as what we have used throughout the book to invoke built-in methods. You are
# not forced to use this constructor; you can also create your own (and you may name
# it new or something else), but we will stay with the built-in new method for the time
# being.
#
# Creating a new object with a class is called instantiation, and the object is an instance
# of the class.
# Every object is an instance of some class, so the terms “object” and “instance” are
# interchangeable. But we will often use “instance” to indicate that we are talking about
# an object belonging to a programmer-defined type.

