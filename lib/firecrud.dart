import 'package:cloud_firestore/cloud_firestore.dart';

class FireCrud {
  static Future merge(Cine newCine) async {
    DocumentReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film').doc();

    Map<String, dynamic> cineJson = newCine.toJson(db.id);

    await db
        .set(cineJson)
        // ignore: avoid_print
        .then((value) => print(newCine.nom + ' a été ajouté'))
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
