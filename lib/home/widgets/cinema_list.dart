import 'package:flutter/material.dart';
import 'package:ugc/components/cinema_card.dart';
import '../../models/cinema_model.dart';

// <> CinemaList()
class CinemaList extends StatelessWidget {
  // =
  final List<CinemaModel> cinemas;
  final Function(CinemaModel) switchFavoriteCinema;
  // <> Constructor
  const CinemaList({
    Key? key,
    required this.cinemas,
    required this.switchFavoriteCinema,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 2,
      children: [
        ...cinemas.map(
          (cine) => Column(
            children: [
              CinemaCard(
                cine: cine,
                switchFavoriteCinema: switchFavoriteCinema,
              ),
              const Divider(
                height: 0,
                indent: 15,
                endIndent: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
