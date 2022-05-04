import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:intl/intl.dart';
import 'package:ugc/services/database/films_crud.dart';
import 'package:ugc/services/models/film_model.dart';

import '../../../services/utils/color.dart' as color;

// <> AddFilm()
class AddFilm extends StatefulWidget {
  // <> Constructor
  const AddFilm({Key? key}) : super(key: key);

  @override
  State<AddFilm> createState() => _AddFilmState();
}

// <>  _AddFilmState()
class _AddFilmState extends State<AddFilm> {
  DateTime releaseDate = DateTime.now();

  // = Controllers
  final TextEditingController _langue = TextEditingController();
  final TextEditingController _note = TextEditingController();
  final TextEditingController _duree = TextEditingController();
  final TextEditingController _titre = TextEditingController();
  final TextEditingController _affiche = TextEditingController();
  final TextEditingController _realisateur = TextEditingController();
  final TextEditingController _synopsis = TextEditingController();
  final MultiSelectController _label = MultiSelectController();
  final MultiSelectController _genre = MultiSelectController();

  datePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2020, 5),
      lastDate: DateTime.utc(2030),
    );
    setState(() {
      releaseDate = date!;
    });
  }

  Future createNewFilm() {
    FilmModel newFilm = FilmModel(
      id: '',
      titre: _titre.text,
      synopsis: _synopsis.text,
      label: _label.getSelectedItems()[0],
      langue: _langue.text,
      affiche: _affiche.text,
      realisateur: _realisateur.text.split(', '),
      genre: _genre.getSelectedItems(),
      note: int.parse(_note.text),
      userNote: 0,
      duree: _duree.text,
      dateDeSortie: Timestamp.fromDate(releaseDate),
      programmation: [],
      more: false,
    );

    return FilmsCrud.pushFilm(newFilm);
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
                                  selected: true),
                              MultiSelectCard(
                                  value: 'découverte ugc'.toLowerCase(),
                                  label: 'Découverte'),
                              MultiSelectCard(
                                  value: 'UGC CULTE', label: 'Culte'),
                              MultiSelectCard(
                                  value: 'LABEL SPECTATEUR UGC',
                                  label: 'Spectateur'),
                              MultiSelectCard(
                                  value: 'UGC FAMILY', label: 'Family'),
                              MultiSelectCard(value: 'UGC DOCS', label: 'Docs'),
                              MultiSelectCard(value: 'UGC M', label: 'M'),
                              MultiSelectCard(value: '-12', label: '-12'),
                              MultiSelectCard(value: '-16', label: '-16'),
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
                                  value: 'Comédie', label: 'Comédie'),
                              MultiSelectCard(value: 'Drame', label: 'Drame'),
                              MultiSelectCard(
                                  value: 'Historique', label: 'Historique'),
                              MultiSelectCard(
                                  value: 'Thriller', label: 'Thriller'),
                              MultiSelectCard(
                                  value: 'Science Fiction', label: 'SF'),
                              MultiSelectCard(
                                  value: 'Judiciaire', label: 'Judiciaire'),
                              MultiSelectCard(
                                  value: 'Fantastique', label: 'Fantastique'),
                              MultiSelectCard(
                                  value: 'Aventure', label: 'Aventure'),
                              MultiSelectCard(
                                  value: 'Animation', label: 'Animation'),
                              MultiSelectCard(value: 'Action', label: 'Action'),
                              MultiSelectCard(
                                  value: 'Famille', label: 'Famille'),
                              MultiSelectCard(
                                  value: 'Epouvante-horreur', label: 'Horreur'),
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
                                  DateFormat('d/MM/y').format(releaseDate),
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
                          child: _affiche.text.isEmpty
                              ? const Icon(
                                  Icons.image_outlined,
                                  size: 45,
                                  color: color.primary,
                                )
                              : Image(
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
                            _langue.clear(),
                            _note.clear(),
                            _duree.clear(),
                            _titre.clear(),
                            _affiche.clear(),
                            _realisateur.clear(),
                            _synopsis.clear(),
                            _label.deselectAll(),
                            _genre.deselectAll(),
                            setState(() {}),
                          },
                      child: Text(
                        'Annuler',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )),
                  ElevatedButton(
                      onPressed: () => {
                            createNewFilm(),
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(_titre.text + ' a été ajouté'))),
                            _langue.clear(),
                            _note.clear(),
                            _duree.clear(),
                            _titre.clear(),
                            _affiche.clear(),
                            _realisateur.clear(),
                            _synopsis.clear(),
                            _label.deselectAll(),
                            _genre.deselectAll(),
                            setState(() {}),
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
