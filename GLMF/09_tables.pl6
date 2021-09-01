#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Les tableaux sont des listes contenant des valeurs multiples. Les valeurs n'ont pas besoin d'être du même type (on
# peut par exemple mélanger des chaînes et des nombres), mais c'est souvent une bonne idée qu'elles le soient dans
# la mesure où les éléments d'un tableau doivent en principe avoir une certaine cohérence sémantique. On accède
# aux valeurs individuelles d'un tableau à l'aide d'indices qui sont des nombres entiers, le premier élément d'un tableau
# portant l'indice 0.

say 'A:';
my @nombre_shadoks = ['GA', 'BU', 'ZO', 'MEU'];
say @nombre_shadoks;
say @nombre_shadoks[1];  # Imprime: BU

# Si les éléments d'un tableau sont des chaînes de caractères sans espace, on peut utiliser un opérateur de citation
# de liste <...> pour écrire plus simplement, sans guillemets, apostrophes, ni virgules :

say 'B:';
say @nombre_shadoks = <GA BU ZO MEU>;
say @nombre_shadoks.elems; # Nombre d'éléments : 4
my $dernier = pop @nombre_shadoks;
say $dernier;
say @nombre_shadoks;
say elems @nombre_shadoks; # Nombre d'éléments : 3
say "Les shadoks ont perdu leur dernier chiffre: $dernier";
push @nombre_shadoks, $dernier;
say @nombre_shadoks;

# La fonction pop retire le dernier élément du tableau et le renvoie ; la fonction push ajoute un (ou plusieurs) élément(s)
# à la fin d'un tableau. On aurait aussi pu utiliser une syntaxe de méthode :

say 'C:';
my $der = @nombre_shadoks.pop;  # MEU
say @nombre_shadoks;            # [GA BU ZO]
@nombre_shadoks.push($dernier);# [GA BU ZO MEU]

# La fonction splice(a, n) retire n élément(s) d'un tableau à partir de la position a et les renvoie :
my @elem_1_2 = splice @nombre_shadoks, 1, 2;  # BU ZO

# Mais si l'on désire récupérer collectivement plusieurs éléments d'un tableau sans modifier le tableau, on peut utiliser
# une syntaxe de tranches de tableaux :

say @nombre_shadoks[0..2]; # (GA BU ZO)

# Il existe de nombreuses autres fonctions ou méthodes utilisables, fournies notamment par les classes internes Array
# et List de Perl.
# Les tableaux peuvent être multidimensionnels. On peut accéder aux éléments d'un tableau multidimensionnel en
# séparant les indices par un « ; » :

say 'D:';
my @employees;
@employees[0;0] = "Liz";
@employees[0;1] = 3000;
@employees[1] = ["Bob"; 2500];
@employees[2] = ["Jack"; 2000];
@employees[3] = ["Betty"; 1800];
my $prem-rang_deux-col = @employees[0;1];
say $prem-rang_deux-col; # 3000
say @employees[1;1];  # 2500
say @employees[2];    # [Jack 2000]
say @employees;       # [[Liz 3000] [Bob 2500] [Jack 2000] [Betty 1800]]

