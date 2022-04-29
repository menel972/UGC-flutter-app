import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ugc/services/models/cinema_model.dart';
import 'package:ugc/services/models/film_model.dart';

class CinemasCrud {
  // {} CREATE / DELETE CINEMA
  static Future switchToFavorite(CinemaModel cine, BuildContext ctxt) async {
    CollectionReference<Map<String, dynamic>> favDb =
        FirebaseFirestore.instance.collection('favoriteCinema');

    Map<String, dynamic> cineJson = cine.toJson(favDb.id);

    switch (cine.favori) {
      case false:
        return await favDb
            .doc()
            .set(cineJson)
            // ignore: avoid_print
            .catchError((e) => print(e.toString()))
            .then((value) => ScaffoldMessenger.of(ctxt).showSnackBar(
                  SnackBar(
                    content: Text(cine.nom + ' ajouté aux favoris !'),
                  ),
                ));
      case true:
        return await favDb
            .doc(cine.id)
            .delete()
            // ignore: avoid_print
            .then((value) => print(cine.nom + ' n\'est plus favori'))
            // ignore: avoid_print
            .catchError((e) => print(e.toString()));
    }
  }
  // NOTE : Switch a cinema to the favorite list

  // {} READ CINEMAS
  static Stream<List<CinemaModel>> fetchAll() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('cinema');

    return db.snapshots().map((snap) =>
        snap.docs.map((doc) => CinemaModel.fromJson(doc.data())).toList());
  }
  // NOTE : Get all cinemas

  static Stream<CinemaModel> fetchById(String id) {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('cinema');

    return db
        .doc(id)
        .snapshots()
        .map((snap) => CinemaModel.fromJson(snap.data()!));
  }
  // NOTE : Get a cinema by its id

  static Stream<List<CinemaModel>> fetchByFilm(FilmModel film) {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('cinema');

    return db.snapshots().map((snap) => snap.docs
        .map((doc) => CinemaModel.fromJson(doc.data()))
        .toList()
        .where((cinema) => cinema.films.contains(film.titre))
        .toList());
  }
  // NOTE : Get all cinemas that play a given film

  static Stream<List<CinemaModel>> fetchFavoriteCinemas() {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('favoriteCinema');

    return db.snapshots().map((snap) =>
        snap.docs.map((doc) => CinemaModel.fromJson(doc.data())).toList());
  }
  // NOTE : Get all favorite cinemas

  // {} UPDATE CINEMA
  static Future commitFavorite(CinemaModel cine) async {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection('cinema');

    bool fav = !cine.favori;

    await db
        .doc()
        .update({'favori': fav})
        // ignore: avoid_print
        .then((value) => print('modifié'))
        // ignore: avoid_print
        .catchError((e) => print(e.toString()));
  }
  // NOTE : Switch status favori of a cinema
}
