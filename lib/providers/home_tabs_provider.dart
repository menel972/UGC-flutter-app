import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ugc/components/cinema/cinema_film_list.dart';
import 'package:ugc/details/widgets/seance_list.dart';
import 'package:ugc/models/film_model.dart';

import '../home/widgets/cinema_list.dart';
import '../home/widgets/film_list.dart';
import '../models/cinema_model.dart';
import '../resa/resa.dart';
import '../utils/color.dart' as color;

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
    List<FilmModel> newFilms,
    List<FilmModel> currentFilms,
    List<FilmModel> futurFilms,
    List<FilmModel> labelFilms,
    List<CinemaModel> cinemas,
    List<CinemaModel> favoriteCinemas,
    Function(CinemaModel) switchFavorite,
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
            FilmList(films: newFilms),
            FilmList(films: currentFilms),
            FilmList(films: futurFilms),
            FilmList(films: labelFilms),
          ]),
      TabsInfosModel(
        tabs: [
          const FittedBox(child: Text('TOUS')),
          const FittedBox(child: Text('MES FAVORIS')),
        ],
        color: color.label,
        tabView: [
          CinemaList(
            cinemas: cinemas,
            switchFavoriteCinema: switchFavorite,
          ),
          CinemaList(
            cinemas: favoriteCinemas,
            switchFavoriteCinema: switchFavorite,
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
    List<DateTime> programmation1,
    List<DateTime> programmation2,
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
          .map((date) => SeanceList(
                film: film,
                programmation:
                    date == dateList[0] ? programmation2 : programmation1,
              ))
          .toList(),
    );
  }

  TabsInfosModel setFilmTabs(
    CinemaModel cinema,
    bool more,
    VoidCallback seeMore,
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
          .map((date) =>
              CinemaFilmList(cinema: cinema, more: more, seeMore: seeMore))
          .toList(),
    );
  }
}
