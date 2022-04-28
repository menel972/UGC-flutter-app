import 'package:flutter/material.dart';
import 'package:ugc/models/film_model.dart';

import '../utils/color.dart' as color;

// <> Label()
class Label extends StatelessWidget {
  // =
  final FilmModel film;
  // <> Constructor
  const Label({Key? key, required this.film}) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return film.label != ''
        ? Container(
            color: color.text,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            margin: const EdgeInsets.only(bottom: 6),
            child: Text(
              film.label.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          )
        : Container();
  }
}
