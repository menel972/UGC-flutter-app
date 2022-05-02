import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ugc/views/admin/widgets/add_cinema.dart';
import 'package:ugc/views/admin/widgets/add_film.dart';
import 'package:ugc/views/admin/widgets/remove_cinema.dart';
import 'package:ugc/views/admin/widgets/remove_film.dart';
import 'package:ugc/views/admin/widgets/update_cinema.dart';
import 'package:ugc/views/admin/widgets/update_film.dart';
import 'package:ugc/views/components/cinema/cinema_film_list.dart';
import 'package:ugc/views/details/widgets/seance_list.dart';
import '../../services/models/film_model.dart';

import '../../views/home/widgets/cinema_list.dart';
import '../../views/home/widgets/film_list.dart';
import '../../services/models/cinema_model.dart';
import '../../views/resa/resa.dart';
import '../../services/utils/color.dart' as color;

class TabsInfosModel {
  final List<FittedBox> tabs;
  final Color color;
  final List<Widget> tabView;

  const TabsInfosModel({
    required this.tabs,
    required this.color,
    required this.tabView,
  });
}

class HomeTabsProvider with ChangeNotifier {
  UnmodifiableListView<TabsInfosModel> setTabs(
    Stream<List<FilmModel>> newFilmsStream,
    Stream<List<FilmModel>> currentFilmsStream,
    Stream<List<FilmModel>> futurFilmsStream,
    Stream<List<FilmModel>> labelFilmsStream,
    Stream<List<CinemaModel>> cinemasStream,
    Stream<List<CinemaModel>> favoriteCinemasStream,
  ) {
    return UnmodifiableListView([
      TabsInfosModel(
          tabs: [
            const FittedBox(child: Text('NOUVEAU')),
            const FittedBox(child: Text('A L\'AFFICHE')),
            const FittedBox(child: Text('AVANT-PREMIERES')),
            const FittedBox(child: Text('LABELS')),
          ],
          color: color.primary,
          tabView: [
            FilmList(filmsStream: newFilmsStream),
            FilmList(filmsStream: currentFilmsStream),
            FilmList(filmsStream: futurFilmsStream),
            FilmList(filmsStream: labelFilmsStream),
          ]),
      TabsInfosModel(
        tabs: [
          const FittedBox(child: Text('TOUS')),
          const FittedBox(child: Text('MES FAVORIS')),
        ],
        color: color.label,
        tabView: [
          CinemaList(
            cinemasStream: cinemasStream,
          ),
          CinemaList(
            cinemasStream: favoriteCinemasStream,
          ),
        ],
      ),
      const TabsInfosModel(
        tabs: [
          FittedBox(child: Text('')),
        ],
        color: color.darkerBox,
        tabView: [
          Resa(),
        ],
      ),
    ]);
  }

  List<DateTime> get dateList {
    List<DateTime> list = [
      DateTime.now(),
    ];
    int i = 0;

    while (list[i].weekday != 2) {
      list.add(list[i].add(const Duration(days: 1)));
      i = i + 1;
    }
    return list;
  }

  TabsInfosModel setDateTabs(
    FilmModel film,
  ) {
    return TabsInfosModel(
      tabs: dateList.map((date) {
        if (date.day == DateTime.now().day) {
          return const FittedBox(child: Text('AUJOURD\'HUI'));
        } else if (date.day ==
            DateTime.now().add(const Duration(days: 1)).day) {
          return const FittedBox(child: Text('DEMAIN'));
        } else {
          return FittedBox(
            child: Text(
              DateFormat('EEEE').format(date).toUpperCase(),
            ),
          );
        }
      }).toList(),
      color: color.label,
      tabView: dateList
          .map(
            (date) => SeanceList(
              film: film,
              // programmation:
              //     date == dateList[0] ? programmation2 : programmation1,
            ),
          )
          .toList(),
    );
  }

  TabsInfosModel setFilmTabs(
    CinemaModel cinema,
  ) {
    return TabsInfosModel(
      tabs: dateList.map((date) {
        if (date.day == DateTime.now().day) {
          return const FittedBox(child: Text('AUJOURD\'HUI'));
        } else if (date.day ==
            DateTime.now().add(const Duration(days: 1)).day) {
          return const FittedBox(child: Text('DEMAIN'));
        } else {
          return FittedBox(
            child: Text(
              DateFormat('EEEE').format(date).toUpperCase(),
            ),
          );
        }
      }).toList(),
      color: color.label,
      tabView: dateList
          .map(
            (date) => CinemaFilmList(
              cinema: cinema,
            ),
          )
          .toList(),
    );
  }

  TabsInfosModel setAdminTabs(int index) {
    return TabsInfosModel(
      tabs: [
        const FittedBox(child: Text('AJOUTER')),
        const FittedBox(child: Text('MODIFIER')),
        const FittedBox(child: Text('RETIRER')),
      ],
      color: color.primary,
      tabView: index == 0
          ? const [
              AddFilm(),
              UpdateFilm(),
              Removefilm(),
            ]
          : const [
              AddCinema(),
              UpdateCinema(),
              RemoveCinema(),
            ],
    );
  }
}
