import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ugc/details/film_details_view.dart';
import '../../services/providers/films_provider.dart';
import '../../components/label.dart';
import '../../../services/models/film_model.dart';

// <> CinemaFilmInfo()
class CinemaFilmInfo extends StatelessWidget {
  // =
  final FilmModel film;
  final bool more;
  final VoidCallback seeMore;
  // <> Constructor
  const CinemaFilmInfo({
    Key? key,
    required this.film,
    required this.more,
    required this.seeMore,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data
    final String duree =
        Provider.of<FilmsProvider>(context).getFilmDuration(film);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, FilmDetailsView.route,
                arguments: film),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Image(
                    image: AssetImage(film.affiche),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Label(film: film),
                        SizedBox(
                          width: 150,
                          child: Text(
                            film.titre + ' ($duree)',
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 25,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: film.genre.length,
                                  itemBuilder: (context, i) => Text(
                                    i + 1 != film.genre.length
                                        ? film.genre[i] + ', '
                                        : film.genre[i],
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              child: Text(
                                'De ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 25,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: film.realisateur.length,
                                  itemBuilder: (context, i) => Text(
                                    i + 1 != film.realisateur.length
                                        ? film.realisateur[i] + ', '
                                        : film.realisateur[i],
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Sortie : ' +
                              DateFormat('dd MMMM y').format(film.dateDeSortie),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            child: Stack(
              children: [
                Text(
                  film.synopsis,
                  maxLines: more == false ? 3 : null,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Container(
                  height: more == false ? 65 : 0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.2,
                        0.4,
                        0.7,
                        0.7,
                      ],
                      colors: [
                        Colors.transparent,
                        Colors.white10,
                        Colors.white54,
                        Color.fromARGB(190, 255, 255, 255),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => seeMore(),
            child: Text(
              more == false ? 'VOIR PLUS' : 'VOIR MOINS',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
