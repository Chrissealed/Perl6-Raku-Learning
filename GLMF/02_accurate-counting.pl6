#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Prenez un langage de programmation généraliste quelconque et affichez le résultat de la simple opération
# arithmétique suivante : 0.3 - 0.2 - 0.1. Il y a toutes les chances que vous obteniez un résultat tel que
# -2.77555756156289e-17 (en Perl 5), -2.775558e-17 (en C sous gcc) ou -2.7755575615628914e-17 (en Java,
# Python 3, Ruby ou TCL). Ce dernier résultat paraît peut-être plus précis (plus de décimales), mais il se trouve en fait
# être légèrement plus loin de la vérité, puisque ce total devrait normalement être égal à 0. Ces résultats erronés ne
# sont pas dus à une faiblesse des langages en question, mais au fait que nos ordinateurs ne sont pas très bons en
# arithmétique avec des nombres fractionnaires.

my $l'addition-devrait-être-zéro = .3 - .2 - .1;
say $l'addition-devrait-être-zéro;
say sprintf "%.50f", $l'addition-devrait-être-zéro;

# On voit que Perl 6 affiche la valeur correcte (0), même quand on demande d'afficher les 50 premières décimales.
# Ce résultat est correct parce qu'en interne, Perl 6 stocke des nombres décimaux dans un type Rat (rationnel), sous
# la forme d'un couple numérateur/dénominateur, et peut donc obtenir une précision arbitraire... et surtout un résultat
# correct. On peut même comparer le résultat à 0 :

say "Vrai" if $l'addition-devrait-être-zéro == 0;

# Tout développeur un tant soit peu expérimenté sait qu'il ne faut surtout pas faire ce genre de comparaison dans
# la plupart des langages de programmation. En Perl 6, ça marche parfaitement. Cet exemple montre la mise en
# pratique du principe « Do What I Mean » (DWIM) cher aux concepteurs du langage Perl 6 : on s'attend normalement
# à ce que cette opération soit égale à 0, mais on constate que ce n'est pas le cas dans la plupart des langages de
# programmation. Perl 6 « fait exactement ce que nous voulons dire ». Ce simple problème d'addition est un premier
# exemple de ce qu'un langage radicalement moderne devrait faire : sauf peut-être si nous développons des microcodes
# pour une puce embarquée, nous ne devrions plus, en 2016, avoir à nous demander si notre ordinateur sait compter
# correctement, ce devrait être acquis depuis longtemps. Avec Perl 6, votre ordinateur sait enfin le faire.

