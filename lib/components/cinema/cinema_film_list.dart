import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugc/components/seance_card.dart';
import 'package:ugc/models/cinema_model.dart';
import 'package:ugc/models/film_model.dart';
import 'package:ugc/providers/films_provider.dart';

import 'cinema_film_info.dart';

// <> CinemaFilmList()
class CinemaFilmList extends StatelessWidget {
  // =
  final CinemaModel cinema;
  final bool more;
  final VoidCallback seeMore;
  // <> Constructor
  const CinemaFilmList({
    Key? key,
    required this.cinema,
    required this.more,
    required this.seeMore,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data
    final List<FilmModel> cinemaFilmList =
        Provider.of<FilmsProvider>(context).getCinemaFilmList(cinema);

    return ListView.builder(
      itemCount: cinemaFilmList.length,
      itemBuilder: (context, i) {
        final FilmModel film = cinemaFilmList[i];

        return Column(
          children: [
            CinemaFilmInfo(
              film: film,
              more: more,
              seeMore: seeMore,
            ),
            SizedBox(
                height: 225,
                child:
                    SeanceCard(film: film, programmation: film.programmation))
          ],
        );
      },
    );
  }
}
