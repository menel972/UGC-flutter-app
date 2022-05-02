import 'package:flutter/material.dart';
import 'package:ugc/services/database/films_crud.dart';
import '../../services/models/film_model.dart';

import '../../services/utils/color.dart' as color;

// <> Note()
class Note extends StatefulWidget {
  // =
  final String filmId;
  final bool set;

  // <> Constructor
  const Note({
    Key? key,
    required this.filmId,
    required this.set,
  }) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {

// <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FilmModel>(
        stream: FilmsCrud.fetchById(widget.filmId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final film = snapshot.data!;
            final int note = widget.set == false ? film.note : film.userNote;
            return Row(
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  onPressed: widget.set == false
                      ? () {}
                      : () => FilmsCrud.commitNote(film.id, 1),
                  icon: Icon(
                    note > 0 ? Icons.star : Icons.star_border,
                    color: color.primary,
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  onPressed: widget.set == false
                      ? () {}
                      : () => FilmsCrud.commitNote(film.id, 2),
                  icon: Icon(
                    note > 1 ? Icons.star : Icons.star_border,
                    color: color.primary,
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  onPressed: widget.set == false
                      ? () {}
                      : () => FilmsCrud.commitNote(film.id, 3),
                  icon: Icon(
                    note > 2 ? Icons.star : Icons.star_border,
                    color: color.primary,
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  onPressed: widget.set == false
                      ? () {}
                      : () => FilmsCrud.commitNote(film.id, 4),
                  icon: Icon(
                    note > 3 ? Icons.star : Icons.star_border,
                    color: color.primary,
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  onPressed: widget.set == false
                      ? () {}
                      : () => FilmsCrud.commitNote(film.id, 5),
                  icon: Icon(
                    note > 4 ? Icons.star : Icons.star_border,
                    color: color.primary,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error');
          }
          return const CircularProgressIndicator();
        });
  }
}
