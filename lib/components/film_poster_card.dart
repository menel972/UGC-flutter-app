import 'package:flutter/material.dart';
import 'package:ugc/components/label.dart';
import 'package:ugc/details/film_details_view.dart';
import '../../services/models/film_model.dart';

// <> FilmPosterCard()
class FilmPosterCard extends StatelessWidget {
  // =
  final FilmModel film;
  // <> Constructor
  const FilmPosterCard({Key? key, required this.film}) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = dimension
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 2, left: 0, right: 0, top: 0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, FilmDetailsView.route,
            arguments: film),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              image: AssetImage(film.affiche),
              fit: BoxFit.fill,
              child: Container(
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
      ),
    );
  }
}
