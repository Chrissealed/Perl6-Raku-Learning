#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Exercice 2 : écrire un programme qui calcule la somme des chiffres du nombre factorielle de 100 ;

# Nous utilisons ici deux fois le métaopérateur de réduction [...] : une première fois avec la
# multiplication pour calculer 100! et une seconde fois pour faire la somme des chiffres du
# résultat. Ce qui donne :

say [+] split '', [*] 2..100;  # 648

