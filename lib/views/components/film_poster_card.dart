import 'package:flutter/material.dart';
import 'package:ugc/services/database/films_crud.dart';
import 'package:ugc/services/models/film_model.dart';
import 'package:ugc/views/components/label.dart';
import 'package:ugc/views/details/film_details_view.dart';

// <> FilmPosterCard()
class FilmPosterCard extends StatelessWidget {
  // =
  final String filmId;
  // <> Constructor
  const FilmPosterCard({Key? key, required this.filmId}) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = dimension
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 2, left: 0, right: 0, top: 0),
      child: StreamBuilder<FilmModel>(
          stream: FilmsCrud.fetchById(filmId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final FilmModel film = snapshot.data!;
              return GestureDetector(
                // <!> FilmDetailsView()
                onTap: () => Navigator.pushNamed(context, FilmDetailsView.route,
                    arguments: film.id),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: film.affiche,
                      child: Image(
                        image: AssetImage(film.affiche),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      width: width * 0.45,
                      bottom: 10,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Label(film: film),
                          Text(
                            film.titre.toUpperCase(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              // ignore: avoid_print
              print('There is an error');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
