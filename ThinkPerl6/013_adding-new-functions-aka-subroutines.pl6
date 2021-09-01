#!/usr/bin/env perl6
#
# Adding New Functions (a.k.a. Subroutines)
#
# So far, we have only been using the functions that come with Perl, but it is also possi‐
# ble to add new functions. In Perl, user-defined functions are often called subroutines,
# but you might choose either word for them.
# A function definition starts with the sub keyword (for subroutine) and specifies the
# name of a new subroutine and the sequence of statements that run when the function
# is called.
# Here is an example of a subroutine quoting Martin Luther King’s famous “I Have a
# Dream” speech at the Lincoln Memorial in Washington (1963):

sub print-speech() {
    say "Let freedom ring from the prodigious hilltops of New Hampshire.";
    say "Let freedom ring from the mighty mountains of New York.";
}
print-speech;

# sub is a keyword that indicates that this is a subroutine definition. The name of the
# function is print-speech. The rules for subroutine names are the same as for vari‐
# able names: letters, numbers, and underscores are legal, as well as a dash or an apos‐
# trophe between letters, but the first character must be a letter or an underscore. You
# shouldn’t use a language keyword (such as if or while ) as the name of a function (in
# some cases, it might actually work, but it would be very confusing, at least for the
# human reader).
# The empty parentheses after the name indicate that this function doesn’t take any
# arguments. They are optional in that case, but are required when parameters need to
# be defined for the subroutine.
# The first line of the subroutine definition is sometimes called the header; the rest is
# called the body. The body has to be a code block placed between curly braces and it
# can contain any number of statements. Although there is no requirement to do so, it
# is good practice (and highly recommended) to indent body statements by a few lead‐
# ing spaces, since it makes it easier to figure out visually where the function body
# starts and ends.
# Please note that you cannot use a method-invocation syntax for subroutines (such as
# print-speech ) that you write: you must call them with a function call syntax.
#
# The strings in the print statements are enclosed in double quotes. In this specific case,
# single quotes could have been used instead to do the same thing, but there are many
# cases where they wouldn’t do the same thing, so you’ll have to choose one or the other
# depending on the circumstances.
# Most people use double quotes in cases where a single quote (which is also an apos‐
# trophe) appears in the string:
# say "And so we've come here today to dramatize a shameful condition.";
# Conversely, you might use single quotes when double quotes appear in the string:
# say 'America has given the Negro people a bad check,
# a check which has come back marked "insufficient funds."';
# There is, however, a more important difference between single quotes and double
# quotes: double quotes allow variable interpolation, and single quotes don’t. Variable
# interpolation means that if a variable name appears within the double-quoted string,
# this variable name will be replaced by the variable value; within a single-quoted
# string, the variable name will appear verbatim. For example:

my $var = 42;
say "His age is $var."; # -> His age is 42.
say 'Her age is $var.'; # -> Her age is $var.

# The reason is not that the lady’s age should be kept secret. In the first string, $var is
# simply replaced within the string by its value, 42, because the string is quoted with
# double quotes; in the second one, it isn’t because single quotes are meant to provide a
# more verbatim type of quoting mechanism. There are other quoting constructs offer‐
# ing finer control over the way variables and special characters are displayed in the
# output, but simple and double quotes are the most useful ones.
# The syntax for calling the new subroutine is the same as for built-in functions:
# > print-speech();
# Let freedom ring from the prodigious hilltops of New Hampshire.
# Let freedom ring from the mighty mountains of New York.
# However, you cannot use the method-invocation syntax with such subroutines. We
# will see much later in this book (Chapter 12) how to create methods. For the time
# being, we’ll stick to the function-call syntax.
# Once you have defined a subroutine, you can use it inside another subroutine. For
# example, to repeat the previous excerpts of King’s address, we could write a subrou‐
# tine called repeat-speech :

sub repeat-speech() {
    print-speech();
    print-speech();
}

# And then call repeat-speech :

repeat-speech();
# Let freedom ring from the prodigious hilltops of New Hampshire.
# Let freedom ring from the mighty mountains of New York.
# Let freedom ring from the prodigious hilltops of New Hampshire.
# Let freedom ring from the mighty mountains of New York.

# But that’s not really how the speech goes.

# Definitions and Uses
#
# Pulling together the code fragments from the previous section, the whole program
# looks like this:
#
# sub print-speech () {
#     say "let freedom ring from the prodigious hilltops of New Hampshire.";
#     say "Let freedom ring from the mighty mountains of New York.";
# }
# sub repeat-speech () {
#     print-speech();
#     print-speech();
# }
# repeat-speech();
#
# This program contains two subroutine definitions: print-speech and repeat-
# speech . Function definitions get executed just like other statements, but the effect is
# to create the function. The statements inside the function do not run until the func‐
# tion is called, and the function definition generates no output.
# You don’t have to create a subroutine before you can run it; the function definition
# may come after its call:
#
# repeat-speech;
# sub repeat-speech() {
#     print-speech;
#     print-speech;
# }
# sub print-speech() {
#     # ...
# }

