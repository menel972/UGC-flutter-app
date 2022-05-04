import 'package:flutter/material.dart';

import '../../../services/database/cinemas_crud.dart';
import '../../../services/models/cinema_model.dart';

// <> UpdateCinemaView()
class UpdateCinemaView extends StatefulWidget {
  // =
  final CinemaModel cine;

  // <> Constructor
  const UpdateCinemaView({Key? key, required this.cine}) : super(key: key);

  @override
  State<UpdateCinemaView> createState() => _UpdateCinemaViewState();
}

// <> _UpdateCinemaViewState()
class _UpdateCinemaViewState extends State<UpdateCinemaView> {
  // = Controller
  final GlobalKey<FormState> _addCineKey = GlobalKey<FormState>();

  late TextEditingController _nom;
  late TextEditingController _adress;
  late TextEditingController _films;

  // {} initState
  @override
  void initState() {
    _nom = TextEditingController(text: widget.cine.nom);
    _adress = TextEditingController(text: widget.cine.adress);
    _films = TextEditingController(text: widget.cine.films.join(', '));
    super.initState();
  }

  // {}
  Future updateCinema() {
    CinemaModel newCine = CinemaModel(
      id: widget.cine.id,
      nom: _nom.text,
      adress: _adress.text,
      films: _films.text.toUpperCase().split(', '),
      favori: widget.cine.favori,
    );

    return CinemasCrud.commitAll(newCine);
  }

  @override
  void dispose() {
    _addCineKey.currentState!.dispose();
    super.dispose();
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Form(
        key: _addCineKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _nom,
                      decoration: InputDecoration(
                        hintText: 'Nom',
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _adress,
                      decoration: InputDecoration(
                        hintText: 'Adress',
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                      ),
                      keyboardType: TextInputType.streetAddress,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _films,
                      decoration: InputDecoration(
                        hintText: 'Films',
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => {
                            _nom.text = widget.cine.nom,
                            _adress.text = widget.cine.adress,
                            _films.text = widget.cine.films.join(', '),
                          },
                      child: Text(
                        'Annuler',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )),
                  ElevatedButton(
                      onPressed: () => {
                            updateCinema(),
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(_nom.text + ' a été modifié'))),
                            Navigator.pop(context),
                          },
                      child: Text(
                        'Sauvegarder',
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
