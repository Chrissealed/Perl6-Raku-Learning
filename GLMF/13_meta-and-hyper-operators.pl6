#!/home/christian/rakudo/rakudo-star-2016.04/install/bin/perl6

# Les opérateurs travaillent sur des données, les métaopérateurs travaillent sur des opérateurs et permettent en
# quelque sorte de créer de nouveaux opérateurs.
# Le métaopérateur de réduction [...] permet de transformer un opérateur infixé associatif en un opérateur de liste
# renvoyant un scalaire :

say [+] 1, 2, 3, 4;

# Ici, tout se passe comme si on avait placé l'opérateur + entre chaque élément de la liste, comme si on avait écrit :
say 1 + 2 + 3 + 4;

# On peut de même calculer très facilement la factorielle de 10 en modifiant l'opérateur de multiplication :

my $fact10 = [*] 1..10; # 3628800
say $fact10;

# Il existe d'autres métaopérateurs. Par exemple, le métaopérateur X renvoie un produit cartésien entre deux ou
# plusieurs listes :

say <a b c> X 1, 2; # ((a 1) (a 2) (b 1) (b 2) (c 1) (c 2))

# Un hyperopérateur applique une opération à chaque membre d'une liste ou de plusieurs listes et renvoie une nouvelle
# liste. Ici, chaque élément de la liste est multiplié par 5 :

my @a = 6..10; # [6 7 8 9 10]
say @a;
say 5 <<*>> @a; # [30 35 40 45 50]

# À noter que cet hyperopérateur utilise en principe les guillemets français «...», mais vous pouvez utiliser les chevrons
# ASCII <<...>> si votre éditeur ne vous permet pas d'écrire facilement ces guillemets français.
# Avec deux ou plusieurs listes, l'hyperopérateur permet d'effectuer des opérations membre à membre sur les listes.
# Voici par exemple une concaténation membre à membre entre trois listes :

my $x = ('a'..'e') <<~>> (3..7) <<~>> ('v'..'z'); # [a3v b4w c5x d6y e7z]
say $x;

# Les métaopérateurs et hyperopérateurs créent de nouveaux opérateurs en modifiant la sémantique d'opérateurs
# existants. Nous verrons plus loin qu'il est possible de créer facilement des opérateurs entièrement nouveaux. Tout
# cela tend à rendre le langage intrinsèquement malléable et extensible.

