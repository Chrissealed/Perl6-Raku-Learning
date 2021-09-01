#!/usr/bin/env perl6
#
# Hashes as Dispatch Tables
#
# You may need a procedure to launch some action depending on the value of a param‐
# eter received by the program. To do that, you could use a series of if {...} elsif
# {...} else {...} statements like this:
#
# sub run-stop { ... };
# sub run-start { ... };
# my $param = get-param;
# if $param eq "stop" {
#     run_stop;
# } elsif $param eq "start" {
#     run-start;
# } elsif $param = "h" {
#     say $help;
# } elsif $param = "help" {
#     say $help;
# } elsif $param = "v" {
#     $verbose = True;
# } else {
#     die "Unknown option $param";
# }
#
# This approach is boring and error-prone. Using a dispatch table is often a simpler sol‐
# ution.
#
# A dispatch table is a data structure mapping identifiers to code references or subrou‐
# tine objects. Applied to the above scenario, it could look like this:

sub MAIN(Str $string = 'other') {
    my $help = "You passed param help. Other params : stop, start, h, help, v.";
    my $verbose = False;
    sub run-stop { say "You passed param stop" };
    sub run-start { say "You passed param start" };
    my %dispatch = (
        stop => &run-stop,
        start => &run-start,
        h => { say $help; },
        help => { say $help; },
        v => { $verbose = True; say "You passed param verbose = True";},
        other => { say "Params : start, stop, h, help, v" },
    );
    sub get-param {
        return $string;
    }
    my $param = get-param();
    die "Unknown option $param! Pass h for more information." unless %dispatch{$param}:exists;
    %dispatch{$param}(); # execute the action specified in %dispatch
}


# The %dispatch hash defines the action depending on the parameter used as a key.
# The %dispatch{$param}() statement calls the required action.
# This approach is a bit more concise and slightly cleaner, but there are some other
# advantages. It is more maintainable: if you need to add one option, you just need to
# add one entry to the hash and don’t have to add code in the middle of a complicated
# chain of nested if {...} elsif {...} else {...} statements at the risk of break‐
# ing up something.
#
# Another upside is that the dispatch table can be dynamically modified at runtime, for
# example depending on certain external circumstances (for example the day in the
# month when the program is running) or in accordance with a configuration file. This
# means that it is possible to dynamically modify the behavior of a program after com‐
# pile time, while it is already running. This paves the way to some very interesting
# advanced programming techniques that are beyond the scope of this book.
# Note that we have been using hashes for our dispatch tables, and this is the most
# common way to implement them. If it makes sense to have small integers as keys, you
# could also implement a dispatch table as an array. This is the case, for example, with
# numbered menu items where the user is prompted to type a number to indicate
# which menu option to activate.

