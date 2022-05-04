import 'package:flutter/material.dart';
import 'package:ugc/services/database/cinemas_crud.dart';
import 'package:ugc/services/models/cinema_model.dart';

import '../../../services/utils/color.dart' as color;
import '../update_view.dart';

// <> UpdateCinema()
class UpdateCinema extends StatefulWidget {
  // <> Constructor
  const UpdateCinema({Key? key}) : super(key: key);

  @override
  State<UpdateCinema> createState() => _UpdateCinemaState();
}

// <>  _UpdateCinemaState()
class _UpdateCinemaState extends State<UpdateCinema> {
  final TextEditingController _searchControl = TextEditingController();

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CinemaModel>>(
        stream: CinemasCrud.fetchWithFilter(_searchControl.text),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cinemas = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) => setState(() {}),
                          controller: _searchControl,
                          cursorColor: color.primary,
                          decoration: InputDecoration(
                            hintText: 'Rechercher un film',
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: color.primary,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: color.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() {
                          _searchControl.clear();
                        }),
                        icon: const Icon(Icons.clear, size: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    itemCount: cinemas.length,
                    itemBuilder: (context, i) {
                      final cinema = cinemas[i];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: ListTile(
                          onTap: () => Navigator.pushNamed(
                              context, UpdateView.route,
                              arguments: {
                                'type': 'cine',
                                'content': cinema,
                              }),
                          leading: const Image(
                            image: AssetImage('assets/img/logo_ugc.png'),
                          ),
                          title: Text(cinema.nom),
                          trailing: cinema.favori == true
                              ? const Icon(
                                  Icons.favorite,
                                  color: color.secondary,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: color.label,
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error : ' + snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        });
  }
}
