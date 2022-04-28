import 'package:flutter/material.dart';
import '../../components/film_poster_card.dart';
import '../../models/film_model.dart';

// <> FilmList()
class FilmList extends StatelessWidget {
  // =
  final List<FilmModel> films;

  // <> Constructor
  const FilmList({Key? key, required this.films}) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      childAspectRatio: 0.7,
      children: [
        ...films.map(
          (film) => FilmPosterCard(film: film),
        ),
      ],
    );
  }
}
