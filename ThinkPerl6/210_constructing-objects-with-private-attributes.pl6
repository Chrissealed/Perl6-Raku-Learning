#!/usr/bin/env perl6
#
# Constructing Objects with Private Attributes
#
# Constructing objects with private attributes raises a little difficulty. Let’s consider the
# following program:

say 'A:';
class Point3D {
    has $.x;
    has $.y;
    has $!z;
    method get {
        return ($!x, $!y, $!z);
    }
};

my $a = Point3D.new(x => 23, y => 42, z => 2);
say $_ for $a.get;

# In this example, we have declared $.x and $.y as “public” (so to speak) attributes, and
# $.z as a truly private attribute. Running this code displays this:
#
# 23
# 42
# (Any)
#
# Oops, what is going on? It seems that the get method is not able to read $!z, since it
# returns an undefined value. This method is defined within the class, so it should be
# able to access this attribute. In fact, get is not the problem, it is $!z that is not defined
# within the object, because it hasn’t been properly initialized during object construc‐
# tion.
#
# The guilt lies with the new implicit constructor which, by default, initializes only
# “public” attributes.
# Here, the simplest solution is probably to add a BUILD submethod in the class defini‐
# tion.
#
# A submethod is a public method of a class that is not inherited in its child classes.
# Semantically, it is really equivalent to a subroutine, but it is called with a method syn‐
# tax (hence the name). Submethods are especially useful to perform object construc‐
# tion and destruction tasks that should not be inherited by subclasses, as well as for
# tasks that are so specific to a given type that classes derived from it will almost surely
# have to redefine them.
#
# Initializing private attributes at object instantiation might look like this:

say 'B:';
class Point3D2 {
    has $.x;
    has $.y;
    has $!z;
    submethod BUILD (:$!x, :$!y, :$!z) {
        say "Initialization";
        $!x := $!x;
        $!y := $!y;
        $!z := $!z;
    }
    method get {
        return ($!x, $!y, $!z);
    }
};

$a = Point3D2.new(x => 23, y => 42, z => 2);
say $_ for $a.get;

# The program now works as desired and displays all three attributes:
# Initialization!
# 23
# 42
# 2
#
# This works because the default new constructor, a method defined in the Mu ultimate
# superclass and inherited by default by any Perl 6 class, calls the default BUILD subme‐
# thod. If we redefine BUILD in our class, it will supersede the default one called by new.
# By redefining BUILD, we force the constructor to take into account the private
# attribute that was not used previously.
#
# Quite a bit of simplification is possible. Since passing arguments to a routine binds
# the arguments to the parameters, a separate binding step is unnecessary if the
# attributes are used as parameters. Hence, the BUILD submethod in the example above
# could also have been written simply as:
#
# submethod BUILD(:$!x, :$!y, :$!z) {
#     say "Initialization!";
# }
#
# While we are speaking about the intricacies of object construction, note that since
# new is a method inherited from the Mu superclass, you can override it if you wish. The
# default new constructor can only be used with named arguments. Assuming you
# absolutely want to use positional parameters, you could override new with your own
# method, like so:

say 'C:';
class Point2D {
    has Numeric $.abscissa;
    has Numeric $.ordinate;
    method new ($x, $y) {
        self.bless(abscissa => $x, ordinate => $y);
    }
    method coordinates {
        # accessor to both coordinates
        return (self.abscissa, self.ordinate)
    }
    # other methods
};

my $point = Point2D.new(3, 5);
say $_ for $point.coordinates;

# This will duly display the two coordinates. bless is a low-level method for object
# construction, inherited from Mu and called automatically when you invoke new to
# construct an object. You usually don’t need to know about it, except when you want
# to write your own custom constructor.
#
# You can give the constructor a different name than new, for example:

say 'D:';
class Point2D2 {
    has Numeric $.abscissa;
    has Numeric $.ordinate;
    method construct ($x, $y) {
        self.bless(abscissa => $x, ordinate => $y);
    }
    method coordinates {
        # accessor to both coordinates
        return (self.abscissa, self.ordinate)
    }
    # other methods
};

$point = Point2D2.construct(3, 5);
say $_ for $point.coordinates;

# Think twice, though, before you override new or create your own custom constructor
# with a different name, as it may make it more complicated to subclass your Point2D
# class.

