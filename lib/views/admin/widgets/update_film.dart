import 'package:flutter/material.dart';
import 'package:ugc/services/database/films_crud.dart';
import 'package:ugc/services/models/film_model.dart';

import 'package:ugc/services/utils/color.dart' as color;
import 'package:ugc/views/admin/update_view.dart';

// <> UpdateFilm()
class UpdateFilm extends StatefulWidget {
  // <> Constructor
  const UpdateFilm({Key? key}) : super(key: key);

  @override
  State<UpdateFilm> createState() => _UpdateFilmState();
}

// <> _UpdateFilmState()
class _UpdateFilmState extends State<UpdateFilm> {
  final TextEditingController _searchControl = TextEditingController();

  @override
  void dispose() {
    _searchControl.dispose();
    super.dispose();
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FilmModel>>(
        stream: FilmsCrud.fetchWithFilter(_searchControl.text),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final films = snapshot.data!;
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
                            hintStyle: Theme.of(context).textTheme.displaySmall,
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
                    itemCount: films.length,
                    itemBuilder: (context, i) {
                      final film = films[i];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: ListTile(
                          onTap: () => Navigator.pushNamed(
                              context, UpdateView.route,
                              arguments: {
                                'type': 'film',
                                'content': film,
                              }),
                          leading: Image(
                            image: AssetImage(film.affiche),
                          ),
                          title: Text(film.titre + ' (${film.duree})'),
                          trailing: Text(film.note.toString() + '/5'),
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
