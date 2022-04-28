import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugc/components/cinema_card.dart';
import 'package:ugc/models/cinema_model.dart';
import 'package:ugc/models/film_model.dart';

import '../../components/seance_card.dart';
import '../../providers/cinemas_provider.dart';

// <> SeanceList()
class SeanceList extends StatelessWidget {
  // =
  final FilmModel film;
  final List<DateTime> programmation;
  // <> Constructor
  const SeanceList({
    Key? key,
    required this.film,
    required this.programmation,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data
    final List<CinemaModel> cinemas =
        Provider.of<CinemasProvider>(context).getCinemasFilm(film);

    return ListView.builder(
      itemCount: cinemas.length,
      itemBuilder: (context, i) {
        final CinemaModel cine = cinemas[i];
        return Column(
          children: [
            CinemaCard(
              cine: cine,
            ),
            SizedBox(
              height: 225,
              child: SeanceCard(
                film: film,
                programmation: programmation,
              ),
            ),
          ],
        );
      },
    );
  }
}
