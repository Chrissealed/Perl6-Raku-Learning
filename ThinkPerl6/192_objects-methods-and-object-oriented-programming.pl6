#!/usr/bin/env perl6
#
# Objects, Methods, and Object-Oriented Programming
#
# Let us start with a high-level nontechnical overview of object-oriented programming
# in general and a brief introduction to the jargon associated with it.
#
# In computer science, an object may loosely describe a memory location or an entity
# having a value, and often be referred to by an identifier. This can be a variable, a data
# structure, an array, or possibly even a function. This general meaning is not the sense
# that we will use in this chapter.
#
# In object-oriented programming (OOP), the word object has a much more specific
# meaning: an object is an entity which often has:
#
# • An identity (for example its name).
#
# • Some properties defining its behavior (in the form of special functions that are
# usually called methods); this behavior usually does not change over time and is
# generally common to all objects of the same type.
#
# • A state defined by some special variables (called, depending on the language,
# attributes, instance data, fields, or members); the state may change over time and
# is generally specific to each object. In Perl, we speak about attributes.
#
# In brief, an object is a set of attributes and methods packed together.
#
# Objects are usually defined in a kind of code package called a class. A class defines the
# methods and the nature of the attributes associated with an object. In Perl 6, a class
# makes it possible to define new types similar to the built-in types that we have seen
# before. Very soon, we will start to define some classes and use them to create objects.
#
# You already know informally what a method is, as we have used built-in methods
# throughout the book. It is a sort of function with a special postfix syntax using the dot
# notation on the invocant. For example, you may invoke the say method on a simple
# string:

"foo".say; # -> foo

# Note that “foo” isn’t an object, but a simple string, but you can invoke the say method
# on it, because Perl can treat it internally as an object when needed. In some OOP lan‐
# guages, this implicit conversion of a native type into an object is sometimes called
# autoboxing.
#
# You probably also remember that methods can be chained in a process where the
# value returned by a method becomes the invocant for the next method:

"foo".uc.say; # -> FOO
my @alphabet = <charlie foxtrot alpha golf echo bravo delta>;
@alphabet.sort.uc.say; # prints: ALPHA BRAVO CHARLIE DELTA ECHO FOXTROT GOLF

# In OOP, methods applicable to objects are usually defined within classes, often the
# class that also defined the object or some other class closely related to it. In Perl 6,
# methods can also be defined in a role, which is another type of code package some‐
# what resembling to a class, as we will see later.
#
# The basic idea of object-oriented programming is that an object is a kind of black box
# that hides its internals (data and code) from the user; the user can consult or change
# the state of an object through the methods. Hiding the internals of objects is called
# encapsulation. This often enables a higher-level view and better data abstraction than
# what we have seen so far; this in turns helps to make programs less buggy (especially
# large programs).
#
# In addition, OOP usually also offers the following concepts:
#
# • Polymorphism, i.e., the possibility for a function or a method to do different
# things, depending on the type of object which calls it.
#
# • Inheritance, i.e., the possibility to derive a class from another class, so that the
# child class inherits some of the properties of the parent class, which is a powerful
# tool for code reuse.
#
# We will now study how all these concepts are implemented in Perl.

