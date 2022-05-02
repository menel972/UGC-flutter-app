
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugc/services/database/cinemas_crud.dart';
import 'package:ugc/services/database/films_crud.dart';
import '../../services/models/cinema_model.dart';
import '../components/drawer_view.dart';
import '../components/appbar_view.dart';
import '../components/bottom_bar_view.dart';

import '../../services/providers/home_tabs_provider.dart';

// <> HomeView()
class HomeView extends StatefulWidget {
  // =
  static const String route = '/';
  // <> Constructor
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

// <> _HomeViewState()
class _HomeViewState extends State<HomeView> {
  // = Late Variable for DrawerView()
  late List<Map<String, String>> drawerMenus;

  late int index;

  void switchIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  List<CinemaModel> favoriteCine = [];

  // {} initState
  @override
  void initState() {
    super.initState();
    index = 0;
    drawerMenus = const [
      {
        'title': 'PAYS/LANGUE',
        'subtitle': '-',
      },
      {
        'title': 'NEWS',
        'subtitle': 'L\'actualité cinéma avec UGC',
      },
      {
        'title': 'UGC PRO',
        'subtitle': '',
      },
      {
        'title': 'UGC RECRUTE',
        'subtitle': '-',
      },
      {
        'title': 'CONTACTEZ-NOUS',
        'subtitle': '',
      },
      {
        'title': 'BESOIN D\'AIDE ?',
        'subtitle': '',
      },
      {
        'title': 'MENTIONS LEGALES',
        'subtitle': '',
      },
      {
        'title': 'CONDITIONS GENERALES',
        'subtitle': '',
      },
      {
        'title': 'POLITIQUE DE CONFIDENTIALITE',
        'subtitle': '',
      },
      {
        'title': 'GESTION DES COOKIES',
        'subtitle': '',
      },
    ];
    // NOTE : Variable for Appbar()
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data





    final tabsInfos = Provider.of<HomeTabsProvider>(context).setTabs(
      FilmsCrud.fetchNew(),
      FilmsCrud.fetchCurrent(),
      FilmsCrud.fetchFuture(),
      FilmsCrud.fetchLabel(),
      CinemasCrud.fetchAll(),
      CinemasCrud.fetchFavoriteCinemas(),
    );

    return DefaultTabController(
      length: tabsInfos[index].tabs.length,
      initialIndex: 0,
      child: Scaffold(
        // <> AppBar
        // <!> AppbarView()
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(index > 1 ? 55 : 90),
            child: AppbarView(
              tabsInfos: tabsInfos[index],
            )),

        // <> Drawer
        // <!> DrawerView()
        drawer: DrawerView(menus: drawerMenus),

        // <> Body
        body: TabBarView(
          children: tabsInfos[index].tabView,
        ),

        // <> BottomNavigationBar
        // <!> BottomBarView()
        bottomNavigationBar: BottomBarView(
          index: index,
          switchIndex: switchIndex,
        ),
      ),
    );
  }
}
