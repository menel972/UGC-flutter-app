import 'package:flutter/material.dart';
import 'package:ugc/home/home_view.dart';

import '../../services/utils/color.dart' as color;

// <> Resa()
class Resa extends StatelessWidget {
  // <> Constructor
  const Resa({Key? key}) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            'Vous n\'avez pas de réservation pour le moment',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.symmetric(horizontal: 45),
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => color.secondary)),
          onPressed: () => Navigator.pushNamed(context, HomeView.route),
          child: Text(
            'réserver une séance'.toUpperCase(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ],
    );
  }
}
