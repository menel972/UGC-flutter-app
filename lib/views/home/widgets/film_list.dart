import 'package:flutter/material.dart';
import '../../components/film_poster_card.dart';
import '../../../services/models/film_model.dart';

import '../../../services/utils/color.dart' as color;

// <> FilmList()
class FilmList extends StatelessWidget {
  // =
  final Stream<List<FilmModel>> filmsStream;

  // <> Constructor
  const FilmList({Key? key, required this.filmsStream}) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FilmModel>>(
        stream: filmsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final films = snapshot.data!;
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.7,
              children: [
                ...films.map(
                  // <!> FilmPosterCard()
                  (film) => FilmPosterCard(filmId: film.id),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error : ${snapshot.error.toString()}');
          }
          return const CircularProgressIndicator(
            color: color.primary,
          );
        });
  }
}
