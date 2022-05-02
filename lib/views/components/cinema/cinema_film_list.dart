import 'package:flutter/material.dart';
import 'package:ugc/services/database/films_crud.dart';
import 'package:ugc/views/components/seance_card.dart';
import '../../../services/models/cinema_model.dart';
import '../../../services/models/film_model.dart';

import 'cinema_film_info.dart';

// <> CinemaFilmList()
class CinemaFilmList extends StatelessWidget {
  // =
  final CinemaModel cinema;

  // <> Constructor
  const CinemaFilmList({
    Key? key,
    required this.cinema,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FilmModel>>(
        stream: FilmsCrud.fetchByCinema(cinema),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final films = snapshot.data!;
            return ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, i) {
                final FilmModel film = films[i];

                return Column(
                  children: [
                    CinemaFilmInfo(
                      cineId: film.id,
                    ),
                    SizedBox(
                        height: 225,
                        child: SeanceCard(
                          filmId: film.id,
                        ))
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error');
          }
          return const CircularProgressIndicator();
        });
  }
}
