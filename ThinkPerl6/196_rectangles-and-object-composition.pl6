#!/usr/bin/env perl6
#
# Rectangles and Object Composition
#
# Sometimes it is obvious what the attributes of an object should be, but other times
# you have to make decisions. For example, imagine you are designing a class to repre‐
# sent rectangles. What attributes would you use to specify the location and size of a
# rectangle? You can ignore angle; to keep things simple, assume that the rectangle’s
# edges are either vertical or horizontal.
#
# There are at least two possibilities:
#
# • You could specify one corner of the rectangle (or the center), the width, and the
# height.
#
# • You could specify two opposing corners.
#
# At this point it is hard to say whether either is better than the other, so we’ll imple‐
# ment the first one, just as an example.
#
# Here is the class definition:

class Point2D {
    has Numeric $.abscissa;
    has Numeric $.ordinate;
}

class Rectangle {
    has Numeric $.width;
    has Numeric $.height;
    has Point2D $.corner; # lower left vertex
    method area { return $.width * $.height }
    method topLeft { $.corner.abscissa, $.corner.ordinate + $.height; }
    # other methods, e.g. for other corners' coordinates, center, etc.
}

# The new feature compared to the previous Point2D class definition is that the Rectan
# gle class can now use the Point2D type created previously for defining the corner
# attribute.
#
# The topLeft method returns the coordinates of the top left angle of the rectangle.
# This topLeft method gives us an opportunity to explain a bit more the difference
# between the $. and $! twigils. We have used $.corner.abscissa to obtain the
# abscissa of the corner, i.e., in effect an accessor invocation. We could have directly
# accessed the corner and height attributes of the Rectangle class and used the fol‐
# lowing method definition:
#
# method topLeft { $!corner.abscissa, $!corner.ordinate + $!height; }
#
# But it would not be possible to use $!corner!abscissa or $.corner!abscissa ,
# because abscissa is not an attribute defined in the Rectangle class, and thus cannot
# be accessed directly there. You can use direct access to the attribute (for example with
# the $!abscissa syntax) only within the class where this attribute is defined, Point2D .
# So, in Rectangle, we need to invoke the accessor (i.e., the syntax with $.) for obtain‐
# ing the value of the corner abscissa.
#
# We can now create a Rectangle object:

my $start-pt = Point2D.new(abscissa => 4, ordinate => 3);
my $rect = Rectangle.new(corner => $start-pt, height => 10, width => 5);
say "Topleft coord.: ", $rect.topLeft; # -> Topleft coord.: (4 13)
say "Rectangle area: ", $rect.area; # -> Rectangle area: 50

# You might have noticed that the arguments passed to the Rectangle.new constructor
# are not in the same order as in the class definition. I did that on purpose to show that
# the order is unimportant because we are using named arguments.
# Figure 12-2 shows the state of this object.
#
# Figure 12-2. Object diagram
#
# Using an object as an attribute of another object, possibly of another class, is called
# object composition. An object that is an attribute of another object is embedded.
# Object composition makes it possible to easily define nested layers of abstraction and
# is a powerful feature of object-oriented programming. In our “geometry” example, we
# started to define a low-level object, a Point2D instance, and then used that point to
# build a higher level type, Rectangle

