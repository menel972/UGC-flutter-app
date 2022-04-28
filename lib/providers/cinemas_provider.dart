import 'package:flutter/widgets.dart';
import 'package:ugc/datas/cinemas_datas.dart';
import 'package:ugc/models/cinema_model.dart';
import 'package:ugc/models/film_model.dart';
// import 'package:http/http.dart' as http;

class CinemasProvider with ChangeNotifier {
  // fetchData(){
  //   http.get(url)
  // }

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
