#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Les fonctions permettent de regrouper un ensemble de fonctionnalités. On déclare une fonction à l'aide du mot-clef
# sub (pour subroutine) suivi de son identifiant (son nom), et l'on définit ce qu'elle fait dans un bloc de code placé
# entre accolades.

say 'A:';
saluer();
sub saluer {
    say 'Bonjour tout le monde.';
}

# Contrairement à certains langages, la fonction peut être appelée avant sa définition. L'instruction saluer(); est l'appel
# de la fonction. C'est lors de l'exécution de cette ligne de code que la fonction s'exécute.
# 6-1 - Arguments et signatures
# La fonction ci-dessus ne prend pas de paramètres en entrée et ne renvoie pas de valeurs de retour, ce qui limite
# quelque peu son utilité. La plupart des fonctions utiles ont besoin de données en entrée, qui leur sont fournies sous
# la forme d'arguments. Voici une fonction analogue avec le passage d'un argument :

salue("Maître");
sub salut ($titre) {
    say "Bonjour $titre.";
}

# 6-1-1 - Nombre d'arguments d'une fonction
# Ici, l'appel de la fonction se fait avec un argument, la chaîne "Maître". La définition de la fonction contient maintenant
# une signature placée entre parenthèses ; cette signature définit la variable $titre comme le paramètre (formel) que
# reçoit la fonction. Dans cet exemple, le paramètre $titre prend la valeur de l'argument d'appel, "Maître", et est utilisé
# ensuite dans le corps de la fonction. Cette signature est réduite à sa plus simple expression, mais elle a déjà pour effet
# d'obliger le code utilisateur à passer un argument (et un seul) lors de l'appel à la fonction. Si le nombre d'arguments
# est différent de un, cela génère une erreur.
# Par défaut, les paramètres des fonctions sont des copies en lecture seule des arguments reçus (c'est une forme de
# passage de paramètre par valeur) et ne peuvent donc pas être modifiés dans la fonction. Mais on peut changer ce
# comportement grâce à des traits (propriétés définies à la compilation) tels que is rw (lecture écriture, comme lors d'un
# passage de paramètres par référence) ou is copy (copie locale à la fonction et modifiable) :

say 'B:';
my Int $valeur = 5;
ajoute-deux($valeur);
say $valeur; # -> 7
sub ajoute-deux (Int $x is rw) { $x += 2 }

# 6-1-2 - Type des arguments
# La signature permet non seulement de vérifier le nombre d'arguments, mais aussi leur type. Voici un exemple de
# fonction ayant une signature un peu plus complexe :

say 'C:';
sub multiplie (Int $x, Int $y) {
    say "Produit = ", $x * $y;
}
multiplie(3, 4); # -> 12

# 6-1-3 - Paramètres positionnels
# Ici, la signature comporte deux paramètres, $x et $y. Ce sont des paramètres positionnels : le paramètre $x reçoit
# la valeur du premier argument passé à la fonction et le paramètre $y reçoit le second argument. En outre, ces deux
# paramètres sont de type entier. Le compilateur vérifiera donc que la fonction est bien appelée avec deux arguments
# de type entier, sinon il émettra une erreur. À noter que si la fonction est comme ici déclarée avant son appel, il est
# possible d'appeler la fonction en omettant les parenthèses autour des arguments :

multiplie 3, 4;

# Cette fonction ne peut multiplier que des entiers, ce qui en limite l'utilité. Il est bien sûr possible de définir des
# signatures sur des types numériques quelconques, par exemple en utilisant le type générique Numeric.
# 6-1-4 - Paramètres nommés
# Il peut être difficile de se souvenir de l'ordre des paramètres positionnels, surtout quand la fonction accepte de
# nombreux arguments. Il est dans ce cas possible d'utiliser des paramètres nommés rendant l'ordre des arguments
# indifférents, avec la syntaxe suivante :

say 'D:';
sub divise (Numeric :$dividende, Numeric :$diviseur) {
    say $dividende/$diviseur
}
divise(dividende => 12, diviseur => 4); # -> 3
divise diviseur => 4, dividende => 1; # Idem

# Le second exemple d'appel de la fonction divise ci-dessus montre que les parenthèses sont ici encore optionnelles
# si la fonction a été déclarée avec sa signature avant son appel.
# 6-2 - Fonctions multiples
# Il est possible de définir avec le mot-clef multi des fonctions spéciales ayant le même nom, mais se distinguant par
# leur signature (nombre et type des arguments). Perl détermine quel exemplaire de la fonction appeler en fonction de
# la signature (processus analogue à la résolution des méthodes en programmation orientée objet).

say 'E:';
multi salue ($nom) { say "Bonjour $nom"}
multi salue ($nom, $titre) { say "Bonjour $titre $nom" }
salue("George Lucas");
salue "Yoda", "Maître";

# Ici, c'est le nombre d'arguments de la fonction qui permet à Perl 6 de déterminer quelle version de salue appeler. La
# distinction pourrait aussi se faire sur le type (voire le « sous-type »).
# Beaucoup des opérateurs et des fonctions ou méthodes internes de Perl 6 sont définis comme des fonctions multiples.
# Cela signifie qu'en utilisant une signature n'existant pas en interne, il est possible de redéfinir ou surcharger ces
# fonctions ou opérateurs.

# 6-3 - Valeurs de retour
# Toutes nos fonctions jusqu'ici se contentaient d'afficher quelque chose à l'écran. Très souvent, il est souhaitable
# qu'une fonction se contente de prendre des paramètres en entrée et de renvoyer des valeurs de retour, sans avoir
# d'effet de bord. Cela facilite la conception et la mise au point de programmes.
# Voici la définition et l'utilisation d'une fonction renvoyant une valeur utile :

say 'F:';
sub carré ($x) { return $x * $x }
my $result = 0;
$result = carré 3;
say $result;

# Le mot-clef return indique explicitement que la fonction doit se terminer et renvoyer la valeur donnée. Et l'appel carré
# 3 renvoie à say la valeur 9. En fait, ce mot-clef n'était pas indispensable ici, car une fonction renvoie implicitement la
# dernière expression évaluée, si bien que la fonction aurait aussi bien pu s'écrire :

sub square ($x) { $x ** 2 }
say $result = square 4;

# Cela suffit pour des fonctions simples n'ayant qu'un seul point de sortie, mais l'utilisation de return permet de définir
# finement le comportement d'une fonction et les valeurs de retour selon les conditions rencontrées.

