import 'package:flutter/material.dart';
import 'package:ugc/models/film_model.dart';

import '../utils/color.dart' as color;

// <> Note()
class Note extends StatefulWidget {
  // =
  final FilmModel film;
  final bool set;

  // <> Constructor
  const Note({
    Key? key,
    required this.film,
    required this.set,
  }) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  late int myNote;

  // {}
  void setMyNote(int note) {
    setState(() {
      myNote = note;
    });
  }

  @override
  void initState() {
    super.initState();
    myNote = widget.set == false ? widget.film.note : 0;
  }

// <> Build

// <> Build
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          visualDensity: VisualDensity.compact,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          onPressed: widget.set == false ? () {} : () => setMyNote(1),
          icon: Icon(
            myNote > 0 ? Icons.star : Icons.star_border,
            color: color.primary,
          ),
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          onPressed: widget.set == false ? () {} : () => setMyNote(2),
          icon: Icon(
            myNote > 1 ? Icons.star : Icons.star_border,
            color: color.primary,
          ),
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          onPressed: widget.set == false ? () {} : () => setMyNote(3),
          icon: Icon(
            myNote > 2 ? Icons.star : Icons.star_border,
            color: color.primary,
          ),
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          onPressed: widget.set == false ? () {} : () => setMyNote(4),
          icon: Icon(
            myNote > 3 ? Icons.star : Icons.star_border,
            color: color.primary,
          ),
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          onPressed: widget.set == false ? () {} : () => setMyNote(5),
          icon: Icon(
            myNote > 4 ? Icons.star : Icons.star_border,
            color: color.primary,
          ),
        ),
      ],
    );
  }
}
