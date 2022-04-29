import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ugc/services/models/film_model.dart';

class FilmsCrud {
  // {} READ FILMS
  static Stream<List<FilmModel>> fetchAll() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db.snapshots().map((snap) =>
        snap.docs.map((doc) => FilmModel.fromJson(doc.data())).toList());
  }
  // NOTE : Get all films

  static Stream<List<FilmModel>> fetchNew() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) =>
            film.dateDeSortie.difference(DateTime.now()).inDays > -7 &&
            film.dateDeSortie.difference(DateTime.now()).inDays < 1)
        .toList());
  }
  // NOTE : Get all films

  static Stream<List<FilmModel>> fetchCurrent() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');
  }
  // NOTE : Get all films

  static Stream<List<FilmModel>> fetchFuture() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');
  }
  // NOTE : Get all films

  static Stream<List<FilmModel>> fetchLabel() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');
  }
  // NOTE : Get all films

  static Stream<List<FilmModel>> fetchByCinema() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');
  }
  // NOTE : Get all films

}
