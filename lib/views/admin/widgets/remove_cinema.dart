import 'package:flutter/material.dart';

import '../../../services/database/cinemas_crud.dart';
import '../../../services/models/cinema_model.dart';

import '../../../services/utils/color.dart' as color;

class RemoveCinema extends StatefulWidget {
  const RemoveCinema({Key? key}) : super(key: key);

  @override
  State<RemoveCinema> createState() => _RemoveCinemaState();
}

class _RemoveCinemaState extends State<RemoveCinema> {
  final TextEditingController _searchControl = TextEditingController();

  Future<bool> confirmModal(BuildContext context, CinemaModel cine) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        title: Text('Supprimer ${cine.nom} ?'),
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
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    itemCount: cinemas.length,
                    itemBuilder: (context, i) {
                      final cinema = cinemas[i];
                      return Dismissible(
                        key: ValueKey(cinema.id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          CinemasCrud.removeById(cinema.id);
                          CinemasCrud.removeFavById(cinema.id);
                        },
                        confirmDismiss: (direction) =>
                            confirmModal(context, cinema),
                        background: Container(color: Colors.white),
                        secondaryBackground: Container(color: color.secondary),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: ListTile(
                            leading: const Image(
                              image: AssetImage('assets/img/logo_ugc.png'),
                            ),
                            title: Text(cinema.nom),
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
