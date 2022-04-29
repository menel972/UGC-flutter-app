import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/providers/nav_bar_provider.dart';

// <> BottomBarView()
class BottomBarView extends StatelessWidget {
  // =
  final int index;
  final Function(int) switchIndex;

  // <> Constructor
  const BottomBarView(
      {Key? key, required this.index, required this.switchIndex})
      : super(key: key);

// <> Build
  @override
  Widget build(BuildContext context) {
    // = Provided data
    final UnmodifiableListView<Map<String, dynamic>> nav =
        Provider.of<NavBarProvider>(context).navItem;

    return BottomNavigationBar(
      onTap: (i) => switchIndex(i),
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          label: nav[0]['label'],
          icon: index == 0 ? nav[0]['icon2'] : nav[0]['icon1'],
        ),
        BottomNavigationBarItem(
          label: nav[1]['label'],
          icon: index == 1 ? nav[1]['icon2'] : nav[1]['icon1'],
        ),
        BottomNavigationBarItem(
          label: nav[2]['label'],
          icon: index == 2 ? nav[2]['icon2'] : nav[2]['icon1'],
        ),
      ],
    );
  }
}
