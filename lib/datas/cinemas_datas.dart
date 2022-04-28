import 'package:flutter/material.dart';

import '../models/cinema_model.dart';

// <> CinemasDatas()
class CinemasDatas extends InheritedWidget {
  // =
  static List<CinemaModel> cinemas = [
    // NOTE : Les Halles
    CinemaModel(
      id: 'c1',
      nom: 'Les Halles',
      adress: 'Forum des Halles - Niveau -3 75001 PARIS',
      tarifs: {
        '-14 ans': 6.5,
        'avant 12h': 8.5,
        'groupe +14 ans': 8.5,
        '-26 ans': 8.5,
        'plein tarif': 13.9,
      },
      films: [
        'LE SECRET DE LA CITE PERDUE',
        'LES SEGPA',
        'OGRE',
        'QU\'EST-CE QU\'ON A TOUS FAIT AU BON DIEU ?',
        'GOLIATH',
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'SONIC 2 LE FILM',
        'THE BATMAN',
        'ARISTOCRATS',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
        'MA FAMILLE AFGHANE',
        'BABYSITTER',
        'LA RUSE',
      ],
      favori: false,
    ),
    // NOTE : Grand Normandie
    CinemaModel(
      id: 'c2',
      nom: 'Grand Normandie',
      adress: '116 bis, avenue des Champs-Elysées 75008 PARIS',
      tarifs: {
        '-14 ans': 6.5,
        'avant 12h': 8.5,
        '-26 ans': 8.5,
        'plein tarif': 14.9,
      },
      films: [
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
      ],
      favori: false,
    ),
    // NOTE : Montparnasse
    CinemaModel(
      id: 'c3',
      nom: 'Montparnasse',
      adress: '83, boulevard du Montparnasse 75006 PARIS',
      tarifs: {
        '-14 ans': 6.5,
        'avant 12h': 8.5,
        'groupe +14 ans': 6.5,
        '-26 ans': 8.5,
        'plein tarif': 13.1,
      },
      films: [
        'LE SECRET DE LA CITE PERDUE',
        'QU\'EST-CE QU\'ON A TOUS FAIT AU BON DIEU ?',
        'GOLIATH',
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
        'LA RUSE',
      ],
      favori: false,
    ),
    // NOTE : Bercy
    CinemaModel(
      id: 'c4',
      nom: 'Bercy',
      adress: '2, cour Saint Emilion 75012 PARIS',
      tarifs: {
        '-14 ans': 4.9,
        'avant 11h': 7.2,
        'groupe +14 ans': 7.5,
        '-26 ans': 4.9,
        'plein tarif': 12.1,
      },
      films: [
        'LE SECRET DE LA CITE PERDUE',
        'LES SEGPA',
        'OGRE',
        'QU\'EST-CE QU\'ON A TOUS FAIT AU BON DIEU ?',
        'GOLIATH',
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'SONIC 2 LE FILM',
        'THE BATMAN',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
        'MA FAMILLE AFGHANE',
        'BABYSITTER',
        'LA RUSE',
      ],
      favori: false,
    ),
  ];

  // <> Constructor
  const CinemasDatas({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
