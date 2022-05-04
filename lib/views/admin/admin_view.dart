import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugc/services/providers/home_tabs_provider.dart';
import 'package:ugc/views/admin/widgets/admin_bottom_bar.dart';
import 'package:ugc/views/components/appbar_view.dart';

// <> AdminView()
class AdminView extends StatefulWidget {
  // =
  static const String route = './admin';
  // <> Constructor
  const AdminView({Key? key}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

// <>  _AdminViewState()
class _AdminViewState extends State<AdminView> {
  // =
  int index = 0;

  // {}
  void swhitchIndex(int i) {
    setState(() {
      index = i;
    });
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data
    final TabsInfosModel tabsInfos =
        Provider.of<HomeTabsProvider>(context).setAdminTabs(index);

    return DefaultTabController(
      initialIndex: 1,
      length: tabsInfos.tabs.length,
      child: Scaffold(
        // <> AppBar
        // <!> AppBarView
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppbarView(
              tabsInfos: tabsInfos,
            )),
        // <> Body
        // <!> AdminFilm()
        // <!> AdminCinema()
        body: TabBarView(children: tabsInfos.tabView),

        // <> BottomNavigationBar
        // <!> AdminBottomBarView()
        bottomNavigationBar: AdminBottomBar(
          index: index,
          switchIndex: swhitchIndex,
        ),
      ),
    );
  }
}
