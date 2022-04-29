import 'package:cloud_firestore/cloud_firestore.dart';

class FireCrud {
  static Future merge(Film newFilm) async {
    DocumentReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film').doc();

    Map<String, dynamic> filmToJson = newFilm.toJson(db.id);

    await db
        .set(filmToJson)
        // ignore: avoid_print
        .then((value) => print(newFilm.titre + ' a été ajouté'))
        // ignore: avoid_print
        .catchError((e) => print(e.toString()));
  }

  static Stream<List<Cine>> fetch() {
    Stream<QuerySnapshot<Map<String, dynamic>>> db =
        FirebaseFirestore.instance.collection('film').snapshots();

    return db.map(
        (snap) => snap.docs.map((doc) => Cine.fromJson(doc.data())).toList());
  }

  static Stream<List<Cine>> fetchByFilm(String title) {
    Stream<QuerySnapshot<Map<String, dynamic>>> db =
        FirebaseFirestore.instance.collection('film').snapshots();

    return db.map((snap) => snap.docs
        .map((doc) => Cine.fromJson(doc.data()))
        .toList()
        .where((cine) => cine.films.contains(title))
        .toList());
  }

  static Future deleteById(String id) async {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    await db
        .doc(id)
        .delete()
        // ignore: avoid_print
        .then((value) => print('supprimé'))
        // ignore: avoid_print
        .catchError((e) => print(e.toString()));
  }
}

class Cine {
  final String id;
  final String nom;
  final String adress;
  final dynamic tarifs;
  final List<dynamic> films;
  bool favori;

  Cine({
    required this.id,
    required this.nom,
    required this.adress,
    required this.tarifs,
    required this.films,
    required this.favori,
  });

  Map<String, dynamic> toJson(String docId) => {
        'id': docId,
        'nom': nom,
        'adress': adress,
        'tarifs': tarifs,
        'films': films,
        'favori': favori,
      };

  static Cine fromJson(Map<String, dynamic> json) => Cine(
        id: json['id'],
        nom: json['nom'],
        adress: json['adress'],
        tarifs: json['tarifs'],
        films: json['films'],
        favori: json['favori'],
      );
}

class Film {
  final String id;
  final String titre;
  final String synopsis;
  final String label;
  final String langue;
  final String affiche;
  final List<dynamic> realisateur;
  final List<dynamic> genre;
  int note;
  final String duree;
  final DateTime dateDeSortie;
  final List<DateTime> programmation;

  Film({
    required this.id,
    required this.titre,
    required this.synopsis,
    required this.label,
    required this.langue,
    required this.affiche,
    required this.realisateur,
    required this.genre,
    required this.note,
    required this.duree,
    required this.dateDeSortie,
    required this.programmation,
  });

  Map<String, dynamic> toJson(String docId) => {
        'id': docId,
        'titre': titre,
        'synopsis': synopsis,
        'label': label,
        'langue': langue,
        'affiche': affiche,
        'realisateur': realisateur,
        'genre': genre,
        'note': note,
        'duree': duree,
        'dateDeSortie': dateDeSortie,
        'programmation': programmation,
      };

  static Film fromJson(Map<String, dynamic> json) => Film(
        id: json['id'],
        titre: json['titre'],
        synopsis: json['synopsis'],
        label: json['label'],
        langue: json['langue'],
        affiche: json['affiche'],
        realisateur: json['realisateur'],
        genre: json['genre'],
        note: json['note'],
        duree: json['duree'],
        dateDeSortie: json['dateDeSortie'],
        programmation: json['programmation'],
      );
}
