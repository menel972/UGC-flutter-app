import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../../services/models/cinema_model.dart';
import '../../services/models/film_model.dart';
import '../../datas/films_datas.dart';

class FilmsProvider with ChangeNotifier {
  final List<FilmModel> _films = FilmsDatas.films;

  UnmodifiableListView<FilmModel> get films => UnmodifiableListView(_films);

  UnmodifiableListView<FilmModel> get newFilms {
    return UnmodifiableListView(films.where((film) {
      int diff = film.dateDeSortie.difference(DateTime.now()).inDays;

      return diff > -7 && diff < 1;
    }).toList());
  }

  UnmodifiableListView<FilmModel> get currentFilms {
    return UnmodifiableListView(films.where((film) {
      int diff = film.dateDeSortie.difference(DateTime.now()).inDays;

      return diff < 1;
    }).toList());
  }

  UnmodifiableListView<FilmModel> get futurFilms {
    return UnmodifiableListView(films.where((film) {
      int diff = film.dateDeSortie.difference(DateTime.now()).inDays;

      return diff > 0;
    }).toList());
  }

  UnmodifiableListView<FilmModel> get labelFilms =>
      UnmodifiableListView(films.where((film) => film.label != '').toList());

  UnmodifiableListView<FilmModel> getCinemaFilmList(CinemaModel cinema) =>
      UnmodifiableListView(
          films.where((film) => cinema.films.contains(film.titre)).toList());

  String getFilmDuration(FilmModel film) {
    return film.duree.toString().substring(0, 4).split(':').join('H');
  }

  List<DateTime> programmation(FilmModel film) => film.programmation
      .where((DateTime date) => !(date.hour - DateTime.now().hour).isNegative)
      .toList();
}
