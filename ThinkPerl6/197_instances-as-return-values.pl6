#!/usr/bin/env perl6
#
# Instances as Return Values
#
# Methods can return instances of another class. For example, the Rectangle class can
# have methods returning instances of Point2D for the other corners:

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

    method topRightPoint {
        return Point2D.new(
            abscissa => $!corner.abscissa + $!width,
            ordinate => $!corner.ordinate + $!height
        );
    }
    # other methods for other corners

    method find-center { Point2D.new(
        abscissa => $!corner.abscissa + $!width / 2,
        ordinate => $!corner.ordinate + $!height / 2
        );
    }
}

# Notice that we don’t even bother to give a name to the upper right point (although we
# could, if we wanted); we create it with the constructor and return it on the fly.
#
# We can use the new method as follows:

my $start-pt = Point2D.new(abscissa => 4, ordinate => 3);
my $rect = Rectangle.new(corner => $start-pt, height => 10, width => 5);
my $topRightPt = $rect.topRightPoint;
say "Top right corner: ", $topRightPt; # -> Top right corner: Point2D.new(abscissa => 9, ordinate => 13)

# Although this is not very useful in such a simple case, we could play it safe and
# declare a Point2D type for $topRightPt :

my Point2D $topRightPt2 = $rect.topRightPoint;
say $topRightPt2;

# This way, the code will raise an error if the topRightPoint happens to return some‐
# thing other than a Point2D instance.
#
# Similarly, the find-center method invoked on a Rectangle returns a Point2D
# instance representing the center of the Rectangle :
#
# method find-center { Point2D.new(
    # abscissa => $!corner.abscissa + $!width / 2,
    # ordinate => $!corner.ordinate + $!height / 2
    # );
# }
#
# This new method can be used as follows:

say "Center = ", $rect.find-center; # -> Center = Point2D.new(abscissa => 6.5, ordinate => 8.0)

