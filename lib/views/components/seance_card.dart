import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ugc/services/database/films_crud.dart';
import '../../services/models/film_model.dart';

import '../../services/utils/color.dart' as color;

// <> SeanceCard()
class SeanceCard extends StatelessWidget {
  // =
  final String filmId;
  // <> Constructor
  const SeanceCard({
    Key? key,
    required this.filmId,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FilmModel>(
        stream: FilmsCrud.fetchById(filmId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final film = snapshot.data!;
            return GridView.count(
              padding: const EdgeInsets.only(right: 80),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              physics: const ScrollPhysics(),
              children: [
                ...film.programmation.map(
                  (Timestamp seance) {
                    final DateTime fin = seance
                        .toDate()
                        .add(film.dureeToDuration(film.duree))
                        .add(const Duration(minutes: 20));

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
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 8),
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
                                      DateFormat('Hm').format(seance.toDate()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Text(
                                      '(${DateFormat('Hm').format(fin)})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
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
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('Thre is an error');
          }
          return const CircularProgressIndicator();
        });
  }
}
