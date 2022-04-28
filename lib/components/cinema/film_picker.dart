import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugc/models/cinema_model.dart';
import 'package:ugc/providers/home_tabs_provider.dart';

// <> FilmPicker()
class FilmPicker extends StatelessWidget {
  // =
  final CinemaModel cinema;
  final bool more;
  final VoidCallback seeMore;
  // <> Constructor
  const FilmPicker({
    Key? key,
    required this.cinema,
    required this.more,
    required this.seeMore,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data
    final TabsInfosModel tabsInfos = Provider.of<HomeTabsProvider>(context)
        .setFilmTabs(cinema, more, seeMore);

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
              height: 600,
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
