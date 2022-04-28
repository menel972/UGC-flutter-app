import 'dart:collection';

import 'package:flutter/material.dart';

class NavBarProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _navItem = [
    {
      'label': 'Films',
      'icon1': const Icon(Icons.slideshow),
      'icon2': const Icon(Icons.slow_motion_video_outlined),
    },
    {
      'label': 'Cinemas',
      'icon1': const Icon(Icons.chair_outlined),
      'icon2': const Icon(Icons.chair),
    },
    {
      'label': 'Mes résa',
      'icon1': const Icon(Icons.confirmation_num_outlined),
      'icon2': const Icon(Icons.confirmation_num),
    },
  ];

  UnmodifiableListView<Map<String, dynamic>> get navItem =>
      UnmodifiableListView(_navItem);
}
