import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ugc/models/film_model.dart';

import '../utils/color.dart' as color;

// <> SeanceCard()
class SeanceCard extends StatelessWidget {
  // =
  final FilmModel film;
  final List<DateTime> programmation;
  // <> Constructor
  const SeanceCard({
    Key? key,
    required this.film,
    required this.programmation,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(right: 80),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      physics: const ScrollPhysics(),
      children: [
        ...programmation.map(
          (DateTime seance) {
            final DateTime fin = seance.add(film.duree);

            return Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 10,
                  color: color.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Text(
                            film.langue.toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Uniform',
                              color: film.langue == 'vf'
                                  ? color.accent
                                  : color.bkg,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              DateFormat('Hm').format(seance),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              '(${DateFormat('Hm').format(fin)})',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
