import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:ugc/datas/cinemas_datas.dart';
import 'package:ugc/models/cinema_model.dart';
import 'package:ugc/models/film_model.dart';
// import 'package:http/http.dart' as http;

class CinemasProvider with ChangeNotifier {
  final CollectionReference _cinemaDb =
      FirebaseFirestore.instance.collection('cinema');

  Future<void> add() {
    return _cinemaDb.add({'type': 2});
  }

  Future<QuerySnapshot<Object?>> fetch() async {
    return await _cinemaDb.get();
  }

  void id() {
    print(_cinemaDb.doc().get());
  }

  final List<CinemaModel> _cinemas = CinemasDatas.cinemas;

  List<CinemaModel> get cinemas => _cinemas;

  void switchFavoriteCinema(CinemaModel cine) {
    int i = cinemas.indexOf(cine);
    cinemas[i].favori = !cinemas[i].favori;
  }

  List<CinemaModel> get favoriteCinemas =>
      cinemas.where((CinemaModel cine) => cine.favori == true).toList();

  List<CinemaModel> getCinemasFilm(FilmModel film) => cinemas
      .where((CinemaModel cine) => cine.films.contains(film.titre))
      .toList();
}
