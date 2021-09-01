#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Les opérateurs de Perl 6 sont en fait des fonctions ou des méthodes ayant souvent un nom un peu inhabituel et
# définissant quelques propriétés permettant de les utiliser : un opérateur est généralement doté d'une précédence
# (priorité d'exécution), d'un type de notation syntaxique (préfixée, postfixée, infixée, etc.) et d'une associativité
# (comment il se comporte quand il y a plusieurs opérateurs de même précédence). Pour créer un nouvel opérateur,
# il faut au minimum définir son type de notation, et, selon le besoin, éventuellement préciser sa précédence et son
# associativité.
# Nous pourrions par exemple utiliser le symbole euro « € » pour définir un opérateur de doublement d'un entier :

say 'A:';
sub postfix:<€> (Int $n) { 2*$n }
say 21€; # -> 42

# Ce nouvel opérateur n'est sans doute pas très utile (et son nom n'est pas idéalement choisi pour ce qu'il fait), mais
# illustre simplement comment il est possible d'enrichir dynamiquement le langage.
# À titre d'exemple d'un nom d'opérateur peut-être mieux choisi, utilisons le petit « 2 » en indice du clavier pour définir
# un opérateur d'élévation au carré :

sub postfix:<²>(Numeric $n) { $n**2 }
say 5²; # -> 25
say (3 + 4)²; # -> 49

# Perl 6 supportant très bien les caractères Unicode, il est possible d'utiliser les symboles mathématiques (par exemple
# le symbole racine carrée), les lettres grecques, tibétaines ou d'autres langues, les guillemets japonais ##, les
# pictogrammes normalisés, les caractères braille, etc. pour définir des opérateurs.
# Un opérateur n'est pas nécessairement un caractère spécial unique, nous pourrions (ou du moins aurions pu, il y
# a quelques années, ce n'est plus très utile aujourd'hui) définir des opérateurs de conversion de francs en euros et
# réciproquement :

say 'B:';
sub prefix:<f€> (Numeric $n) {$n/6.55957}
sub prefix:<€f> (Numeric $n) {$n*6.55957}
say f€ 6.56; # -> 1.0000656
say €f 10; # -> 65.5957

# Définir un opérateur infixé ne pose pas plus de problèmes. Par exemple, voici un opérateur de calcul de la moyenne
# entre deux nombres :

say 'C:';
sub infix:<moy> (Numeric $n, Numeric $m) { ($n+$m)/2 }
say 10 moy 5; # -> 7.5

# L'opérateur « ! » de négation booléenne est de type préfixé, c'est-à-dire qu'il se place avant le terme auquel il
# s'applique. Nous pouvons réutiliser le même opérateur « ! » pour définir la factorielle, qui utilisera naturellement,
# comme en mathématiques, une notation postfixée :

say 'D:';
sub postfix:<!> (Int $n) {
    [*] 2..$n
}
say 20!;
say ! False; # La négation booléenne fonctionne toujours

# Voici enfin un exemple dans lequel nous définissons aussi la précédence de l'opérateur. Il existe en Perl 6 un type
# Pair qui définit une paire clef-valeur et se note généralement clef => valeur. Nous pourrions vouloir utiliser ce type
# pour modéliser des couples de valeurs que nous désirons pouvoir additionner membre à membre. Il suffit de définir
# l'addition de paires et, tant qu'à faire, lui donner la même propriété de précédence que l'addition arithmétique :

say 'E:';
multi sub infix:<+> (Pair $x, Pair $y) is equiv(&infix:<+>) {
    return $x.key + $y.key => $x.value + $y.value
}
my $a = 4=>3;
my $b = 7=>2;
say $a + $b; # -> 11 => 5

# Le « trait » is equiv(&infix:<+>) précise que cet opérateur a la même précédence que l'opérateur d'addition. Si nous
# définissons une multiplication membre à membre sur le même modèle en lui donnant la même précédence que la
# multiplication, nous retrouverons les règles de précédence habituelles entre nos opérations sur les paires.
# La création de nouveaux opérateurs est un moyen simple d'enrichir dynamiquement le langage. Pour des
# enrichissements plus complexes, il est possible de modifier dynamiquement la grammaire même de Perl 6, mais cela
# nécessiterait de présenter les grammaires de Perl et sortirait du cadre de cette brève présentation.

