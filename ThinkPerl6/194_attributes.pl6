#!/usr/bin/env perl6
#
# Attributes
#
# The attributes that we have defined are properties associated with the Point2D class,
# but they are specific to the instance of the class that has been created. They are
# instance attributes. If we create another Point2D object, it will also have these
# attributes, but the values of these attributes are likely to be different.
#
# Figure 12-1 shows the result of these assignments. A state diagram that shows an
# object and its attributes is called an object diagram.
#
# Figure 12-1. Object diagram
#
# The variable $point refers to a Point2D object, which contains two attributes.
# Each attribute of the Point2D class should refer to a number, but this is not obvious in
# the current definition of the class. As it stands right now, we could create a Point2D
# object with a string for the abscissa, which would not make much sense. We can
# improve the class definition by specifying a numeric type for the attributes:

class Point2D {
    has Numeric $.abscissa; # "x" value
    has Numeric $.ordinate; # "y" value
}

# The instance attributes are private to the class, which means that they normally can‐
# not be accessed from outside the class: you would usually need to invoke a method of
# the class (i.e., a kind of subroutine defined within the class) to get their value. How‐
# ever, when an attribute is defined with a dot as in $.abscissa :
#
# has $.abscissa;
#
# Perl automatically creates an implicit accessor method, i.e., a method having the same
# name as the attribute that returns the value of this attribute. Thus, when we wrote:

my $point = Point2D.new(abscissa => 3, ordinate => 4);
say $point.abscissa; # -> 3

# we were not accessing directly the abscissa attribute of the $point object, but we
# were really calling the abscissa method on the object, which in turn returned the
# value of that attribute.
# You can use such an accessor with dot notation as part of any expression. For exam‐
# ple:

my $dist-to-center = sqrt($point.abscissa ** 2 + $point.ordinate ** 2);
say $dist-to-center;

# There is another way to declare an attribute in a class, with an exclamation mark twi‐
# gil instead of a dot:

# has $!abscissa;
#
# In that case, Perl does not create an implicit accessor method and the attribute can
# only be accessed from methods within the class. Such an attribute is now fully private.
#
# However, if you declare attributes this way, you will not be able to populate them at
# object creation with the default new constructor and will need to create your own
# constructor (or indirectly modify new). So don’t try that for the time being, as you
# would not be able to do much with your objects at this point. We’ll get back to that
# later.
#
# By default, object attributes are not mutable; they are read-only. This means you can‐
# not modify them once the object has been created. This is fine for some attributes: if
# an object represents a person, that person’s name and birth date are unlikely to
# change. Some other attributes may need to be updated, sometimes very frequently. In
# such cases, attributes can be declared to be mutable with the is rw trait:

class Point2D2 {
    has Numeric $.abscissa is rw; # "x" value
    has Numeric $.ordinate is rw; # "y" value
}

# It is now possible to modify these attributes. For example, we can change the newly
# created point’s abscissa:
#
# First creating a Point2Db object:

$point = Point2D2.new(abscissa => 3, ordinate => 4);
say $point; # -> Point2D2.new(abscissa => 3, ordinate => 4)

# Now moving the $point object two units to the right:

$point.abscissa = 5;
say $point; # -> Point2D2.new(abscissa => 5, ordinate => 4)

# Almost all of the information presented so far about attributes has been related to
# instance attributes, i.e., to properties related to individual objects. You can also have
# attributes pertaining to the whole class, which are named class attributes. They are
# less common than instance attributes and are declared with the my declarator (instead
# of has). A typical example of a class attribute would be a counter at the class level to
# keep track of the number of objects that have been instantiated.

