#!/usr/bin/env perl6
#
# Exercise 7-2.
# The <[a..z]> character class matches any lowercase character (only plain ASCII low‐
# ercase characters, not Unicode characters). The following subroutine:
# sub is-lower (Str $input) {
# return so $char ~~ /^<[a..z]>$/
# }
# should return True if its argument is an ASCII lowercase letter and False otherwise.
# Test that it works as expected (and amend it if needed). The so function coerces the
# result of the regex match into a Boolean value.
# The following subroutines use the is-lower subroutine and are all intended to check
# whether a string contains any lowercase letters, but at least some of them are wrong.
# Analyze each subroutine by hand, determine whether it is correct, and describe what
# it actually does (assuming that the parameter is a string). Then test them with various
# input strings to check whether your analysis was correct.
# # ATTENTION: some of the subroutines below are wrong
# sub any_lowercase1(Str $string){
# for $string.comb -> $char {
# if is-lower $char {
# return True;
# } else {
# return False;
# }
# }
# }
# sub any_lowercase2(Str $string){
# for $string.comb -> $char {
# if is-lower "char" {
# return True;
# } else {
# return False;
# }
# }
# }
# sub any_lowercase3(Str $string){
# my $flag;
# for $string.comb -> $char {
# $flag = is-lower $char;
# }
# return $flag;
# }
# sub any_lowercase4(Str $string){
# my $flag = False;
# for $string.comb -> $char {
# $flag = $flag or is-lower $char;
# }
# return $flag;
# }
# sub any_lowercase5(Str $string){
# my $flag = False;
# for $string.comb -> $char {
# if is-lower $char {
# $flag = True;
# }
# }
# return $flag;
# }
# sub any_lowercase6(Str $string){
# for $string.comb -> $char {
# if is-lower $char {
# return 'True';
# }
# }
# return 'False';
# }
# sub any_lowercase7(Str $string){
# for $string.comb -> $char {
# return True if is-lower $char;
# }
# return False;
# }
# sub any_lowercase8(Str $string){
# for $string.comb -> $char {
# return False unless is-lower $char;
# }
# return True;
# }
# sub any_lowercase9(Str $string){
# for $string.comb -> $char {
# if not is-lower $char {
# return False;
# }
# return True;
# }
# }
# Solution: “Exercise 7-2: Lowercase Letters” on page 373.

