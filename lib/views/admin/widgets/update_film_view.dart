import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:intl/intl.dart';

import '../../../services/database/films_crud.dart';
import '../../../services/models/film_model.dart';
import '../../../services/utils/color.dart' as color;

// <> UpdateFilmView()
class UpdateFilmView extends StatefulWidget {
  // =
  final FilmModel film;

  // <> Constructor
  const UpdateFilmView({Key? key, required this.film}) : super(key: key);

  @override
  State<UpdateFilmView> createState() => _UpdateFilmViewState();
}
// <> _UpdateFilmViewState()

class _UpdateFilmViewState extends State<UpdateFilmView> {
  // =
  FilmModel get film => widget.film;
  late DateTime _releaseDate;

  // = Controllers
  late TextEditingController _langue;
  late TextEditingController _note;
  late TextEditingController _duree;
  late TextEditingController _titre;
  late TextEditingController _affiche;
  late TextEditingController _realisateur;
  late TextEditingController _synopsis;
  final MultiSelectController _label = MultiSelectController();
  final MultiSelectController _genre = MultiSelectController();

  // {} initState
  @override
  void initState() {
    _releaseDate = film.dateDeSortie.toDate();
    _langue = TextEditingController(text: film.langue);
    _note = TextEditingController(text: film.note.toString());
    _duree = TextEditingController(text: film.duree);
    _titre = TextEditingController(text: film.titre);
    _affiche = TextEditingController(text: film.affiche);
    _realisateur = TextEditingController(text: film.realisateur.join(', '));
    _synopsis = TextEditingController(text: film.synopsis);
    super.initState();
  }

  // {} DatePicker
  datePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: film.dateDeSortie.toDate(),
      firstDate: DateTime.utc(2020, 5),
      lastDate: DateTime.utc(2030),
    );
    setState(() {
      _releaseDate = date!;
    });
  }

  // {}
  Future updateFilm() {
    FilmModel newFilm = FilmModel(
      id: film.id,
      titre: _titre.text,
      synopsis: _synopsis.text,
      label: _label.getSelectedItems()[0],
      langue: _langue.text,
      affiche: _affiche.text,
      realisateur: _realisateur.text.split(', '),
      genre: _genre.getSelectedItems(),
      note: int.parse(_note.text),
      userNote: film.userNote,
      duree: _duree.text,
      dateDeSortie: Timestamp.fromDate(_releaseDate),
      programmation: film.programmation,
      more: false,
    );

    return FilmsCrud.commitAll(newFilm);
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Form(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                          top: 8, right: 0, bottom: 8, left: 8),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.8, color: color.label),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Label :',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          MultiSelectContainer(
                            maxSelectableCount: 1,
                            controller: _label,
                            textStyles: MultiSelectTextStyles(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                            itemsDecoration: MultiSelectDecorations(
                              selectedDecoration: BoxDecoration(
                                color: color.primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              decoration: BoxDecoration(
                                color: color.label.withOpacity(0.1),
                                border: Border.all(
                                    width: 0.5, color: color.primary),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            prefix: MultiSelectPrefix(
                              selectedPrefix: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            isMaxSelectableWithPerpetualSelects: true,
                            items: [
                              MultiSelectCard(
                                value: 'NOUVEAU',
                                label: 'Nouveau',
                                selected:
                                    film.label == 'NOUVEAU' ? true : false,
                              ),
                              MultiSelectCard(
                                value: 'découverte ugc'.toUpperCase(),
                                label: 'Découverte',
                                selected:
                                    film.label == 'découverte ugc'.toUpperCase()
                                        ? true
                                        : false,
                              ),
                              MultiSelectCard(
                                value: 'UGC CULTE',
                                label: 'Culte',
                                selected:
                                    film.label == 'UGC CULTE' ? true : false,
                              ),
                              MultiSelectCard(
                                value: 'LABEL SPECTATEUR UGC',
                                label: 'Spectateur',
                                selected: film.label == 'LABEL SPECTATEUR UGC'
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'UGC FAMILY',
                                label: 'Family',
                                selected:
                                    film.label == 'UGC FAMILY' ? true : false,
                              ),
                              MultiSelectCard(
                                value: 'UGC DOCS',
                                label: 'Docs',
                                selected:
                                    film.label == 'UGC DOCS' ? true : false,
                              ),
                              MultiSelectCard(
                                value: 'UGC M',
                                label: 'M',
                                selected: film.label == 'UGC M' ? true : false,
                              ),
                              MultiSelectCard(
                                value: '-12',
                                label: '-12',
                                selected: film.label == '-12' ? true : false,
                              ),
                              MultiSelectCard(
                                value: '-16',
                                label: '-16',
                                selected: film.label == '-16' ? true : false,
                              ),
                            ],
                            onChange: (allSelectedItems, selectedItem) {},
                          ),
                          // NOTE : Label
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                          top: 8, right: 2, bottom: 8, left: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.8, color: color.label),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Genre :',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          MultiSelectContainer(
                            controller: _genre,
                            maxSelectableCount: 3,
                            textStyles: MultiSelectTextStyles(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                            itemsDecoration: MultiSelectDecorations(
                              selectedDecoration: BoxDecoration(
                                color: color.primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              decoration: BoxDecoration(
                                color: color.label.withOpacity(0.1),
                                border: Border.all(
                                    width: 0.5, color: color.primary),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            prefix: MultiSelectPrefix(
                              selectedPrefix: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            items: [
                              MultiSelectCard(
                                value: 'Comédie',
                                label: 'Comédie',
                                selected: film.genre.contains('Comédie')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Drame',
                                label: 'Drame',
                                selected:
                                    film.genre.contains('Drame') ? true : false,
                              ),
                              MultiSelectCard(
                                value: 'Historique',
                                label: 'Historique',
                                selected: film.genre.contains('Historiqe')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Thriller',
                                label: 'Thriller',
                                selected: film.genre.contains('Thriller')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Science Fiction',
                                label: 'SF',
                                selected: film.genre.contains('Science Fiction')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Judiciaire',
                                label: 'Judiciaire',
                                selected: film.genre.contains('Judiciaire')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Fantastique',
                                label: 'Fantastique',
                                selected: film.genre.contains('Fantastique')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Aventure',
                                label: 'Aventure',
                                selected: film.genre.contains('Aventure')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Animation',
                                label: 'Animation',
                                selected: film.genre.contains('Animation')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Action',
                                label: 'Action',
                                selected: film.genre.contains('Action')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Famille',
                                label: 'Famille',
                                selected: film.genre.contains('Famille')
                                    ? true
                                    : false,
                              ),
                              MultiSelectCard(
                                value: 'Epouvante-horreur',
                                label: 'Horreur',
                                selected:
                                    film.genre.contains('Epouvante-horreur')
                                        ? true
                                        : false,
                              ),
                            ],
                            onChange: (allSelectedItems, selectedItem) {},
                          ),
                          // NOTE : Genre
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: _langue,
                            decoration: const InputDecoration(
                              hintText: 'langue',
                            ),
                          ),
                        ),
                        // NOTE : Langue
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: _note,
                            decoration: const InputDecoration(
                              hintText: 'Note',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        // NOTE : Note
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: ElevatedButton.icon(
                            onPressed: () => datePicker(),
                            icon: const Icon(
                              Icons.calendar_today,
                              color: color.primary,
                            ),
                            label: Text(
                              'date : ' +
                                  DateFormat('d/MM/y').format(_releaseDate),
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                        // NOTE : Date
                        const SizedBox(width: 15),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: _duree,
                            decoration: const InputDecoration(
                              hintText: 'Durée',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        // NOTE : Durée
                      ],
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _titre,
                      decoration: const InputDecoration(
                        hintText: 'Titre',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    // NOTE : Titre
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: TextFormField(
                            onChanged: (value) => setState(() {}),
                            controller: _affiche,
                            decoration: const InputDecoration(
                              hintText: 'Affiche',
                            ),
                            keyboardType: TextInputType.url,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: Image(
                            image: AssetImage(_affiche.text),
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    // NOTE : Affiche
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _realisateur,
                      decoration: const InputDecoration(
                        hintText: 'Réalisateur',
                      ),
                    ),
                    // NOTE : Réalisateur
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _synopsis,
                      decoration: const InputDecoration(
                        hintText: 'Synopsis',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    // NOTE : Synopsis
                  ],
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => {
                            _langue.text = film.langue,
                            _note.text = film.note.toString(),
                            _duree.text = film.duree,
                            _titre.text = film.titre,
                            _affiche.text = film.affiche,
                            _realisateur.text = film.realisateur.join((', ')),
                            _synopsis.text = film.synopsis,
                            setState(() {
                              _releaseDate = film.dateDeSortie.toDate();
                            }),
                          },
                      child: Text(
                        'Annuler',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )),
                  ElevatedButton(
                      onPressed: () => {
                            updateFilm(),
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(_titre.text + ' a été modifié'))),
                            Navigator.pop(context),
                          },
                      child: Text(
                        'Sauvegarder',
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
