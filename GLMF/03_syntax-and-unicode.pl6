#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# L'exemple ci-dessus illustre au passage quelques autres caractéristiques de Perl 6. Comme en Perl 5 (et en PHP), les
# noms de variables commencent par un caractère spécial, nommé sigil, ici le signe $ pour une variable scalaire, suivi
# de l'identifiant proprement dit, qui doit commencer par un caractère alphabétique ou le caractère de soulignement
# « _ ». Elles doivent être déclarées avant d'être utilisées, ici avec le mot-clef my. Perl 6 supporte pleinement l'Unicode,
# et les identifiants de variables ou de fonctions peuvent contenir des lettres françaises accentuées (ci-dessus, le « ê »
# et le « é »), mais on aurait aussi bien pu utiliser des lettres grecques :

my $φ = (5**.5 + 1)/2; # Nombre d'or
say "Le nombre d'or est égal à $φ.";

my $π = 4 * atan 1;
say "Le nombre Pi est égal à $π.";

# ou d'un quelconque autre alphabet. Là encore, la modernité... De plus, comme on le voit dans le premier exemple
# de code, ces identifiants peuvent également contenir des tirets (« - ») ou des apostrophes (« ' »), à condition qu'ils
# soient situés entre deux lettres.
# On constatera également dans les exemples ci-dessus que Perl 6 n'a généralement pas besoin de beaucoup de
# parenthèses, sauf quand c'est nécessaire pour des raisons de précédence des opérateurs (comme dans la formule du
# nombre d'or). Par exemple, les arguments d'une fonction interne peuvent généralement être placés sans parenthèses
# après le nom de la fonction appelée (et séparés par des virgules s'il y en a plusieurs). De même, on peut souvent
# enchaîner plusieurs fonctions comme dans l'exemple say sprintf ... ci-dessus, Perl 6 sait très bien prendre la ou les
# valeurs de retour d'une fonction et la ou les passer en argument à la fonction placée à sa gauche. Cela rend la
# syntaxe souvent plus fluide et plus limpide.

