import 'package:flutter/material.dart';

import '../../../services/database/films_crud.dart';
import '../../../services/models/film_model.dart';

import '../../../services/utils/color.dart' as color;

class Removefilm extends StatefulWidget {
  const Removefilm({Key? key}) : super(key: key);

  @override
  State<Removefilm> createState() => _RemovefilmState();
}

final TextEditingController _searchControl = TextEditingController();

class _RemovefilmState extends State<Removefilm> {
  Future<bool> confirmModal(BuildContext context, FilmModel film) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        title: Text('Supprimer ${film.titre} ?'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Conserver',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Supprimer'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => color.secondary)),
          ),
        ],
      ),
    );
  }

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
                    itemCount: films.length,
                    itemBuilder: (context, i) {
                      final film = films[i];
                      return Dismissible(
                        key: ValueKey(film.id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          FilmsCrud.removeById(film.id);
                        },
                        confirmDismiss: (direction) =>
                            confirmModal(context, film),
                        background: Container(color: Colors.white),
                        secondaryBackground: Container(color: color.secondary),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(film.affiche),
                            ),
                            title: Text(film.titre + ' (${film.duree})'),
                            trailing: const Icon(
                              Icons.delete_forever,
                              color: color.secondary,
                            ),
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
