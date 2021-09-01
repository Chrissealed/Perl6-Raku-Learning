#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# En Perl 6, la boucle la plus commune est la boucle for, qui itère sur une liste de valeurs ou les éléments d'un tableau
# et dont la syntaxe la plus commune est la suivante :

say 'A:';
my @tableau = [0..10];
for @tableau -> $val { print $val * 2, " " };

# Cette construction s'appelle un « bloc pointu ». Ici, la variable $val est un alias en lecture seule sur les valeurs
# successives du tableau ; elle n'a pas besoin d'être prédéclarée et sa portée est naturellement limitée au bloc
# d'instructions de la boucle for. Le lecteur féru de programmation fonctionnelle aura peut-être reconnu dans cette
# construction de « bloc pointu » à la fois une lambda et une fermeture anonyme.
# La boucle for ci-dessus itère directement sur les éléments du tableau, ce qui correspond au besoin le plus fréquent.
# Si l'on a besoin d'itérer sur les indices, il suffit de créer à la volée une liste des indices à l'aide de l'opérateur intervalle
# .. et de la fonction ou méthode end (retournant l'indice du dernier élément d'un tableau) et d'itérer sur cette liste :

say "";
say 'B:';
my @mois = <none jan fév mar avr mai jun>;
for 1..end @mois -> $num { say "$num \t @mois[$num]" };
# ou: for 1..@mois.end -> ...
#
# On peut également utiliser les itérateurs de listes du langage, par exemple keys pour récupérer la liste d'indices :

say 'C:';
my @nombres = <zéro un deux trois quatre cinq>;
for @nombres.keys -> $indice { say "$indice \t @nombres[$indice]" };

# ou kv pour récupérer à la fois les indices et les éléments correspondants :

for @nombres.kv -> $indice, $nombre { say "$indice \t $nombre" };

# Si l'on a besoin de modifier les valeurs du tableau, il faut un alias en lecture et écriture, ce qui se fait à l'aide d'un
# bloc « doublement pointu » :

say 'D:';
for @tableau <-> $val { $val *= 3 };
say @tableau;

# Une syntaxe d'expression modifiée est également possible :

print $_ * 2, " " for [0..10];

# Une boucle for est un itérateur et peut donc travailler de façon « paresseuse » (c'est-à-dire qu'elle ne traite les
# éléments qu'au fur et à mesure des besoins), même sur une liste « infinie ». Employer une boucle for est donc une
# façon idiomatique et performante d'itérer sur les lignes d'un fichier :

say "";
say 'E:';
for "fichier.txt".IO.lines -> $ligne {
    say $ligne unless $ligne ~~ /^'#'/
}

# La boucle while ressemble à celle des autres langages communs et exécute la boucle tant que la condition est vraie,
# si ce n'est que les parenthèses ne sont pas nécessaires autour de la condition :

say 'F:';
my $var = 0;
while $var < 5 { print 3 * ++$var, " "; }

# Une boucle until exécute le bloc de la boucle tant que la condition est fausse. Voici un exemple utilisant une syntaxe
# d'instruction modifiée :

say "";
say 'G:';
my $x = 0;
print $x++ until $x > 5; # 012345

# Vous pouvez enfin utiliser une boucle loop, qui correspond à la boucle for du langage C et des langages apparentés :

say "";
say 'H:';
loop (my $i=0; $i < 5; $i++) {
    say "Le nombre actuel est : $i"
}

# Cette syntaxe permet de construire des boucles complexes, mais il est rare d'avoir besoin de ce genre de boucle
# en Perl 6 : la boucle for de Perl 6 est généralement bien plus pratique. C'est la seule construction de boucle pour
# laquelle les parenthèses restent nécessaires autour des conditions/initialisations. Sa seule utilisation fréquente est
# la façon idiomatique d'écrire une boucle infinie :

#loop { ... }
#
# Les instructions next et last permettent, respectivement, de recommencer à l'itération suivante et de sortir
# immédiatement d'une boucle for, while ou autre :

say 'I:';
for 1..20 -> $i {
    next if 3 < $i <= 7;
    last if $i == 10;
    print "$i "; # 1 2 3 8 9
}
say ""

