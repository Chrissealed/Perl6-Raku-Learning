#!/usr/bin/env perl6
#
# Creating Methods
#
# The simple Point2D class and its instance $point are not very useful so far. Let’s com‐
# plete the class definition with some methods:

say 'A:';
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
#
# A method definition is not very different from a subroutine definition, except that it
# uses the method keyword instead of the sub keyword. This is not a surprise since a
# method is essentially a subroutine that is defined within a class (or a role) and knows
# about its invocant, i.e., the object that called it and its class. And, of course, it has a
# different calling syntax.
#
# Another important difference between a subroutine and a method is that, since there
# may be several methods with the same name defined in different classes (or different
# roles), a method invocation involves a dispatch phase, in which the object system
# selects which method to call, usually based on the class or type of the invocant. How‐
# ever, in Perl 6, that difference is blurred by the fact that you can have multi subrou‐
# tines, i.e., subroutines with the same name and a different signature that are also
# resolved at runtime, depending on the arity (number of arguments) and type of the
# arguments.
#
# Within a method definition, self refers to the invocant, the object that invoked the
# method. There is a shorthand for it, $., so that we could write the coordinates
# method as follows:
#
# method coordinates { # accessor to both x and y
    # return ($.abscissa, $.ordinate)
# }
#
# The two syntax formats, $. and self, are essentially equivalent.
# There is a third syntactic way of doing it, using an exclamation mark instead of a dot:
#
# method coordinates { # accessor to both x and y
    # return ($!abscissa, $!ordinate)
# }
#
# Here, the result would be the same, but this new syntax is not equivalent: $.abscissa
# is a method invocation, whereas $!abscissa provides direct access to the attribute.
# The difference is that $!abscissa is available only within the class (and might be
# slightly faster), while the method invocation syntax can be used somewhere else (for
# example in another class). We will see in the next section examples of this distinction
# and its consequences.
#
# We can now create an object and call our methods on it:

my $point = Point2D.new(
    abscissa => 4,
    ordinate => 3
);
say $point.coordinates; # -> (4 3)
say $point.distanceToCenter; # -> 5
say $point.polarCoordinates; # -> (5 0.643501108793284)

# You might remember from previous chapters that if you use a method without nam‐
# ing an explicit invocant, then the method applies to the $_ topical variable:

say 'B:';
.say for <one two three>; # -> one two three (each on one line)

# Now that we have created an object with some methods, we can also take advantage
# of the same syntax shortcut. For example if we use for or given to populate the $_
# topical variable with the $point object, we can write:

given $point {
    say .coordinates; # -> (4 3)
    say .distanceToCenter; # -> 5
    .polarCoordinates.say; # -> (5 0.643501108793284)
}

# As an exercise, you could write a method called distance_between_points that takes
# two points as arguments and returns the distance between them using the Pythagor‐
# ean theorem.
#
# The methods of our class so far are all accessors, which means they provide a snapshot
# of some of the invocant’s attributes. If the attributes are mutable (declared with the is
# rw trait), we can also create some mutators, i.e., methods that can be invoked to
# change those mutable attributes:

say 'C:';
class Point2D-mutable {
    has Numeric $.abscissa is rw;
    has Numeric $.ordinate is rw;

    # perhaps the same accessors as in the class definition above

    method new-ordinate (Numeric $ord) {
        self.ordinate = $ord;
    }
}

# Creating the Point2D-mutable object:
$point = Point2D-mutable.new(abscissa => 3, ordinate => 4);
say $point; # -> Point2D-mutable.new(abscissa => 3, ordinate => 4)
# Modifying the ordinate:
$point.new-ordinate(6);
say $point; # -> Point2D-mutable.new(abscissa => 3, ordinate => 6)

