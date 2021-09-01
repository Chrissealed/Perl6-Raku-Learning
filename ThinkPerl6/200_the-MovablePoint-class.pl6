#!/usr/bin/env perl6
#
# The $.abscissa and $.ordinate attributes of class Point2D are defaulted to read-
# only. After all, when you define a point in the plan, it usually has a fixed position and
# there is generally no reason to change its coordinates.
# Suppose, however, that our application is about kinematics (the branch of physics
# dealing with the motion of points or bodies) or is a video game. In such a case, we
# probably want our points (or sets of points) to move. We need a new class, Movable
# Point, enabling the modification of coordinates.
# We don’t need to redefine all the attributes and methods for the new class. Again, we
# can define a new class that inherits the properties of the Point2D base class and only
# modifies what is no longer suitable or adds whatever new features we need, for exam‐
# ple:
#
# The simple Point2D class and its instance $point are not very useful so far. Let’s com‐
# plete the class definition with some methods:

class Point2D {
    has Numeric $.abscissa;
    has Numeric $.ordinate;

    method coordinates {
        # accessor to both x and y
        return (self.abscissa, self.ordinate)
    }

    method distanceToCenter {
        (self.abscissa ** 2 + self.ordinate ** 2) ** 0.5
    }

    method polarCoordinates {
        my $radius = self.distanceToCenter;
        my $theta = atan2 self.ordinate, self.abscissa;
        return $radius, $theta;
    }
}

# We declare three methods in the class:
#
# • coordinates, a simple accessor to the Cartesian coordinates
#
# • distanceToCenter, a method to compute and return the distance between the
# object and the origin
#
# • polarCoordinates, a method to compute the radius and azimuth ($theta) of the
# object in the polar coordinates system (notice that polarCoordinates invokes
# the distanceToCenter method to find the radius component of the polar coordi‐
# nates)

class MovablePoint is Point2D {
    has Numeric $.abscissa is rw;
    has Numeric $.ordinate is rw;
    method move (Numeric $x, Numeric $y) {
        $.abscissa += $x;
        $.ordinate += $y;
    }
}

# Again, the new class inherits the properties of Point2D thanks to the is Point2D
# trait, except those that are explicitly modified (or overridden) or added in the new
# class. Methods that exist in the parent class and are redefined in a child class are said
# to be overridden within that class.
#
# Here, the $.abscissa and $.ordinate attributes are redefined as read and write
# (through the is rw trait) and a new method, move, is defined to modify the position
# of a point by adding the received parameters to the coordinates of the point.
# Note that we have used positional parameters here for the move method. We said that
# it is often better for the sake of clarity to use named parameters, but we have only two
# parameters here; as it is fairly simple to remember that the $x parameter should come
# before the $y parameter, this was a good occasion to illustrate the possibility of using
# positional parameters.
#
# We can now test our new child class, create a MovablePoint instance, display its char‐
# acteristics, move it to a different location, and display the new position:

my $point = MovablePoint.new(
    abscissa => 6,
    ordinate => 7,
);

say "Coordinates : ", $point.coordinates;
say "Distance to origin: ", $point.distanceToCenter.round(0.01);
printf "%s: radius = %.4f, theta (rad) = %.4f\n",
    "Polar coordinates", $point.polarCoordinates;
say "--> Moving the point.";
$point.move(4, 5);
say "New coordinates: ", $point.coordinates;
say "Distance to origin: ", $point.distanceToCenter.round(0.01);
printf "%s: radius = %.4f, theta (rad) = %.4f\n",
    "Polar coordinates", $point.polarCoordinates;

# This produces the following output:
#
# Coordinates : (6 7)
# Distance to origin: 9.22
# Polar coordinates: radius = 9.2195, theta (rad) = 0.8622
# --> Moving the point.
# New coordinates: (10 12)
# Distance to origin: 15.62
# Polar coordinates: radius = 15.6205, theta (rad) = 0.8761
#
# Here, when the user code invokes the coordinates , distanceToCenter , and polar
# Coordinates methods, Perl finds that they do not exist in MovablePoint . But, as Mova
# blePoint subclasses Point2D, the program looks for methods having these names in
# the parent class and invokes them if it finds them. If it did not find them, it might
# look into the parent’s parent to see if there are any, and so on.

