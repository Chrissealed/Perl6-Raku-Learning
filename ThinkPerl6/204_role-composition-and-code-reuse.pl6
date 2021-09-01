#!/usr/bin/env perl6
#
# Role Composition and Code Reuse
#
# Classes are meant for managing instances and roles are meant for managing behav‐
# iors and code reuse. The following example shows how classes and roles can play
# together:

role Drawable {
    has $.color is rw;
    method draw { ... }
}

class Figure {
    method area { ... }
}

class Rectangle is Figure does Drawable {
    has $.width;
    has $.height;
    method area {
        $!width * $!height;
    }
    method draw() {
        for 1..$.height {
            say 'x' x $.width;
        }
    }
}

Rectangle.new(width => 10, height => 4).draw;

# Please note that the ellipsis ... used in the code above is meant here to represent
# some code that is left to your implementation. However, this is actually valid code
# and it will compile and even run without any problem. The ellipsis is used to repre‐
# sent functionality that is not yet there but is supposed to be implemented at a later
# point. This will work as long as you don’t invoke these methods (you would get a run‐
# time error) or set up a situation where they would need to be defined (which would
# cause a compile-time error). In the case of the draw method in the Drawable role, role
# composition into the Rectangle class works only because draw is redefined in the
# Rectangle class; without this redefinition, it would have raised a compile-time error.
#
# Similarly, the method area { ... } code of the Figure class would raise a runtime
# error if it were called without having been redefined in the Rectangle class. The ellip‐
# sis has been used here only as a convenient way to represent code whose implementa‐
# tion is not important for our example because it is being redefined anyway. In real
# coding, it is probably best advised not to use the ellipsis, except as a temporary expe‐
# dient for code that is not yet developed but will be implemented.
#
# The code example above draws an ASCII rectangle:
#
# ~ perl6 test_drawable.pl6
# xxxxxxxxxx
# xxxxxxxxxx
# xxxxxxxxxx
# xxxxxxxxxx

