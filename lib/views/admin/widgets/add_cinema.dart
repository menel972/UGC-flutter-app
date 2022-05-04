import 'package:flutter/material.dart';
import 'package:ugc/services/database/cinemas_crud.dart';
import 'package:ugc/services/models/cinema_model.dart';

class AddCinema extends StatefulWidget {
  const AddCinema({Key? key}) : super(key: key);

  @override
  State<AddCinema> createState() => _AddCinemaState();
}

class _AddCinemaState extends State<AddCinema> {
  // = Controller
  final GlobalKey<FormState> _addCineKey = GlobalKey<FormState>();

  final TextEditingController _nom = TextEditingController();
  final TextEditingController _adress = TextEditingController();
  final TextEditingController _films = TextEditingController();

  // {}
  Future createNewCinema() {
    CinemaModel newCine = CinemaModel(
      id: '',
      nom: _nom.text,
      adress: _adress.text,
      films: _films.text.toUpperCase().split(', '),
      favori: false,
    );

    return CinemasCrud.pushCinema(newCine);
  }

  @override
  void dispose() {
    _addCineKey.currentState!.dispose();
    super.dispose();
  }

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
                            _nom.clear(),
                            _adress.clear(),
                            _films.clear(),
                          },
                      child: Text(
                        'Annuler',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )),
                  ElevatedButton(
                      onPressed: () => {
                            createNewCinema(),
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(_nom.text + ' a été ajouté'))),
                            _nom.clear(),
                            _adress.clear(),
                            _films.clear(),
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
