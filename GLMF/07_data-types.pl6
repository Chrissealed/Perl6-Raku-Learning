#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Une variable peut être déclarée avec un type imposant des contraintes sur ses valeurs possibles :

my Int $c;
$c = 4;     # Tout va bien, $c vaut 4
say $c;
say $c.WHAT; # Int
# $c = 4.2; # ERREUR: Type check failed in assignment to $c...

# Mais la déclaration n'est pas nécessaire et Perl 6 détermine dans ce cas lui-même le type de la donnée dans la
# mesure du possible :

my $d = 4.2;    # Pourrait aussi s'écrire : my $d = Rat.new(42, 10);
say $d;
say $d.WHAT;
say '$d = ', $d.numerator, " / ", $d.denominator; # Affiche : $d = 21 / 5

# On dit que Perl 6 est typé de façon « graduelle » : il autorise aussi bien un typage statique (comme C ou Java)
# qu'un typage dynamique (comme Perl 5, Ruby ou Python). Le meilleur de deux mondes, en quelque sorte. En fait,
# les variables $c et $d ci-dessus sont assimilables à des objets, respectivement de type Int et Rat, ce qui explique la
# possibilité d'invoquer sur eux les méthodes .WHAT ou .numerator. Pour les types les plus courants, il n'est souvent
# pas nécessaire d'invoquer le constructeur .new pour les obtenir. Ainsi, il existe plusieurs façons de créer des objets
# de type complexe :

my $z1 = 5 + 3i;
say $z1;
say $z1.WHAT;               # Complex
my $z2 = Complex.new(4, 9); # 4+9i
say $z2;
my Complex $z3 = 2 + 5i;
say $z3;
say '$z1 + $z2 + $z3 = ', $z1 + $z2 + $z3; # Affiche : 11+17i

# L'utilisation d'une simple affectation est suffisante pour créer un objet du type voulu, mais les deux syntaxes utilisant
# explicitement le type Complex sont un peu plus sûres, car elles vérifient le type du littéral affecté à la variable. De
# même, considérons des objets de type Date :

my $d1 = Date.new(2015, 12, 24); # Veille de Noël : 2015-12-24
say $d1;
say $d1.year;                    # 2015
say $d1.month;                   # 12
say $d1.day;                     # 24
say $d1.day-of-week;             # 4 (donc, jeudi)

my $d2 = Date.new('2015-12-31');    # Saint-Sylvestre
say '$d2 > $d1 ? ', $d2 > $d1;      # False
say '$d2 - $d1 : ', $d2 - $d1;      # 7 (delta 7 jours)
say '$d2 + 1 : ', $d2 + 1;          # 2016-01-01
say '1+$d2.later(:2months) : ', 1+$d2.later(:2months);         # 2016-03-01

# Remarquez au passage combien la manipulation des dates devient facile et intuitive. C'est cela aussi la modernité
# de Perl 6. Ici, la syntaxe utilisant le constructeur new était nécessaire parce que sans elle, le programme ne pourrait
# reconnaître une date et effectuerait simplement une double soustraction entre entiers :

my $date = 2015-12-25;              # Non, ce n'est pas Noël
say '$date = 2015-12-25 = ', $date; # 1978

