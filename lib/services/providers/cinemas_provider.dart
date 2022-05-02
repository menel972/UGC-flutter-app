import 'package:flutter/widgets.dart';
import 'package:ugc/datas/cinemas_datas.dart';
import '../../services/models/cinema_model.dart';
import '../../services/models/film_model.dart';

class CinemasProvider with ChangeNotifier {
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
