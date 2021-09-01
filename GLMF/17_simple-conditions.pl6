#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# La condition if / else est classique. Sa seule particularité est que, contrairement à beaucoup de langages, elle ne
# nécessite pas de parenthèses autour de la condition :

my $âge = 19;
if $âge >= 18 {
    say "Vous êtes un adulte."
} else {
    say "Vous êtes jeune."
}

# À noter que le point-virgule n'est pas nécessaire avant une accolade fermant un bloc.
# On peut également tester successivement plusieurs conditions avec des clauses elsif :

if $âge < 12 {
    say "Enfant"
}
elsif $âge < 18 {
    say "Adolescent"
}
else {
    say "Adulte"
}
 # Une condition if peut également se placer après l'instruction (on parle alors d'instruction modifiée) :

say "Bienvenue sur ce site" if $âge >= 18;

# Cette syntaxe est concise et pratique, mais n'autorise pas de clause else ou elsif.
# La condition unless inverse la condition :

$âge = 17;
say "Désolé : réservé aux adultes !" unless $âge >= 18;
# Equivalent à :
say "Désolé : réservé aux adultes !" if not $âge >= 18;

# La construction given ... when correspond au switch d'autres langages, mais permet une formulation beaucoup plus
# riche et variée des conditions :

my Int $age = 18;
given $age {
    when *..^0 { say "âge négatif ? Hum..." };
    when 0..2 { say "Bébé" };
    when 3..12 { say "Enfant" };
    when *..17 { say "Adolescent" };
    when 18 { say "tout jeune adulte" };
    default { say "Adulte" };
}

# Dès que l'une des conditions est satisfaite, les conditions suivantes ne sont pas évaluées. La condition *..17, c'est-à-
# dire compris entre 0 et 17, est donc ici correcte et en fait équivalente à 13..17 puisque l'on n'arrive à cette condition
# que si les trois conditions précédentes ont échoué (ce qui ne veut pas dire qu'il soit recommandé d'écrire une telle
# bizarrerie contre-intuitive, donnée ici à seul titre d'exemple).
# On peut inviter le programme à continuer l'évaluation des conditions suivantes même si une condition est satisfaite
# avec une instruction proceed :

my $var = 42;
given $var {
    when 0..50 { say "Compris entre 0 et 50"; proceed };
    when Int { say "Un entier"; proceed };
    when /4/ { say "Contient le chiffre 4"; proceed };
    when not .is-prime { say "Non premier"; proceed };
    when 42 { say "Réponse à la grande question" };
}

# Ici, grâce aux instructions proceed, chacun des cinq messages est affiché l'un après l'autre puisque toutes les
# conditions sont successivement satisfaites.

