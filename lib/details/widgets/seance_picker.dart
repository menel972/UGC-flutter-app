import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/models/film_model.dart';
import '../../services/providers/home_tabs_provider.dart';

import '../../services/providers/films_provider.dart';

// <> SeancePicker()
class SeancePicker extends StatelessWidget {
  // =
  final FilmModel film;

  // <> Constructor
  const SeancePicker({
    Key? key,
    required this.film,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data
    final List<DateTime> programmation2 =
        Provider.of<FilmsProvider>(context).programmation(film);
    final TabsInfosModel tabsInfos = Provider.of<HomeTabsProvider>(context)
        .setDateTabs(film, film.programmation, programmation2);

    return DefaultTabController(
      length: tabsInfos.tabs.length,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TabBar(
              tabs: tabsInfos.tabs,
              isScrollable: true,
              labelPadding:
                  const EdgeInsets.only(bottom: 5, top: 0, left: 0, right: 8),
              labelStyle: Theme.of(context).textTheme.displayMedium,
              unselectedLabelColor: tabsInfos.color,
            ),
            SizedBox(
              height: 525,
              // <!> SeanceList()
              child: TabBarView(
                children: tabsInfos.tabView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
