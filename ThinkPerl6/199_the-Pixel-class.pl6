#!/usr/bin/env perl6
#
# The Pixel Class
#
# The Point2D class is very general and could be used for a variety of purposes: geome‐
# try, vector graphics, animated mangas, and so on. We may want to use it to display
# graphic data on a screen. For this scenario, let’s create a new derived class, Pixel,
# adding new properties to the point, such as color, perhaps transparency, etc.
# Do we need to redefine all the attributes and methods for the new class? No, we don’t.
# We can define a new class that inherits the properties of the Point2D base class and
# only modify what is no longer suitable or add whatever new features we need. Here,
# we want a new attribute to represent the pixel color and probably some new methods
# dealing with this new attribute.
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
#
# According to the most common standards, a color is defined by three integers (really
# three octets, i.e., integers between 0 and 255 in decimal notation), representing the
# red, green, and blue (RGB) components of the pixel:

class Pixel is Point2D {
    has %.color is rw;
    method change_color(%hue) {
        self.color = %hue;
    }
    method change_color2(Int $red, Int $green, Int $blue) {
        # signature using positional parameters
        self.color = (red => $red, green => $green, blue => $blue)
    }
}

# The new class inherits the properties of Point2D thanks to the is Point2D trait,
# except possibly those that are explicitly modified (or overridden) or added in the new
# class. The new class is sometimes called a child class or subclass, whereas Point2D is
# the parent class. Creating this new class based on Point2D is called subclassing the
# Point2D parent class.
#
# The new child class inherits the abscissa and ordinate attributes of the Point2D
# parent class (and their specific type and properties if any), as well as the methods
# such as coordinates defined in the parent class. The child class has a new attribute
# (the color) and two new methods.
#
# In the preceding code example, we have written two different methods for changing
# the color only to illustrate two possible syntax formats, for pedagogical purposes. The
# first one receives a hash as a parameter, and the second one uses positional parame‐
# ters, which forces the user to remember the order (RGB) in which the arguments
# must be passed; this can be a source of error and should be avoided when the number
# of parameters exceeds a certain limit (which will be left up to the reader). On the
# other hand, anyone working commonly with graphics knows by heart the standard
# conventional order of colors (i.e., RGB). Also, the second method has the advantage
# of enabling some type checks (the arguments must be integers). This is a simplified
# example; in real life, it may be desirable to check that the parameters are octets, i.e.,
# integers between 0 and 255 (which could be done by adding a type constraint or
# defining a subset of the integer type).
#
# Using the new Pixel class is straightforward:

my $pix = Pixel.new(
    abscissa => 3.30,
    ordinate => 4.20,
    color => {:red(255), :green(255), :blue(255)}
);
say "Original colors: ", $pix.color;

$pix.change_color({:red(195), :green(110), :blue(70),});
say "Modified colors: ", $pix.color;
say "New pixel caracteristics:";
printf "\tAbscissa: %.2f\n\tOrdinate: %.2f\n\tColors: R: %d, G: %d, B: %d\n",
        $pix.abscissa, $pix.ordinate,
        $pix.color<red>, $pix.color{"green"}, $pix.color{"blue"};

$pix.change_color2(90, 180, 30); # positional args
say "New colors:
\tR: {$pix.color<red>}, G: {$pix.color<green>}, B: {$pix.color<blue>} ";

# This displays the following output:
#
# Original colors: {blue => 145, green => 233, red => 34}
# Modified colors: {blue => 70, green => 110, red => 195}
# New pixel caracteristics:
# Abscissa: 3.30
# Ordinate: 4.20
# Colors: R: 195, G: 110, B: 70
# New colors:
# R: 90, G: 180, B: 30
#
# To tell the truth, it was not necessary to use two different method names,
# change_color and change_color2 , as we did in the Pixel class definition to simplify
# matters. It would work the same way if we use these definitions:
#
# multi method change_color(%hue) {
#     self.color = %hue
# }
#
# multi method change_color(Int $red, Int $green, Int $blue) {
#     # signature using positional parameters
#     self.color = (red => $red, green => $green, blue => $blue)
# }
#
# Since the multi method is defined twice, with the same name but with a different sig‐
# nature, the object system is able to dispatch the invocation to the right method.

