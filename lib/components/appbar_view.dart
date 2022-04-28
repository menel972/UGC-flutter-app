import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugc/providers/app_bar_provider.dart';
import 'package:ugc/providers/home_tabs_provider.dart';
import 'package:url_launcher/url_launcher.dart';

// <> AppbarView()
class AppbarView extends StatelessWidget {
  // =
  final TabsInfosModel tabsInfos;
  // <> Constructor
  const AppbarView({
    Key? key,
    required this.tabsInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // = Provided data
    final List<Icon> icons = Provider.of<AppBarProvider>(context).appBarIcons;
    final Uri url = Provider.of<AppBarProvider>(context).url;

    // Future<void> add = Provider.of<CinemasProvider>(context).add();
    // void add = Provider.of<CinemasProvider>(context).id();

    final CollectionReference _cinemaDb =
        FirebaseFirestore.instance.collection('cinema');

    void fetch() {
      List<dynamic> test = [];

      _cinemaDb
          .get()
          .then((value) => print(value.docs.where((doc) => doc['type'] == 2)));
    }

    return AppBar(
      title: const Image(
        image: AssetImage('assets/img/logo_ugc.png'),
        width: 50,
      ),
      actions: [
        IconButton(
          onPressed: () => launchUrl(url),
          icon: icons[0],
        ),
        IconButton(
          onPressed: () {},
          icon: icons[1],
        ),
        IconButton(
          onPressed: () => fetch(),
          icon: icons[2],
        ),
      ],
      bottom: tabsInfos.tabs.length == 1
          ? null
          : TabBar(
              tabs: tabsInfos.tabs,
              labelStyle: Theme.of(context).textTheme.displayMedium,
              unselectedLabelColor: tabsInfos.color,
            ),
    );
  }
}
