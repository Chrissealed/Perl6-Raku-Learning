#!/usr/bin/env perl6
#
# Recursion
#
# It is legal for one function or subroutine to call another; it is also legal for a subrou‐
# tine to call itself. It may not be obvious why that is a good thing, but it turns out to be
# one of the most magical things a program can do. For example, look at the following
# subroutine:

sub countdown(Int $time-left) {
    if $time-left <= 0 {
        say 'Blastoff!';
    } else {
        say $time-left;
        countdown($time-left - 1);
    }
}

# If $n is 0 or negative, it outputs the word “Blastoff!” Otherwise, it outputs $time-
# left and then calls a subroutine named countdown —itself— passing $n-1 as an argu‐
# ment.
# What happens if we call the subroutine like this?

countdown(3);

# The execution of countdown begins with $time-left = 3, and since $time-left is
# greater than 0, it outputs the value 3, and then calls itself...
# The execution of countdown begins with $time-left = 2 , and since $time-left is
# greater than 0, it outputs the value 2, and then calls itself...
# The execution of countdown begins with $time-left = 1 , and since $time-
# left is greater than 0, it outputs the value 1, and then calls itself...
# The execution of countdown begins with $time-left = 0 , and
# since $time-left is not greater than 0, it outputs the word “Blast‐
# off!” and then returns.
# The countdown that got $time-left = 1 returns.
# The countdown that got $time-left = 2 returns.
# The countdown that got $time-left = 3 returns.
# And then you’re back in the main program. So, the total output looks like this:
# 3
# 2
# 1
# Blastoff!
#
# A subroutine that calls itself is recursive; the process of executing it is called recursion.
# As another example, we can write a subroutine that prints a string $n times:

sub print-n-times(Str $sentence, Int $n) {
    return if $n <= 0;
    say $sentence;
    print-n-times($sentence, $n - 1);
}

print-n-times("Hello World!", 3)

# If $n <= 0 , the return statement exits the subroutine. The flow of execution immedi‐
# ately returns to the caller, and the remaining lines of the subroutine don’t run. This
# illustrates a feature of the return subroutine that we have not seen before: it is used
# here for flow control, i.e., to stop the execution of the subroutine and pass control
# back to the caller. Note also that here the return statement does not return any value
# to the caller; print-n-times is a void function.
# The rest of the subroutine is similar to countdown : it displays $sentence and then
# calls itself to display $sentence $n − 1 additional times. So the number of lines of
# output is 1 + ($n - 1), which adds up to $n.
# For simple examples like this, it may seem easier to use a for loop. But we will see
# examples later that are hard to write with a for loop and easy to write with recursion,
# so it is good to start early.
#
# Stack Diagrams for Recursive Subroutines
#
# In “Stack Diagrams” on page 42, we used a stack diagram to represent the state of a
# program during a subroutine call. The same kind of diagram can help interpret a
# recursive subroutine.
# Every time a subroutine gets called, Perl creates a frame to contain the subroutine’s
# local variables and parameters. For a recursive subroutine, there might be more than
# one frame on the stack at the same time.
# Figure 4-1 shows a stack diagram for countdown called with n = 3 .
#
# Figure 4-1. Stack diagram
#
# As usual, the top of the stack is the frame for the main program. It is empty because
# we did not create any variables in it or pass any arguments to it.
# The four countdown frames have different values for the parameter $time-left. The
# bottom of the stack, where $time-left = 0, is called the base case. It does not make a
# recursive call, so there are no more frames.
#
# As an exercise, draw a stack diagram for print-n-times called with $sentence =
# 'Hello' and $n = 2. Then write a function called do-n-times that takes a function
# and a number, $num, as arguments, and that calls the given function $num times. Solu‐
# tion: see “Exercises of Chapter 4: Conditionals and Recursion” on page 350.
#
# Infinite Recursion
#
# If a recursion never reaches a base case, it goes on making recursive calls forever, and
# the program never terminates. This is known as infinite recursion, and it is generally
# not a good idea. In fact, your program will not actually execute forever but will die at
# some point when the computer runs out of memory or some other critical resource.
# You have to be careful when writing recursive subroutines. Make sure that you have a
# base case, and make sure that you are guaranteed to reach it. Actually, although this is
# not absolutely required by the language, I would advise you to make a habit of treat‐
# ing the base case first.


