import 'package:flutter/material.dart';
import 'package:ugc/services/database/cinemas_crud.dart';
import 'package:ugc/views/components/cinema_card.dart';
import '../../../services/models/cinema_model.dart';
import '../../../services/models/film_model.dart';

import '../../components/seance_card.dart';

// <> SeanceList()
class SeanceList extends StatelessWidget {
  // =
  final FilmModel film;
  // <> Constructor
  const SeanceList({
    Key? key,
    required this.film,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CinemaModel>>(
        stream: CinemasCrud.fetchByFilm(film),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cinemas = snapshot.data!;
            return ListView.builder(
              itemCount: cinemas.length,
              itemBuilder: (context, i) {
                final CinemaModel cine = cinemas[i];
                return Column(
                  children: [
                    CinemaCard(
                      cineId: cine.id,
                    ),
                    SizedBox(
                      height: 225,
                      child: SeanceCard(
                        filmId: film.id,
                      ),
                    ),
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
