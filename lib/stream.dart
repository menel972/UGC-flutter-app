import 'package:flutter/material.dart';

import 'firecrud.dart';

class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  State<Stream> createState() => _StreamState();
}

class _StreamState extends State<Stream> {
  final List<Cine> cinemas = [
    // NOTE : Les Halles
    Cine(
      id: 'c1',
      nom: 'Les Halles',
      adress: 'Forum des Halles - Niveau -3 75001 PARIS',
      tarifs: {
        '-14 ans': 6.5,
        'avant 12h': 8.5,
        'groupe +14 ans': 8.5,
        '-26 ans': 8.5,
        'plein tarif': 13.9,
      },
      films: [
        'LE SECRET DE LA CITE PERDUE',
        'LES SEGPA',
        'OGRE',
        'QU\'EST-CE QU\'ON A TOUS FAIT AU BON DIEU ?',
        'GOLIATH',
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'SONIC 2 LE FILM',
        'THE BATMAN',
        'ARISTOCRATS',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
        'MA FAMILLE AFGHANE',
        'BABYSITTER',
        'LA RUSE',
      ],
      favori: false,
    ),
    // NOTE : Grand Normandie
    Cine(
      id: 'c2',
      nom: 'Grand Normandie',
      adress: '116 bis, avenue des Champs-Elysées 75008 PARIS',
      tarifs: {
        '-14 ans': 6.5,
        'avant 12h': 8.5,
        '-26 ans': 8.5,
        'plein tarif': 14.9,
      },
      films: [
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
      ],
      favori: false,
    ),
    // NOTE : Montparnasse
    Cine(
      id: 'c3',
      nom: 'Montparnasse',
      adress: '83, boulevard du Montparnasse 75006 PARIS',
      tarifs: {
        '-14 ans': 6.5,
        'avant 12h': 8.5,
        'groupe +14 ans': 6.5,
        '-26 ans': 8.5,
        'plein tarif': 13.1,
      },
      films: [
        'LE SECRET DE LA CITE PERDUE',
        'QU\'EST-CE QU\'ON A TOUS FAIT AU BON DIEU ?',
        'GOLIATH',
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
        'LA RUSE',
      ],
      favori: false,
    ),
    // NOTE : Bercy
    Cine(
      id: 'c4',
      nom: 'Bercy',
      adress: '2, cour Saint Emilion 75012 PARIS',
      tarifs: {
        '-14 ans': 4.9,
        'avant 11h': 7.2,
        'groupe +14 ans': 7.5,
        '-26 ans': 4.9,
        'plein tarif': 12.1,
      },
      films: [
        'LE SECRET DE LA CITE PERDUE',
        'LES SEGPA',
        'OGRE',
        'QU\'EST-CE QU\'ON A TOUS FAIT AU BON DIEU ?',
        'GOLIATH',
        'LES ANIMAUX FANTASTIQUES 3 LES SECRETS DE DUMBLEDORE',
        'SONIC 2 LE FILM',
        'THE BATMAN',
        'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',
        'MA FAMILLE AFGHANE',
        'BABYSITTER',
        'LA RUSE',
      ],
      favori: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // <!> Create
              Expanded(
                child: Flexible(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: cinemas.length,
                      itemBuilder: (context, i) {
                        final Cine cine = cinemas[i];
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) => FireCrud.merge(cine),
                          background: Container(color: Colors.white),
                          secondaryBackground: Container(
                            color: Colors.green,
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('Ajouter ${cine.nom} ?'),
                            ),
                          ),
                          child: ListTile(
                            title: Text(cine.nom),
                            subtitle: Text(cine.adress),
                            trailing: IconButton(
                                onPressed: () => FireCrud.merge(cine),
                                icon: const Icon(Icons.add)),
                          ),
                        );
                      }),
                ),
              ),
              // <!> Read
              Expanded(
                child: Flexible(
                  flex: 1,
                  child: StreamBuilder<List<Cine>>(
                    stream: FireCrud.fetch(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final cines = snapshot.data!;
                        return ListView.builder(
                            itemCount: cines.length,
                            itemBuilder: (context, i) {
                              final thiCine = cines[i];

                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) =>
                                    FireCrud.deleteById(thiCine.id),
                                background: Container(color: Colors.white),
                                secondaryBackground:
                                    Container(color: Colors.red),
                                child: ListTile(
                                  title: Text(thiCine.nom),
                                  subtitle: Text(thiCine.adress),
                                  trailing: const Icon(Icons.remove),
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        // ignore: avoid_print
                        print(
                            'There is an error : ' + snapshot.error.toString());
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
