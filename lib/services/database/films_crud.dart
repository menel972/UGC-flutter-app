import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ugc/services/models/cinema_model.dart';
import 'package:ugc/services/models/film_model.dart';

class FilmsCrud {
  static CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('film');

  // {} CREATE FILM
  static Future pushFilm(FilmModel film) async {
    DocumentReference<Map<String, dynamic>> doc = db.doc();
    // ignore: avoid_print
    await doc.set(film.toJson(doc.id)).catchError((e) => print(e.toString()));
  }

  // {} READ FILMS
  static Stream<List<FilmModel>> fetchAll() {
    return db.snapshots().map((snap) =>
        snap.docs.map((doc) => FilmModel.fromJson(doc.data())).toList());
  }
  // NOTE : Get all films

  static Stream<FilmModel> fetchById(String id) {
    return db
        .doc(id)
        .snapshots()
        .map((snap) => FilmModel.fromJson(snap.data()!));
  }
  // NOTE : Get a film by its id

  static Stream<List<FilmModel>> fetchWithFilter(String filter) {
    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where(
            (film) => film.titre.toLowerCase().contains(filter.toLowerCase()))
        .toList());
  }
  // NOTE : Enable to fetch films that match with a filter

  static Stream<List<FilmModel>> fetchNew() {
    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) =>
            film.dateDeSortie.toDate().difference(DateTime.now()).inHours >=
                -168 &&
            film.dateDeSortie.toDate().difference(DateTime.now()).inHours <= 0)
        .toList());
  }
  // NOTE : Get new films

  static Stream<List<FilmModel>> fetchCurrent() {
    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) =>
            film.dateDeSortie.toDate().difference(DateTime.now()).inHours < 1)
        .toList());
  }
  // NOTE : Get current films

  static Stream<List<FilmModel>> fetchFuture() {
    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) =>
            film.dateDeSortie.toDate().difference(DateTime.now()).inHours > 0)
        .toList());
  }
  // NOTE : Get future films

  static Stream<List<FilmModel>> fetchLabel() {
    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) => film.label != '')
        .toList());
  }
  // NOTE : Get films with label

  static Stream<List<FilmModel>> fetchByCinema(CinemaModel cinema) {
    return db.snapshots().map((snap) => snap.docs
        .map((doc) => FilmModel.fromJson(doc.data()))
        .toList()
        .where((film) => cinema.films.contains(film.titre))
        .toList());
  }
  // NOTE : Get all films of a cinema

  // {} UPDATE FILMS
  static Future commitAll(FilmModel film) async {
    Map<String, dynamic> newFilmJson = film.toJson(film.id);

    await db
        .doc(film.id)
        .update(newFilmJson)
        // ignore: avoid_print
        .then((value) => print(film.titre + ' a été modifié'))
        // ignore: avoid_print
        .catchError((e) => print(e.toString()));
  }
  // NOTE : Update all values of film

  static Future commitNote(String id, int myNote) async {
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

  
  // {} REMOVE FILMS
  static Future removeById(String id) async {
    await db
        .doc(id)
        .delete()
        // ignore: avoid_print
        .catchError((e) => print(e.toString()));
  }
  // NOTE : Remove a film from the database
}
