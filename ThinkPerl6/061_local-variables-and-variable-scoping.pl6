#!/usr/bin/env perl6
#
# Local Variables and Variable Scoping
#
# We have seen in “Variables and Parameters Are Local” on page 41 that variables cre‐
# ated within a subroutine (with the my keyword) are local to that subroutine. The my
# keyword if often called a declarator, because it is used for declaring a new variable (or
# other identifier). It is by far the most common declarator. Other declarators include
# our or state, briefly described later in this chapter.
# Similarly, subroutine parameters are also usually local to the subroutine in the signa‐
# ture of which they are declared.
# We briefly mentioned that the term lexically scoped is probably more accurate than
# local, but it was too early at that point to really explain what this means.
# Declaring a variable with my gives it lexical scope. This means it only exists within the
# current block. Loosely speaking, a block is a piece of Perl code within curly brackets
# or braces. For example, the body of a subroutine and the code of a while or for loop
# or of an if conditional statement are code blocks. Any variable created with the my
# declarator exists and is available for use only between the place where it is declared
# and the end of the enclosing code block.
# For example, this code:

say 'A:';
my $condition = True;
if $condition eq True {
    my $foo = "bar";
    say $foo; # prints "bar"
}
# say $foo;
#
# # ERROR: "Variable '$foo' is not declared ..."
# will fail on the second print statement, because the say function call is not in the lexi‐
# cal scope of the $foo variable, which ends with the closing brace of the condition
# block. If we want this variable to be accessible after the end of the condition, then we
# would need to declare it before the if statement. For example:

my $foo;
if $condition eq True {
    $foo = "bar";
    say $foo; # prints "bar"
} else {
    $foo = "baz";
}
say $foo;

# # prints "bar" or "baz" depending on $condition
# If a lexical variable is not declared within a block, its scope will extend until the end
# of the file (this is sometimes called a static or a global variable, although these terms
# are somewhat inaccurate). For example, in the last code snippet above, the scope of
# the $foo variable will extend until the end of the file, which may or may not be a good
# thing, depending on how you intend to use it. It is often better to reduce the scope of
# variables as much as possible, because this helps reduce dependencies between vari‐
# ous parts of the code and limits the risk of subtle bugs. In the code above, if we want
# to limit the scope of $foo , we could add braces to create an enclosing block for the
# sole purpose of limiting the scope:

{
    my $foo;
    if $condition eq True {
        $foo = "bar";
        say $foo; # prints "bar"
    } else {
        $foo = "baz";
    }
    say $foo; # prints "bar" or "baz" depending on $condition
}

# Now, the outer braces create an enclosing block limiting the scope of $foo to where
# we need it. This may seem to be a somewhat contrived example, but it is not uncom‐
# mon to add braces only for the purpose of precisely defining the scope of something.
# Lexical scoping also means that variables with the same names can be temporarily
# redefined in a new scope:

say 'B:';
my $location = "outside";

sub outer {
    say $location;
}

sub inner {
    my $location = "inside";
    say $location;
}

say $location; # -> outside

outer(); # -> outside

inner(); # -> inside

say $location; # -> outside

# We have in effect two variables with the same name, $location, but different scopes.
# One is valid only within the inner subroutine where it has been redefined, and the
# other anywhere else.
# If we add a new subroutine:

sub nowhere {
    my $location = "nowhere";
    outer();
}
nowhere(); # -> outside

# this will still print “outside,” because the outer subroutine knows about the “outside”
# version of the $location variable, which existed when outer was defined. In other
# words, the outer code that referenced to the outer variable (“outside”) knows about
# the variable that existed when it was created, but not about the variable existing
# where it was called. This is how lexical variables work. This behavior is the basis for
# building closures, a form of subroutine with some special properties that we will study
# later in this book, but is in fact implicitly present everywhere in Perl 6.
# While having different variables with the same name can give you a lot of expressive
# power, we would advise you to avoid creating different variables with the same name
# and different scopes, at least until you really understand these concepts well enough
# to know what you are doing, as this can be quite tricky.
# By far, most variables used in Perl are lexical variables, declared with the my declara‐
# tor. Although they are not declared with my, parameters declared in the signature of
# subroutines and parameters of pointy blocks also have a lexical scope limited to the
# body of the subroutine or the pointy block.
#
# There are other declarators, such as our, which creates a package-scoped variable,
# and state, which creates a lexically scoped variable but with a persistent value. They
# are relatively rarely used.
#
# One last point: although they are usually not declared with a my declarator, subrou‐
# tines themselves also have by default a lexical scope. If they are defined within a
# block, they will be seen only within that block. An example of this has been given at
# the end of the solution to the GCD exercise of the previous chapter (see “Exercise 5-5:
# Finding the GCD of Two Numbers” on page 360). That being said, you can declare a
# subroutine with a my declarator if you wish:
# my sub frobnicate {
# # ...
# }
# This technique might add some consistency or some form of self-documenting fea‐
# ture, but you won’t buy very much added functionality with that.

