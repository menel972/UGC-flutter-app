import 'package:flutter/material.dart';
import 'package:ugc/views/components/cinema_card.dart';
import '../../../services/models/cinema_model.dart';

// <> CinemaList()
class CinemaList extends StatelessWidget {
  // =
  final Stream<List<CinemaModel>> cinemasStream;
  // <> Constructor
  const CinemaList({
    Key? key,
    required this.cinemasStream,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CinemaModel>>(
        stream: cinemasStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cinemas = snapshot.data!;
            return GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 2,
              children: [
                ...cinemas.map(
                  (cine) => Column(
                    children: [
                      CinemaCard(
                        cineId: cine.id,
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
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error');
          }
          return const CircularProgressIndicator();
        });
  }
}
