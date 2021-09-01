#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Un hachage est un ensemble de paires clef-valeur. L'idée générale est la même que celle des dictionnaires ou maps
# dans d'autres langages.

my %capitales = ("Italie", "Rome", "Allemagne", "Berlin", "Espagne" , "Madrid");
say %capitales;

# On peut rendre le code plus concis avec une syntaxe de liste :

my %capitalesb = <Italie Rome Allemagne Berlin Espagne Madrid>;
say %capitalesb;

# et plus clair en utilisant l'opérateur de construction de paires => dès l'initialisation :

my %capitalesc = (Italie => "Rome", Allemagne => "Berlin", Espagne => "Madrid");

# L'opérateur => a essentiellement le même rôle qu'une virgule, mais elle rend l'intention plus claire et dispense de
# mettre la clef entre guillemets.
# On peut ajouter un nouvel élément au hachage par une affectation avec une nouvelle clef :
%capitales{"France"} = "Paris";
# Ou :
%capitalesb<France> = "Paris";

# La méthode push permet également d'ajouter une nouvelle paire au hachage :

push %capitales, (Danemark => "Copenhague");
say %capitales;
%capitales.push: (USA => "Washington");
say %capitales;
say %capitales.elems;   # 6 (nombre de paires)

# Les méthodes kv, keys et values renvoient respectivement des listes de paires, de clefs et de valeurs :

say %capitales.kv;
say %capitales.keys;
say %capitales.values;

# Notons qu'un hachage stocke et restitue les paires dans un ordre apparemment aléatoire (indépendant de celui dans
# lequel elles ont été créées), mais les trois méthodes renvoient les éléments dans un ordre consistant.

