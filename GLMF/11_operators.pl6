#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

say "le tableau ci-dessous résume les opérateurs les plus communs, par ordre de précédence descendante (de la priorité
la plus forte à la plus faible) :";
say "";
say ".method # méthode postfixée";
say "++ -- # auto-incrémentation, autodécrémentation (préfixées ou postfixées)";
say "** # exponentielle";
say "! + - ~ ? | || # symboles unaires : négation logique, plus, moins, concaténation, coercition booléenne, ou logique";
say "* / % %% div gcd lcm # multiplication, division, modulo, divisibilité, division entière, PGDC, PPMC";
say "+ - # addition, soustraction";
say "x xx # réplication de chaîne (renvoie une chaîne), réplication d'élément (renvoie une liste)";
say "~ # concaténation de chaînes";
say "~~ != == < <= > # >= eq ne lt le gt ge # opérateur de comparaison intelligente, opérateurs de comparaisons numériques, opérateurs de comparaisons de chaînes";
say "&& # et booléen (de haute précédence)";
say "|| # ou booléen (de haute précédence)";
say "?? !! # opérateur conditionnel ternaire";
say "= => += -= **= # xx= .= # opérateurs d'affectation";
say "so not # booléens unaires de basse précédence : coercition booléenne et non logique";
say "and andthen # et booléen (de basse précédence)";
say "or xor orelse # ou booléen (de basse précédence)";
say "";
say "nous verrons plus loin qu'il est facile de construire ses propres opérateurs.";

