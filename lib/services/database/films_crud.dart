import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ugc/services/models/cinema_model.dart';
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

  static Stream<FilmModel> fetchById(String id) {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db
        .doc(id)
        .snapshots()
        .map((snap) => FilmModel.fromJson(snap.data()!));
  }
  // NOTE : Get a film by its id

  static Stream<List<FilmModel>> fetchNew() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) =>
            film.dateDeSortie.toDate().difference(DateTime.now()).inDays > -7 &&
            film.dateDeSortie.toDate().difference(DateTime.now()).inDays < 1)
        .toList());
  }
  // NOTE : Get new films

  static Stream<List<FilmModel>> fetchCurrent() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where(
            (film) =>
            film.dateDeSortie.toDate().difference(DateTime.now()).inDays < 1)
        .toList());
  }
  // NOTE : Get current films

  static Stream<List<FilmModel>> fetchFuture() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where(
            (film) =>
            film.dateDeSortie.toDate().difference(DateTime.now()).inDays > 0)
        .toList());
  }
  // NOTE : Get future films

  static Stream<List<FilmModel>> fetchLabel() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) => film.label != '')
        .toList());
  }
  // NOTE : Get films with label

  static Stream<List<FilmModel>> fetchByCinema(CinemaModel cinema) {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) => cinema.films.contains(film.titre))
        .toList());
  }
  // NOTE : Get all films of a cinema

  // {} UPDATE FILMS
  static Future commitNote(String id, int myNote) async {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    await db
        .doc(id)
        .update({'userNote': myNote})
        // ignore: avoid_print
        .then((value) => print('userNote modifiée'))
        // ignore: avoid_print
        .catchError((e) => print(e.toString()));
  }
  // NOTE : Update film note

  static Future commitMore(String id, bool more) async {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('film');

    final bool newMore = !more;

    await db
        .doc(id)
        .update({'more': newMore})
        // ignore: avoid_print
        .then((value) => print('More modifiée'))
        // ignore: avoid_print
        .catchError((e) => print(e.toString()));
  }
  // NOTE : Update film more
}
