import 'package:flutter/material.dart';


// <> FilmsDatas()
class FilmsDatas extends InheritedWidget {
  // =
  // static List<FilmModel> films = [
  //   // NOTE : Strange
  //   FilmModel(
  //     id: 'f1',
  //     titre: 'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
  //     synopsis:
  //         'Dans ce nouveau film Marvel Studios, l’univers cinématographique Marvel déverrouille et repousse les limites du multivers encore plus loin. Voyagez dans l’inconnu avec Doctor Strange, qui avec l’aide d’anciens et de nouveaux alliés mystiques, traverse les réalités hallucinantes et dangereuses du multivers pour affronter un nouvel adversaire mystérieux.',
  //     realisateur: ['Sam Raimi'],
  //     label: '',
  //     langue: 'vost',
  //     affiche: 'assets/img/strange_poster.jpg',
  //     genre: [
  //       'Action',
  //       'Aventure',
  //       'Fantastique',
  //     ],
  //     note: 0,
  //     duree: const Duration(hours: 2, minutes: 10),
  //     dateDeSortie: DateTime.utc(2022, 5, 4),
  //     programmation: [
  //       DateTime.utc(2022, 5, 4, 10, 30),
  //       DateTime.utc(2022, 5, 4, 11, 30),
  //       DateTime.utc(2022, 5, 4, 13, 15),
  //       DateTime.utc(2022, 5, 4, 14, 30),
  //       DateTime.utc(2022, 5, 4, 16),
  //       DateTime.utc(2022, 5, 4, 17, 30),
  //       DateTime.utc(2022, 5, 4, 18, 45),
  //       DateTime.utc(2022, 5, 4, 20, 30),
  //       DateTime.utc(2022, 5, 4, 21, 30),
  //     ],
  //   ),
  //   // NOTE : Cité Perdue
  //   FilmModel(
  //     id: 'f2',
  //     titre: 'LE SECRET DE LA CITE PERDUE',
  //     synopsis:
  //         'Une romancière est kidnappée par un milliardaire excentrique qui est persuadé qu’elle pourra l’aider à retrouver le trésor d’une cité perdue évoquée dans son dernier ouvrage. Elle est accompagnée d\'Alan, un mannequin qui incarne le héros à la plastique avantageuse figurant sur les couvertures de ses livres.',
  //     label: '',
  //     langue: 'vost',
  //     affiche: 'assets/img/cite_perdue_poster.jpg',
  //     realisateur: [
  //       'Aaron Nee',
  //       'Adam Nee',
  //     ],
  //     genre: [
  //       'Action',
  //       'Comédie',
  //       'Aventure',
  //     ],
  //     note: 3,
  //     duree: const Duration(hours: 1, minutes: 52),
  //     dateDeSortie: DateTime.utc(2022, 4, 20),
  //     programmation: [
  //       DateTime.utc(2022, 4, 20, 9, 10),
  //       DateTime.utc(2022, 4, 20, 11, 40),
  //       DateTime.utc(2022, 4, 20, 14, 10),
  //       DateTime.utc(2022, 4, 20, 16, 50),
  //       DateTime.utc(2022, 4, 20, 19, 30),
  //       DateTime.utc(2022, 4, 20, 21, 50),
  //     ],
  //   ),
  //   // NOTE : Les Segpa
  //   FilmModel(
  //     id: 'f3',
  //     titre: 'LES SEGPA',
  //     synopsis:
  //         'Les SEGPA se font virer de leur établissement. À leur grande surprise, ils intègrent le prestigieux collège Franklin D. Roosevelt. Le Principal, peu enclin à voir la réputation de son école se détériorer, imagine un stratagème pour virer les SEGPA tout en conservant les aides.',
  //     realisateur: ['Ali Boughéraba', 'Hakim Boughéraba'],
  //     label: '',
  //     langue: 'vf',
  //     affiche: 'assets/img/segpa_poster.jpg',
  //     genre: [
  //       'Comédie',
  //     ],
  //     note: 3,
  //     duree: const Duration(hours: 1, minutes: 39),
  //     dateDeSortie: DateTime.utc(2022, 4, 20),
  //     programmation: [
  //       DateTime.utc(2022, 4, 20, 9, 10),
  //       DateTime.utc(2022, 4, 20, 11, 20),
  //       DateTime.utc(2022, 4, 20, 13, 30),
  //       DateTime.utc(2022, 4, 20, 15, 40),
  //       DateTime.utc(2022, 4, 20, 17, 50),
  //       DateTime.utc(2022, 4, 20, 20),
  //       DateTime.utc(2022, 4, 20, 22, 10),
  //     ],
  //   ),
  //   // NOTE : Dumbledore
  //   FilmModel(
  //     id: 'f4',
  //     titre: 'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
  //     synopsis:
  //         'Le professeur Albus Dumbledore sait que le puissant mage noir Gellert Grindelwald cherche à prendre le contrôle du monde des sorciers. Incapable de l’empêcher d’agir seul, il sollicite le magizoologiste Norbert Dragonneau pour qu’il réunisse une équipe.',
  //     label: '',
  //     langue: 'vost',
  //     affiche: 'assets/img/animaux_fantastiques_poster.jpg',
  //     realisateur: [
  //       'David Yates',
  //     ],
  //     genre: [
  //       'Aventure',
  //       'Fantastique',
  //     ],
  //     note: 4,
  //     duree: const Duration(hours: 2, minutes: 23),
  //     dateDeSortie: DateTime.utc(2022, 4, 13),
  //     programmation: [
  //       DateTime.utc(2022, 4, 13, 9),
  //       DateTime.utc(2022, 4, 13, 11),
  //       DateTime.utc(2022, 4, 13, 12),
  //       DateTime.utc(2022, 4, 13, 14),
  //       DateTime.utc(2022, 4, 13, 15),
  //       DateTime.utc(2022, 4, 13, 17),
  //       DateTime.utc(2022, 4, 13, 18),
  //       DateTime.utc(2022, 4, 13, 20),
  //       DateTime.utc(2022, 4, 13, 21),
  //       DateTime.utc(2022, 4, 13, 21, 30),
  //     ],
  //   ),
  //   // NOTE : Goliath
  //   FilmModel(
  //     id: 'f5',
  //     titre: 'GOLIATH',
  //     synopsis:
  //         'France, professeure de sport le jour, ouvrière la nuit, milite activement contre l’usage des pesticides. Patrick, obscur et solitaire avocat parisien, est spécialiste en droit environnemental. Mathias, lobbyiste brillant et homme pressé, défend les intérêts d’un géant de l’agrochimie.',
  //     realisateur: ['Frédéric Tellier'],
  //     label: 'UGC M',
  //     langue: 'vf',
  //     affiche: 'assets/img/golitah_poster.jpg',
  //     genre: [
  //       'Thriller',
  //     ],
  //     note: 5,
  //     duree: const Duration(hours: 2, minutes: 2),
  //     dateDeSortie: DateTime.utc(2022, 3, 9),
  //     programmation: [
  //       DateTime.utc(2022, 3, 9, 11, 50),
  //       DateTime.utc(2022, 3, 9, 16, 50),
  //       DateTime.utc(2022, 3, 9, 21, 50),
  //     ],
  //   ),
  //   // NOTE : Sonic
  //   FilmModel(
  //     id: 'f6',
  //     titre: 'SONIC 2 LE FILM',
  //     synopsis:
  //         'Bien installé dans la petite ville de Green Hills, Sonic veut maintenant prouver qu’il a l’étoffe d\' un véritable héros. Un défi de taille se présente à lui quand le Dr Robotnik refait son apparition.',
  //     label: 'UGC FAMILY',
  //     langue: 'vf',
  //     affiche: 'assets/img/sonic_poster.jpg',
  //     realisateur: [
  //       'Aaron Nee',
  //       'Adam Nee',
  //     ],
  //     genre: [
  //       'Action',
  //       'Comédie',
  //       'Aventure',
  //     ],
  //     note: 3,
  //     duree: const Duration(hours: 1, minutes: 52),
  //     dateDeSortie: DateTime.utc(2022, 3, 20),
  //     programmation: [
  //       DateTime.utc(2022, 3, 20, 9, 10),
  //       DateTime.utc(2022, 3, 20, 11, 40),
  //       DateTime.utc(2022, 3, 20, 14, 10),
  //       DateTime.utc(2022, 3, 20, 16, 50),
  //       DateTime.utc(2022, 3, 20, 19, 30),
  //       DateTime.utc(2022, 3, 20, 21, 50),
  //     ],
  //   ),
  //   // NOTE : Bon Dieu
  //   FilmModel(
  //     id: 'f7',
  //     titre: 'QU\'EST-CE QU\'ON A TOUS FAIT AU BON DIEU ?',
  //     synopsis:
  //         'Ce sont bientôt les 40 ans de mariage de Claude et Marie Verneuil. Pour cette occasion, leurs quatre filles décident d’organiser une grande fête surprise dans la maison familiale de Chinon et d’y inviter les parents de chacun des gendres, pour quelques jours.',
  //     realisateur: ['Philippe de Chauveron'],
  //     label: 'LABEL SPECTATEUR UGC',
  //     langue: 'vf',
  //     affiche: 'assets/img/bon_dieu_poster.jpg',
  //     genre: [
  //       'Comédie',
  //     ],
  //     note: 4,
  //     duree: const Duration(hours: 1, minutes: 39),
  //     dateDeSortie: DateTime.utc(2022, 4, 6),
  //     programmation: [
  //       DateTime.utc(2022, 4, 6, 9),
  //       DateTime.utc(2022, 4, 6, 11, 15),
  //       DateTime.utc(2022, 4, 6, 13, 25),
  //       DateTime.utc(2022, 4, 6, 15, 40),
  //       DateTime.utc(2022, 4, 6, 17, 50),
  //       DateTime.utc(2022, 4, 6, 20),
  //       DateTime.utc(2022, 4, 6, 22, 10),
  //     ],
  //   ),
  //   // NOTE : Encanto
  //   FilmModel(
  //     id: 'f8',
  //     titre: 'ENCANTO, LA FANTASTIQUE FAMILLE MADRIGAL',
  //     synopsis:
  //         'Dans un mystérieux endroit niché au cœur des montagnes de Colombie, la fantastique famille Madrigal habite une maison enchantée dans une cité pleine de vie, un endroit merveilleux appelé Encanto.',
  //     label: 'UGC FAMILY',
  //     langue: 'vost',
  //     affiche: 'assets/img/encanto_poster.jpg',
  //     realisateur: [
  //       'Byron Howard',
  //       'Jared Bush',
  //     ],
  //     genre: [
  //       'Famille',
  //       'Comédie',
  //       'Fantastique',
  //       'Animation',
  //     ],
  //     note: 5,
  //     duree: const Duration(hours: 1, minutes: 42),
  //     dateDeSortie: DateTime.utc(2021, 11, 24),
  //     programmation: [
  //       DateTime.utc(2021, 11, 24, 12, 15),
  //     ],
  //   ),
  //   // NOTE : Ogre
  //   FilmModel(
  //     id: 'f9',
  //     titre: 'OGRE',
  //     synopsis:
  //         'Ce film, qui met en scène un enfant dans un climat oppressant, comporte des scènes effrayantes pouvant heurter un jeune public.',
  //     realisateur: ['Arnaud Malherbe'],
  //     label: '',
  //     langue: 'vf',
  //     affiche: 'assets/img/ogre_poster.jpg',
  //     genre: [
  //       'Drame',
  //       'Fantastique',
  //     ],
  //     note: 4,
  //     duree: const Duration(hours: 1, minutes: 43),
  //     dateDeSortie: DateTime.utc(2022, 4, 20),
  //     programmation: [
  //       DateTime.utc(2022, 4, 20, 9),
  //       DateTime.utc(2022, 4, 20, 11, 10),
  //       DateTime.utc(2022, 4, 20, 13, 20),
  //       DateTime.utc(2022, 4, 20, 15, 30),
  //       DateTime.utc(2022, 4, 20, 17, 40),
  //       DateTime.utc(2022, 4, 20, 19, 50),
  //       DateTime.utc(2022, 4, 20, 22, 5),
  //     ],
  //   ),
  //   // NOTE : Thor
  //   FilmModel(
  //     id: 'f10',
  //     titre: 'THOR: LOVE AND THUNDER',
  //     synopsis:
  //         'Thor s’engage dans une quête inédite, celle de sa propre sérénité. Mais sa retraite est interrompue par l’apparition de Gorr le Boucher, un tueur galactique qui s’est donné pour mission d’exterminer les dieux. Pour affronter cette menace, Thor fait équipe avec Valkyrie, Korg et son ex-petite amie, Jane Foster, qui – à sa grande surprise – manie son marteau, Mjolnir, aussi bien que lui. Nos héros vont se lancer ensemble dans une aventure cosmique éprouvante pour tenter de cerner les causes de l’acharnement de Gorr, le Boucher des dieux et l’arrêter avant qu’il ne soit trop tard.',
  //     label: '',
  //     langue: 'vost',
  //     affiche: 'assets/img/thor_poster.jpg',
  //     realisateur: [
  //       'Taika Waititi',
  //     ],
  //     genre: [
  //       'Action',
  //       'Science Fiction',
  //       'Aventure',
  //     ],
  //     note: 0,
  //     duree: const Duration(hours: 2, minutes: 15),
  //     dateDeSortie: DateTime.utc(2022, 7, 13),
  //     programmation: [],
  //   ),
  //   // NOTE : Batman
  //   FilmModel(
  //     id: 'f11',
  //     titre: 'THE BATMAN',
  //     synopsis:
  //         'Lorsqu\'un tueur s\'en prend à l\'élite de Gotham par une série de machinations sadiques, une piste d\'indices cryptiques envoie Bruce Wayne alias Batman sur une enquête dans la pègre, où il rencontre des personnages tels que Selina Kyle, alias Catwoman, Oswald Cobblepot, alias le Pingouin, Carmine Falcone et Edward Nashton, alias l’Homme-Mystère.',
  //     realisateur: ['Matt Reeves'],
  //     label: '',
  //     langue: 'vost',
  //     affiche: 'assets/img/batman_poster.jpg',
  //     genre: [
  //       'Action',
  //       'Thriller',
  //       'Policier',
  //     ],
  //     note: 5,
  //     duree: const Duration(hours: 2, minutes: 56),
  //     dateDeSortie: DateTime.utc(2022, 3, 2),
  //     programmation: [
  //       DateTime.utc(2022, 3, 2, 11, 15),
  //       DateTime.utc(2022, 3, 2, 17),
  //       DateTime.utc(2022, 3, 2, 20, 30),
  //     ],
  //   ),
  //   // NOTE : Aristocrats
  //   FilmModel(
  //     id: 'f12',
  //     titre: 'ARISTOCRATS',
  //     synopsis:
  //         'A presque 30 ans, Hanako est toujours célibataire, ce qui déplait à sa famille, riche et traditionnelle. Quand elle croit avoir enfin trouvé l’homme de sa vie, elle réalise qu’il entretient déjà une relation ambiguë avec une hôtesse récemment installée à Tokyo.',
  //     label: '',
  //     langue: 'vost',
  //     affiche: 'assets/img/aristocrats_poster.jpg',
  //     realisateur: [
  //       'Yukiko Sode',
  //     ],
  //     genre: [
  //       'Drame',
  //     ],
  //     note: 4,
  //     duree: const Duration(hours: 2, minutes: 5),
  //     dateDeSortie: DateTime.utc(2022, 3, 30),
  //     programmation: [
  //       DateTime.utc(2022, 3, 30, 9),
  //       DateTime.utc(2022, 3, 30, 11, 30),
  //       DateTime.utc(2022, 3, 30, 14),
  //       DateTime.utc(2022, 3, 30, 16, 35),
  //       DateTime.utc(2022, 3, 30, 19, 10),
  //       DateTime.utc(2022, 3, 30, 21, 50),
  //     ],
  //   ),
  //   // NOTE : Aristocrats
  //   FilmModel(
  //     id: 'f13',
  //     titre: 'LA RUSE',
  //     synopsis:
  //         'L’histoire extraordinaire de deux officiers du renseignement britannique qui ont bouleversé le cours de la Seconde Guerre mondiale. Ils ont ainsi sauvé des dizaines de milliers de vies humaines et brisé la mainmise d’Hitler sur l’Europe en faisant appel au plus improbable des agents secrets : un cadavre.',
  //     label: 'NOUVEAU',
  //     langue: 'vost',
  //     affiche: 'assets/img/ruse_poster.jpg',
  //     realisateur: [
  //       'John Madden',
  //     ],
  //     genre: [
  //       'Drame',
  //       'Guerre',
  //       'Historique',
  //     ],
  //     note: 5,
  //     duree: const Duration(hours: 2, minutes: 8),
  //     dateDeSortie: DateTime.utc(2022, 4, 27),
  //     programmation: [
  //       DateTime.utc(2022, 3, 30, 9),
  //       DateTime.utc(2022, 3, 30, 11, 30),
  //       DateTime.utc(2022, 3, 30, 14, 5),
  //       DateTime.utc(2022, 3, 30, 16, 40),
  //       DateTime.utc(2022, 3, 30, 19, 15),
  //       DateTime.utc(2022, 3, 30, 21, 50),
  //     ],
  //   ),
  //   // NOTE : Babysitter
  //   FilmModel(
  //     id: 'f14',
  //     titre: 'BABYSITTER',
  //     synopsis:
  //         'Suite à une blague sexiste devenue virale, Cédric, jeune papa, est suspendu par son employeur. Pour se racheter, il va avec l\'aide de son frère Jean-Michel, s\'interroger sur les fondements de sa misogynie à travers l’écriture d’un livre.',
  //     label: 'NOUVEAU',
  //     langue: 'vf',
  //     affiche: 'assets/img/babysitter_poster.jpg',
  //     realisateur: [
  //       'Monia Chokri',
  //     ],
  //     genre: [
  //       'Comédie',
  //     ],
  //     note: 4,
  //     duree: const Duration(hours: 1, minutes: 27),
  //     dateDeSortie: DateTime.utc(2022, 4, 27),
  //     programmation: [
  //       DateTime.utc(2022, 3, 30, 9, 5),
  //       DateTime.utc(2022, 3, 30, 10, 55),
  //       DateTime.utc(2022, 3, 30, 14, 45),
  //       DateTime.utc(2022, 3, 30, 16, 40),
  //       DateTime.utc(2022, 3, 30, 18, 35),
  //       DateTime.utc(2022, 3, 30, 20, 30),
  //       DateTime.utc(2022, 3, 30, 22, 20),
  //     ],
  //   ),
  //   // NOTE : Famille Afghane
  //   FilmModel(
  //     id: 'f15',
  //     titre: 'MA FAMILLE AFGHANE',
  //     synopsis:
  //         'Kaboul, Afghanistan, 2001. Herra est une jeune femme d’origine tchèque qui, par amour, décide de tout quitter pour suivre celui qui deviendra son mari, Nazir. Elle devient alors la témoin et l’actrice des bouleversements que sa nouvelle famille afghane vit au quotidien.',
  //     label: 'NOUVEAU',
  //     langue: 'vost',
  //     affiche: 'assets/img/afghane_poster.jpg',
  //     realisateur: [
  //       'Michaela Pavlatova',
  //     ],
  //     genre: [
  //       'Drame',
  //       'Animation',
  //     ],
  //     note: 4,
  //     duree: const Duration(hours: 1, minutes: 20),
  //     dateDeSortie: DateTime.utc(2022, 4, 27),
  //     programmation: [
  //       DateTime.utc(2022, 3, 30, 9, 15),
  //       DateTime.utc(2022, 3, 30, 11),
  //       DateTime.utc(2022, 3, 30, 12, 45),
  //       DateTime.utc(2022, 3, 30, 14, 30),
  //       DateTime.utc(2022, 3, 30, 16, 15),
  //       DateTime.utc(2022, 3, 30, 18),
  //       DateTime.utc(2022, 3, 30, 19, 45),
  //       DateTime.utc(2022, 3, 30, 21, 30),
  //     ],
  //   ),
  // ];

  // <> Constructor
  const FilmsDatas({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
