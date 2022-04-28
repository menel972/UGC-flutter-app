import 'package:flutter/material.dart';

class AppBarProvider with ChangeNotifier {
  final List<Icon> appBarIcons = const [
    Icon(Icons.newspaper),
    Icon(Icons.search),
    Icon(Icons.person_outline),
  ];

  final Uri url = Uri.parse(
      'https://www.mag-illimitebyugc.fr/cette-semaine?utm_source=site-ugc&utm_campaign=picto-header-desktop');
}
