#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Exercice 3 : trouver la différence entre le carré de la somme des 100 premiers entiers naturels et la somme
# des carrés des 100 premiers entiers.

# Perl 6 calcule facilement la somme des 100 premiers nombres avec [+] 1..100.
# L'hyperopérateur «...» permet de calculer les carrés des cent premiers entiers et le
# métaopérateur [...] de réduire cette liste de carrés à leur somme. Ce qui permet d'écrire :

say ([+] 1..100)**2 - [+] (1..100) <<**>> 2; #25164150

# On pourrait alléger le calcul en remarquant que la somme des 100 premiers entiers naturels
# est égale à (100 * 101) / 2 = 5050, mais le but était ici surtout d'employer les hypeopérateurs
# et métaopérateurs du langage.

