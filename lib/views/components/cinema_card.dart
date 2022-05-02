import 'package:flutter/material.dart';
import 'package:ugc/services/database/cinemas_crud.dart';

import '../../services/models/cinema_model.dart';
import '../../services/utils/color.dart' as color;
import 'cinema/cinema_details_view.dart';

// <> CinemaCard()
class CinemaCard extends StatelessWidget {
  // =
  final String cineId;
  // TODO : changer cette fonction
  // <> Constructor
  const CinemaCard({
    Key? key,
    required this.cineId,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // =
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0,
      child: StreamBuilder<CinemaModel>(
          stream: CinemasCrud.fetchById(cineId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final CinemaModel cine = snapshot.data!;
              return InkWell(
                onTap: () => Navigator.pushNamed(
                    context, CinemaDetailsView.route,
                    arguments: cine),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 15, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ugc ciné cité ${cine.nom}'.toUpperCase(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            width: width * 0.35,
                            child: Text(
                              cine.adress,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: cine.favori == true
                            ? const Icon(
                                Icons.favorite,
                                color: color.secondary,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: color.label,
                              ),
                        onPressed: () {
                          CinemasCrud.switchToFavorite(context, cine);
                          CinemasCrud.commitFavorite(cine);
                        },
                      ),
                      // TODO : Verifier si ça fonctionne !
                      // if (cine.favori == true) ...[
                      //   switchFavoriteCinema != null
                      //       ? IconButton(
                      //           onPressed: () => {
                      //             switchFavoriteCinema!(cine),
                      //             ScaffoldMessenger.of(context).showSnackBar(
                      //               SnackBar(
                      //                 content: Text(
                      //                   'UGC ${cine.nom} a été retiré de vos favoris !',
                      //                   style: Theme.of(context)
                      //                       .textTheme
                      //                       .labelSmall,
                      //                 ),
                      //                 backgroundColor: Colors.black45,
                      //               ),
                      //             )
                      //           },
                      //           icon: const Icon(Icons.favorite),
                      //           color: color.secondary,
                      //         )
                      //       : const Icon(
                      //           Icons.favorite,
                      //           color: color.secondary,
                      //         ),
                      // ] else
                      //   switchFavoriteCinema != null
                      //       ? IconButton(
                      //           onPressed: () => {
                      //             switchFavoriteCinema!(cine),
                      //             ScaffoldMessenger.of(context).showSnackBar(
                      //               SnackBar(
                      //                 content: Text(
                      //                   'UGC ${cine.nom} a été ajouté à vos favoris !',
                      //                   style: Theme.of(context)
                      //                       .textTheme
                      //                       .labelSmall,
                      //                 ),
                      //                 backgroundColor: Colors.black45,
                      //               ),
                      //             )
                      //           },
                      //           icon: const Icon(Icons.favorite_border),
                      //           color: color.label,
                      //         )
                      //       : const Icon(
                      //           Icons.favorite_border,
                      //           color: color.label,
                      //         ),
                    ],
                  ),
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
