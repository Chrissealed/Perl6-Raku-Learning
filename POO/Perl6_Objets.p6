# POO en Perl6

say 42;        # syntaxe fonctionnelle, imprime 42
42.say;        # syntaxe objet, imprime également 42

'toto'.uc.say;   # ->  TOTO (uc, méthode pour mettre en capitales)

my @list = <charlie romeo juliet alpha lima echo bravo zulu delta>;
@list.sort.uc.say;
    #imprime : ALPHA BRAVO CHARLIE DELTA ECHO JULIET LIMA ROMEO ZULU
@list.sort.uc.perl.say;
    #imprime : "ALPHA BRAVO CHARLIE DELTA ECHO JULIET LIMA ROMEO ZULU"

say 4 * 1.atan2;     # 3.14159265358979, valeur de pi, correct
4 * 1.atan2.say;     # 0.785398163397448, pi/4, sans doute incorrect
(4 * 1.atan2).say    # 3.14159265358979, pi, valeur attendue

given <un deux> { 
    .uc.say     # équivalent à : $_.uc.say
}
# -> UN DEUX

my @mots = <Maître Corbeau>; # -> [Maître Corbeau]
@mots.push("sur", "un", "arbre", "perché"); 
                             # -> [Maître Corbeau sur un arbre perché]


my @mots = <Maître Corbeau>; # -> [Maître Corbeau]
@mots.push: "sur", "un", "arbre", "perché"; 
                             # -> [Maître Corbeau sur un arbre perché]

say 4.log    ;   # 1.38629436111989 (logarithme naturel de 4)
say 4.log:   ;   # idem
say 4.log: +2;   # 2                (logarithme en base 2 de 4)
say 4.log  +2;   # 3.38629436111989 (logarithme naturel de 4, plus 2)

class PointDuPlan {
    has $.abscisse;
    has $.ordonnée;
    
    method coordonnées {        # accesseur
        return (self.abscisse, self.ordonnée)
    }
    
    method distanceAuCentre {
        (self.abscisse ** 2 + self.ordonnée ** 2) ** 0.5
    }
    method coordonnéesPolaires {
        my $rayon = self.distanceAuCentre;
        my $thêta = atan2 self.ordonnée, self.abscisse; # (azimut)
        return $rayon, $thêta;
    }
}

my $point = PointDuPlan.new(
    abscisse => 3,
    ordonnée => 4,
    );

say $point.WHAT;
say "Coordonnées : ", $point.coordonnées;
say "Distance au point origine : ", $point.distanceAuCentre.round(0.01);
printf "%s: rayon = %.4f, thêta (rad) = %.4f\n", 
    "Coordonnées polaires", $point.coordonnéesPolaires;

# Imprime :
# (Point2D)
# Coordonnées : (3 4)
# Distance au point origine : 5
# Coordonnées polaires: rayon = 5.0000, thêta (rad) = 0.9273

class PointMobile is PointDuPlan {
    has $.abscisse is rw;
    has $.ordonnée is rw;
    
    method déplace (Numeric $x, Numeric $y) {
        $.abscisse += $x;
        $.ordonnée += $y;
    }
}

my $point = PointMobile.new(
    abscisse => 3,
    ordonnée => 4,
    );

say "Coordonnées : ", $point.coordonnées;
say "Distance au point origine : ", $point.distanceAuCentre.round(0.01);
printf "%s: rayon = %.4f, thêta (rad) = %.4f\n", 
    "Coordonnées polaires", $point.coordonnéesPolaires;

say "--> Déplacement du point.";
$point.déplace(4, 5);
say "Nouvelles coordonnées : ", $point.coordonnées;
say "Distance au point origine : ", $point.distanceAuCentre.round(0.01);
printf "%s: rayon = %.4f, thêta (rad) = %.4f\n", 
    "Coordonnées polaires", $point.coordonnéesPolaires;

Coordonnées : (3 4)
Distance au point origine : 5
Coordonnées polaires: rayon = 5.0000, thêta (rad) = 0.9273
--> Déplacement du point.
Nouvelles coordonnées : (7 9)
Distance au point origine : 11.4
Coordonnées polaires: rayon = 11.4018, thêta (rad) = 0.9098

class PointMobile is PointDuPlan {
    has $.ordonnée is rw;
    
    method déplace (Numeric $y) {
        $.ordonnée += $y;
    }
}

my $point = PointMobile.new(
    PointDuPlan { abscisse => 3},
    ordonnée => 4,
);

class Pixel is PointDuPlan {
    has %.couleur is rw;

    method change_couleur(%teinte) {
        self.couleur = %teinte
    }
    method change_couleur2(Int $red, Int $green, Int $blue) {
        # la signature utilise des arguments positionnels
        self.couleur = (rouge => $red, vert => $green, bleu => $blue)
    }
}

subset Octet of Int where {$_ > 0 and $_ <= 255};

my $pix = Pixel.new(
    :abscisse(3),
    :ordonnée(4),
    couleur => {rouge => 34, vert => 233, bleu => 145}, 
    );

say "Le pixel d'origine a les couleurs suivantes : ", $pix.couleur.perl;

$pix.change_couleur({:rouge(195), :vert(110), :bleu(70),});
say "Le pixel modifié a les couleurs suivantes : {$pix.couleur.perl} ";
printf "Nouvelles caractéristiques du pixel : \n\tAbscisse: %d\n\tOrdonnée: %d\n\tCouleur: R: %d, V: %d, B: %d\n",
       $pix.abscisse, $pix.ordonnée, $pix.couleur<rouge>, $pix.couleur{"vert"}, $pix.couleur{"bleu"};;

$pix.change_couleur2(90, 180, 30);  # args positionnels moins clairs
say "Nouvelles couleurs :  
    R: {$pix.couleur<rouge>}, V: {$pix.couleur<vert>}, B: {$pix.couleur<bleu>} ";

Le pixel d'origine a les couleurs suivantes : {:bleu(145), :rouge(34), :vert(233)}
Le pixel modifié a les couleurs suivantes : {:bleu(70), :rouge(195), :vert(110)}
Nouvelles caractéristiques du pixel :
        Abcisse: 3
        Ordonnée: 4
        Couleur: R: 195, V: 110, B: 70
Nouvelles couleurs :
    R: 90, V: 180, B: 30

class PixelMobile is PointMobile is Pixel {
    # ...
}

class Bipoint {
    has PointDuPlan $.origine;
    has PointDuPlan $.arrivée;
    
    method norme {
        return (($!arrivée.abscisse - $!origine.abscisse) ** 2 + 
            ($!arrivée.ordonnée - $!origine.ordonnée) **2) ** 0.5;
    }
    method pente {
        return ($!arrivée.ordonnée - $!origine.ordonnée) / 
                  ($!arrivée.abscisse - $!origine.abscisse);
    }
}

my $debut = PointDuPlan.new(
    abscisse => 2,
    ordonnée => 1,
);
my $fin = PointDuPlan.new(
    abscisse => 3,
    ordonnée => 4,
);

my $segment = Bipoint.new(
    origine => $debut,
    arrivée => $fin
);
say "Norme = {$segment.norme.round(0.001)}";  # -> Norme = 3.162
say "Pente = {$segment.pente.round(0.001)}";  # -> Pente = 3

my $segment = Bipoint.new(
    origine => PointDuPlan.new(abscisse => 2, ordonnée => 1),
    arrivée => PointDuPlan.new(abscisse => 3, ordonnée => 4),
);
say "Norme = {$segment.norme.round(0.001)}";  # -> Norme = 3.162
say "Pente = {$segment.pente.round(0.001)}";  # -> Pente = 3

my $abscisse_origine = $segment.origine.abscisse;

class Adresse {
    has Int $.numéro;
    has Str $.voie;
    has Str $.commune;
    has Str $.code-postal;
    # ...
    method formate-adresse {
        "\t$!numéro $!voie\n" ~ 
        "\t$!code-postal $!commune";
    }
}

class Personne {
    has Str $.nom;
    has Str $.prénom;
    has Str $.sexe where {$_ eq "M"|"F"}; # ne peut être que M ou F
    has Date $.date-de-naissance;
    has Str $.lieu-de-naissance;
    has Adresse $.adresse is rw;
    has Str $.numéro-sécu;
    has Str $.telephone-personnel is rw;
    # ...
    method show-person {dd self};  # (méthode temporaire de débogage)
    method âge { 
        sprintf "%d", (Date.today - $.date-de-naissance)/365
    }
}

class Employé {
    has Personne $.données-personnelles;
    has Numeric $.matricule;
    has Str $.intitulé-poste is rw;
    has Numeric $.salaire is rw;
    # ...  
}

my $salarié = Employé.new(
    données-personnelles => Personne.new(
        nom => "Chiponelli",
        prénom => "Jean",
        sexe => "M",
        date-de-naissance => Date.new(1992, 10, 24),
        lieu-de-naissance => "Strasbourg",
        adresse => Adresse.new( 
           numéro => 42, voie => "boulevard Carnot",
           commune => "Nice", code-postal => "06000"
        ),
        numéro-sécu => "1-92-10-67...",  
        telephone-personnel => "0712345678" 
    ),
    matricule => 12345,
    intitulé-poste => "Agent d'entretien",
    salaire => 1234.5
);

say "Matricule de l'employé : {$salarié.matricule}";
say "Âge de {$salarié.données-personnelles.nom, 
    $salarié.données-personnelles.prénom} : ", 
    $salarié.données-personnelles.âge;
say "Adresse : \n" ~ $salarié.données-personnelles.adresse.formate-adresse;
say "Données personnelles : ";
$salarié.données-personnelles.telephone-personnel = "069876543";
say "Nouveau numéro de téléphone : ", 
    $salarié.données-personnelles.telephone-personnel;
# Affichage de l'ensemble des données-personnelles:
$salarié.données-personnelles.show-person;

Matricule de l'employé : 12345
Âge de Jean Chiponelli : 24
Adresse :
        42 boulevard Carnot
        06000 Nice
Données personnelles :
Nouveau numéro de téléphone : 069876543
Personne.new(nom => "Chiponelli", prénom => "Jean", sexe => "M", date-de-naissance => Date.new(1992,10,24), lieu-de-naissance => "Strasbourg", adresse => Adresse.new(numéro => 42, voie => "boulevard Carnot", commune => "Nice", code-postal => "06000"), numéro-sécu => "1-92-10-67...", telephone-personnel => "069876543")

class Employe-herit is Personne {
    has Numeric $.matricule;
    has Str $.intitulé-poste is rw;
    has Numeric $.salaire is rw;
    # ...
}
my $salarié2 = Employe-herit.new(
    nom => "Benali",
    prénom => "Samira",
    sexe => "F",
    date-de-naissance => Date.new(1990, 11, 17),
    # ... autres données relatives à la personne abrégées
    matricule => 54321,
    intitulé-poste => "Comptable",
    salaire => 1765.6
);

say "Âge de {$salarié2.prénom, $salarié2.nom} : ", 
    $salarié2.âge;                # -> Âge de Samira Benali : 26

class Mammifère is Vertébré  { ... }
class Oiseau    is Vertébré  { method vole   {...} }
class Chien     is Mammifère { method aboie  {...} }
class Cheval    is Mammifère { method hennit {...} }
class Chat      is Mammifère { method miaule {...} }

role Animal-de-compagnie { ... }
role Chien-berger        { ... }
role Féral               { ... }    # animal retourné à l'état sauvage
role Guide               { ... }    # guide d'aveugle

class Chien-guide        is Chien  does Guide { ... }
class Chien-de-compagnie is Chien  does Animal-de-compagnie { ... }
class Chien-errant       is Chien  does Féral { ... }
class Chat-de-compagnie  is Chat   does Animal-de-compagnie { ... }
class Mustang            is Cheval does Féral { ... }
class Chat-haret         is Chat   does Féral { ... } 
                                    # distinct du chat sauvage
class Canari             is Oiseau does Animal-de-compagnie { ... }

role Dessinable {
    has $.couleur is rw;
    method dessiner { ... }
}
class Forme {
    method aire { ... }
}

class Rectangle is Forme does Dessinable {
    has $.largeur;
    has $.hauteur;
    method aire {
        $!largeur * $!hauteur;
   }
    method dessiner() {
        for 1..$.hauteur {
            say 'x' x $.largeur;
        }
    }
}

Rectangle.new(largeur => 8, hauteur => 3).dessiner;

~ perl6 test_rectangle.pl
xxxxxxxx
xxxxxxxx
xxxxxxxx

class Chien-guide is Chien does Guide { 
    ... 
} # Composition d'un rôle dans une classe


my $chien = Chien.new;
$chien does Guide;   # Composition d'un rôle dans un objet individuel

class Humain {
     has Chien $chien;      # Peut contenir un type quelconque de
     ...                    # chien, ayant un rôle de guide ou non
}
 role Aveugle {
     has Guide $guide;      # Peut contenir tout objet ayant le rôle 
     ...                    # de guide, qu'il s'agisse d'un chien
                            # ou d'autre chose
}

class ClasseBase {
    method azincourt() { 1415 }
    method marignan()  { 1515 }
    method waterloo()  { 1815 }
}
class Utilise { 
    has $.base is rw handles <marignan waterloo>
}

my $a = Utilise.new;
$a.base = ClasseBase.new(); # Mise en place d'un objet handler;
say $a.marignan;
say $a.waterloo;
say $a.azincourt;

1515
1815
Method 'azincourt' not found for invocant of class 'Utilise'
  in block <unit> at delegation2.pl:14

class ClasseBase2 {
    method avec-paramètres($x) { $x xx 3 }
}
class Utilise2 { 
    has $.base2 handles 'avec-paramètres'
}

my $a = Utilise2.new( base2 => ClasseBase2.new() );
say $a.avec-paramètres('xyz');        # -> (xyz xyz xyz)

class Point3D {
    has $.abscisse;
    has $.ordonnée;
    has $.hauteur;
    
    method coordonnées () {        # accesseur
        return ($.abscisse, $.ordonnée, $.hauteur)
    }
    
    method distanceAuCentre () {
        ($.abscisse ** 2 + $.ordonnée ** 2 + $.hauteur ** 2) ** 0.5
    }
    method coordonnéesPolaires () {
        return self.coordonnéesSphériques;
    }
    
    method coordonnéesSphériques {
        my $rhô = $.distanceAuCentre;
        my $longitude = atan2 $.ordonnée, $.abscisse;  # thêta
        my $latitude = acos $.hauteur / $rhô;          # delta (ou phi)
        return $rhô, $longitude, $latitude;
    }
    
    method coordonnéesCylindriques {
        # ...
    }
}


