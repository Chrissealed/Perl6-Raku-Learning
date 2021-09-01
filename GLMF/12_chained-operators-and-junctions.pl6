#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Les opérateurs de comparaison logique peuvent être chaînés comme en arithmétique, ce qui peut simplifier
# notablement l'écriture :

my ($u, $v, $x, $y, $z);
$u = 1;
$v = 2;
$x = 3;
$y = 4;
$z = 5;
say "Valeurs dans l'ordre" if $u < $v < $x < $y < $z;
# Equivaut à : ... if $u < $v and $v < $x and $x < $y ...
# ou à : ... if ($u < $v) and ($v < $x) and ...

# De même, les jonctions permettent d'écrire des comparaisons concises de ce style :

my $val = 7;
say "Trouvé" if $val == 4|6|9|7|15; # -> Trouvé
# Peut aussi s'écrire :
say "Trouvé" if $val == any <4 6 9 7 15>;
# équivaut à : ... if ($val == 4) or ($val == 6) or ...

