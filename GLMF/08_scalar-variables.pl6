#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Les variables scalaires, introduites par le sigil $, ne contiennent qu'un seul élément (mais cet élément peut lui-même
# être composite, par exemple si c'est un objet comme nous venons de le voir dans les exemples ci-dessus). Les
# variables scalaires contiennent souvent des chaînes de caractères ou des nombres.
#
# Les chaînes de caractères sont des séquences immuables de caractères quelconques. Elles sont généralement
# encadrées par des guillemets ou des apostrophes. La différence est que les variables (et les séquences
# d'échappement) sont interpolées dans une chaîne de caractères entre guillemets, mais pas dans celles entre
# apostrophes.

say 'A:';
my $user = 'Laurent';
say "Bonjour, $user !";    # Bonjour Laurent !
say 'Bonjour, $user !';    # Bonjour $user !

# Le tilde « ~ » est l'opérateur de concaténation de chaînes :

say "Hello" ~ " World !";   # Hello World !

# Il existe de nombreuses fonctions ou méthodes travaillant sur des chaînes :

say 'B:';
my $nom = "Charlie";
say flip $nom;    # eilrahC (syntaxe fonctionnelle)
say $nom.flip;    # eilrahC (syntaxe de méthode)
say uc $nom;      # CHARLIE
say $nom.uc;      # Idem
say $nom.chars;   # 7 (nombre de caractères)
say substr $nom, 2, 3;  # arl (sous-chaîne)
say "Je suis " ~ $nom;  # Je suis Charlie (concaténation)

# On remarque que les sous-routines internes de Perl 6 admettent pour la plupart une syntaxe de fonction et une
# syntaxe de méthode. Il est possible de les combiner à volonté, notamment pour clarifier l'intention ou la précédence :

say flip "Charlie".substr(2, 3).uc;  # LRA

# Nous avons déjà vu des exemples de données numériques de types Int (entier) ou Rat (rationnel). La racine carrée
# de 2, le logarithme de 5 ou 10**17 sont de type Num :

say 'C:';
say 2.sqrt.WHAT; # (Num)
say 5.log.WHAT;  # (Num)
say 1e17.WHAT;   # (Num)

# De nombreuses fonctions ou méthodes permettent de travailler sur les données numériques ou seulement sur
# certains types numériques :

say 19.is-prime;  # True (19 est premier)
say 4.7.nude;     # (47 10), c'est-à-dire 47/10

# Cela n'est pas spécifique aux variables numériques, mais notons au passage qu'il est possible de définir
# dynamiquement des « sous-types » ou sous-ensembles de types existants. On peut par exemple créer un type
# nombre impair :

say 'D:';
subset Impair of Int where { $_ % 2 }; # Non divisible par 2
# Impair est maintenant un sous-type
my Impair $x = 3;  # OK
say $x;
#my Immpair $y = 2;  # Erreur de type

