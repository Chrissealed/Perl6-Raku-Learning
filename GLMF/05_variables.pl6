#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Il existe trois principales sortes de variables, qui se distinguent par le sigil précédant l'identifiant proprement dit :
# - le sigil « $ » indique une variable scalaire, c'est-à-dire une variable ne contenant qu'une seule valeur (par exemple
# une valeur numérique, une chaîne de caractères, un objet ou une référence vers une autre entité) ;
# - le sigil « @ » désigne une variable de tableau, c'est-à-dire une liste de valeurs indexées par des entiers ;
# - le sigil « % » dénote une table de hachage, qui est définie comme un ensemble de paires clef-valeur.
# On accède aux éléments d'un tableau avec l'opérateur [...] et à ceux d'un hachage avec {...}. Contrairement à Perl 5,
# une variable de tableau ou de hachage conserve son sigil d'origine quand on accède à ses éléments individuels :

my @tableau = 1, 2, 4, 6;
say @tableau;
say @tableau[2];
my %hachage = jan => 1, fév => 2, mar => 3;
say %hachage;
say %hachage{"fév"};

