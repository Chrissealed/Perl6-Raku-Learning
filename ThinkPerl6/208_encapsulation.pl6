#!/usr/bin/env perl6
#
# Encapsulation
#
# Encapsulation is the idea of hiding the data and the code of a library or a module
# from the user. It is not specific to object-oriented programming, but it is a fundamen‐
# tal concept of OOP.
#
# In object-oriented programming, encapsulation consists of protecting the data in an
# object from being tampered with directly (and possibly made inconsistent) by the
# user, who can access such data only through methods. This is achieved by providing
# to the user methods that are commonly called accessors (or getters) and mutators (or
# setters). This makes it possible to ensure that the object properties will be validated by
# its methods.
#
# Encapsulation is a strong form of data abstraction and procedural abstraction. Seen
# from the outside, an object is a black box having some specified properties and
# behaviors. This way, these properties and behaviors are hidden from the user. They’re
# not hidden in the sense that the user cannot know about them (at least in the open
# source world, it is easy to know that), but hidden in the sense that it is usually not
# possible to use that knowledge to bypass the supplied interface. This means that the
# internal implementation of the object may change without having to modify the
# external behavior. If you are going to use insider knowledge, your code will probably
# break when the internal implementation is modified, so don’t do that.
#
# Various programming languages don’t have the same rules for guaranteeing encapsu‐
# lation. Some are stricter than others, some are less restrictive for read access than for
# write access, and others don’t make such a distinction but rather rely on the visibility
# level specified for an attribute, for example “public” or “private” (with sometimes an
# intermediate “protected” level).
#
# Perl 6 lets you choose the encapsulation model you want to apply to your objects and
# attributes. All attributes are private. If you declare a class as follows:

class Point2D {
    has $!abscissa;
    has $!ordinate;
    # ...
    method value_x { return $!abscissa }
    method value_y { return $!ordinate }
}

# the $!x and $!y coordinates will be accessible only from within the class. This is why
# we have added accessor methods. In addition, the attributes are immutable by default.
#
# But as we have seen earlier, if you declare this class as follows:
# class Point2D {
#     has $.abscissa;
#     has $.ordinate;
#     # ...
# }
# the coordinates will still be private attributes, but Perl 6 will automatically generate
# accessor methods having the same names as the attributes, so that it will be possible
# to access them from outside the class almost as if they were public:
#
# class Point2D {
#     # ...
# }

my $point = Point2D.new(abscissa => 2, ordinate => 3);
#say $point.abscissa; # ERROR
say $point.value_x; # -> (Any)

# Whether the attribute is mutable or not is managed separately by the is rw trait. In
# brief, Perl 6 offers a default access mode, but you can fine-tune it and get what you
# need.

