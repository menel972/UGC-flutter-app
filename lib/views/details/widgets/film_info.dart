import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ugc/services/database/films_crud.dart';
import 'package:ugc/views/components/note.dart';
import '../../components/label.dart';
import '../../../services/models/film_model.dart';

import '../../../services/utils/color.dart' as color;

// <> FilmInfo()
class FilmInfo extends StatelessWidget {
  // =
  final String filmId;
  final VoidCallback setNote;
  // <> Constructor
  const FilmInfo({
    Key? key,
    required this.filmId,
    required this.setNote,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FilmModel>(
        stream: FilmsCrud.fetchById(filmId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final film = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Image(
                          image: AssetImage(film.affiche),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(film: film),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
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
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Sortie : ' +
                                    DateFormat('dd MMMM y')
                                        .format(film.dateDeSortie.toDate()),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              // <!> Note()
                              FittedBox(
                                child: Note(filmId: film.id, set: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton.icon(
                        onPressed: () => setNote(),
                        icon: const Icon(
                          Icons.star_border,
                          color: color.primary,
                        ),
                        label: Text(
                          'Noter ce film',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Stack(
                      children: [
                        Text(
                          film.synopsis,
                          maxLines: film.more == false ? 3 : null,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Container(
                          height: film.more == false ? 65 : 0,
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
                  // TODO : change la color quand on click
                  TextButton(
                    onPressed: () => FilmsCrud.commitMore(filmId, film.more),
                    child: Text(
                      film.more == false ? 'VOIR PLUS' : 'VOIR MOINS',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error');
          }
          return const CircularProgressIndicator();
        });
  }
}
