#!/usr/bin/env perl6
#
# Method Delegation
#
# Delegation is another way to link an object to another piece of code. The delegation
# technique has been relatively well studied at the theoretical level and implemented in
# a few specialized research languages, but mainstream generalist languages imple‐
# menting delegation are rather rare.
#
# Rather than defining methods in a class or in a role, the idea is to invoke methods
# belonging to another object, as if they were methods of the current class. In Perl 6,
# delegation may be performed at the level of a class or a role. A delegated object is sim‐
# ply an attribute defined in the class or in the role with the handles keyword, which
# makes it possible to specify which methods of the delegated object may be used in the
# current class:

class BaseClass {
    method Don-Quijote() {
        "Cervantes"
    }
    method Hamlet() {
        "Shakespeare"
    }
    method Three-Sisters () {
        "Chekhov"
    }
    method Don-Carlos() {
        "Schiller"
    }
}

say 'A:';
class Uses {
    has $.base is rw handles < Don-Quijote Hamlet Three-Sisters >;
}

my $user = Uses.new;
$user.base = BaseClass.new(); # implementing an object-handler
say $user.Don-Quijote;
say $user.Hamlet;
say $user.Three-Sisters;
# say $user.Don-Carlos;

# This displays the following output:
#
# Cervantes
# Shakespeare
# Chekhov
# Method 'Don-Carlos' not found for invocant of class 'Uses'
# in block <unit> at delegate.pl6 line 16
#
# The program properly displays the names of writers returned by the first three meth‐
# ods, because they have been sort of “imported” into the Uses class, but it fails on the
# last one, because “Don-Carlos” is not part of the handler’s list. The error on the last
# method is a runtime exception and the program would stop running even if there
# were some more correct code afterward.
#
# Note that the Uses class does not know from where the methods will be imported; it
# only knows about the names of the methods that will be imported. It is only when the
# $user object is created and the $user.base attribute is added to it that the object is
# dynamically associated with the methods defined in BaseClass. By the way, this pro‐
# cess could be done in just one step:

say 'B:';
# There is no need to enumerate the methods to be handled. The Uses class can import
# all the methods of BaseClass :

class Uses2 {
    has $.base is rw handles BaseClass;
}

$user = Uses2.new( base => BaseClass.new() );
say $user.Don-Quijote;
say $user.Hamlet;
say $user.Three-Sisters;
say $user.Don-Carlos;

# This will work as before, except of course that it will not fail on the Don-Carlos
# method this time, since this method is also imported now:
#
# Cervantes
# Shakespeare
# Chekhov
# Schiller

