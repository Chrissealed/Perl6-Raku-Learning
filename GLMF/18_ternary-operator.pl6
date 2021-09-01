#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# L'opérateur ternaire, issu du langage C, utilise ?? et !! :

my ($x, $y) = (1, 2);
say "Max = ", $x > $y ?? $x !! $y;

# On peut enchaîner plusieurs de ces opérateurs :

my Int $âge = 18;
say $âge <= 2 ?? "Bébé"
    !! $âge <= 12 ?? "Enfant"
    !! $âge < 18 ?? "Ado"
    !! $âge == 18 ?? "Jeune adulte"
    !! "Adulte";

