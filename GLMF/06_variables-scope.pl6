#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Nous avons vu que le mot-clef my sert à déclarer une variable. Plus précisément, il introduit une variable lexicale,
# c'est-à-dire une variable dont la portée est limitée au bloc de code dans lequel elle se trouve. Un bloc de code est,
# en simplifiant un peu, un fragment de code délimité par des accolades ouvrantes et fermantes servant à structurer le
# code. Une variable lexicale est visible et utilisable entre l'endroit où elle est déclarée avec le my et l'accolade fermant
# le bloc où se trouve la déclaration. Si la déclaration a lieu à l'extérieur de tout bloc, alors la variable est globale au
# script (ce qui n'est généralement pas conseillé).

{
  my Str $var = "texte";
  say $var; # Affiche "texte"
}
# say $var : ERREUR: $var n'est plus accessible
# On peut aussi avoir deux variables de même nom ayant des valeurs différentes selon la portée dans laquelle elles
# se trouvent :

my Int $nb = 42;
{
  my Str $nb = "texte";
  say $nb; # Affiche "texte"
}
say $nb; # -> 42

# Ces exemples sont un peu artificiels à ce stade, mais cette possibilité s'avérera très utile quand nous utiliserons des
# blocs décrivant des boucles ou le corps de fonctions.

