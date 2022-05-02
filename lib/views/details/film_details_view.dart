import 'package:flutter/material.dart';
import 'package:ugc/services/database/films_crud.dart';
import 'package:ugc/views/components/note.dart';
import 'package:ugc/views/details/widgets/film_info.dart';
import 'package:ugc/views/details/widgets/seance_picker.dart';
import '../../services/models/film_model.dart';

import '../../services/utils/color.dart' as color;

// <> FilmDetailsView()
class FilmDetailsView extends StatefulWidget {
  // =
  static const String route = './film_details';
  final String filmId;

  // <> Constructor
  const FilmDetailsView({
    Key? key,
    required this.filmId,
  }) : super(key: key);

  @override
  State<FilmDetailsView> createState() => _FilmDetailsViewState();
}

// <> _FilmDetailsViewState()
class _FilmDetailsViewState extends State<FilmDetailsView> {
  bool more = false;

  // {}
  void setNote() async {
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 300,
          padding: const EdgeInsets.only(left: 20, top: 5, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: color.primary,
                    ),
                  ),
                  Text(
                    'NOTER CE FILM',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'MA NOTE',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // <!> Note()
              Note(
                filmId: widget.filmId,
                set: true,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'LA NOTE DES SPECTATEURS UGC',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // <!> Note()
                  Note(
                    filmId: widget.filmId,
                    set: false,
                  ),
                  // Text(
                  //   widget.film.note.toString() + '/5',
                  //   style: Theme.of(context).textTheme.titleLarge,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FilmModel>(
        stream: FilmsCrud.fetchById(widget.filmId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final film = snapshot.data!;
            return Scaffold(
              // <> AppBar
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                title: Center(
                  child: SizedBox(
                    width: 225,
                    child: Text(
                      '${film.titre} (${film.duree})',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ),
              ),

              // <> Body
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // <!> FilmInfo()
                    FilmInfo(
                      filmId: film.id,
                      setNote: setNote,
                    ),
                    // <!> SeancePicker()
                    SeancePicker(
                      film: film,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error');
          }
          return const CircularProgressIndicator();
        });
  }
}
