#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Exercice 1 : la fonction interne lcm renvoie le plus petit multiple commun (PPMC) entre deux nombres. Écrire
# un programme qui affiche le plus petit nombre positif divisible par tous les nombres de 1 à 20.

# Le métaopérateur de réduction [...] permet d'appliquer un opérateur successivement à tous
# les éléments d'une liste. Il suffit de l'utiliser avec l'opérateur lcm sur la liste des nombres de 1 à 20 :

say [lcm] 1..20; # 232792560

