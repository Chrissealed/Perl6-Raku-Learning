#!/usr/bin/env perl6
#
# Polymorphism
#
# Polymorphism is a way to supply a common or close interface to different types. In a
# certain way, the inheritance examples studied previously offer a form of polymor‐
# phism: the coordinates, distanceToCenter, and PolarCoordinates methods are
# polymorphic, since they can apply to Point2D, movablePoint, and pixel types. But
# these are trivial forms of polymorphism. We will speak of polymorphism when the
# relevant methods or functions are doing something different from each other, at least
# at the implementation level, even if they share the same name and interface.
#
# Outside of object-oriented programming, Perl’s multi subroutines implement a form
# of polymorphism, since they can behave differently depending on the type and num‐
# ber of their arguments. Within the OOP context, it is often the type of the invocant
# (its class or possibly one of its roles) that will determine, usually at runtime, which of
# the possible methods will be invoked.
#
# For example, we might want to create a new class for points in a three-dimensional
# space. The methods will have to be different, but it seems interesting to offer the user
# an interface that is the same (or almost) as for two-dimensional points:

class Point3D {
    has Numeric $.x;
    has Numeric $.y;
    has Numeric $.z;
    method coordinates () {
        # accessor to the 3 coordinates
        return $.x, $.y, $.z;
    }
    method distanceToCenter () {
        return ($.x ** 2 + $.y ** 2 + $.z ** 2) ** 0.5;
    }
    method polarCoordinates () {
        return self.sphericalCoordinates;
    }
    method sphericalCoordinates {
        my $rho = $.distanceToCenter;
        my $longitude = atan2 $.y, $.x;
        # theta
        my $latitude = acos $.z / $rho;
        # phi
        return $rho, $longitude, $latitude;
    }
    method cylindricalCoordinates {
        # ...
    }
}

my $p = Point3D.new(x => 5, y => 10, z => 15);
say $p.coordinates;
say $p.distanceToCenter;
say $p.polarCoordinates;
say $p.sphericalCoordinates;

# The methods in this new class are not the same as those in Point2D, but methods
# with similar semantics have the same name; it is thus possible to use either class
# without being lost with different names.
#
# The distanceToCenter method has exactly the same interface. The coordinates
# method returns a list of three values instead of two, but the calling convention is the
# same. Note that it might also have been possible to design Point2D so that this
# method would also return a third zero value, in order to have exactly the same inter‐
# face (after all, a point in the plane might be considered as a point in the 3D space with
# a zero height); complying to exactly the same interface is not mandatory, but only a
# possible implementation decision that might make for a more intuitive interface.
#
# The notion of polar coordinates does not have a well-defined meaning in a 3D space,
# but I have chosen here to keep the name in our interface because it is intuitively quite
# similar to the idea of spherical coordinates; it does nothing more than invoke the
# sphericalCoordinates method on its invocant and return the return values.
#
# Please note that mathematicians, physicists, astronomers, engineers, geographers, and
# navigators all use the same basic system for spherical coordinates, but their conven‐
# tions are different concerning the origin, angle range, angle measurement units, and
# rotation direction, and the names of the various values or symbols associated with
# them. So you might find some different formulas in a textbook. The conventions and
# formulas we have used here are commonly used in geography and some branches of
# mathematics. A real general-purpose class might have to take these varying conven‐
# tions into account and implement the necessary conversions.

