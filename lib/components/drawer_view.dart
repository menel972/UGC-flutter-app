import 'package:flutter/material.dart';

// <> DrawerView()
class DrawerView extends StatelessWidget {
  // =
  final List<Map<String, String>> menus;

  // <> Constructor
  const DrawerView({
    Key? key,
    required this.menus,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, i) {
          final menu = menus[i];

          return Column(
            children: [
              Container(
                height: 40,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.5, horizontal: 0),
                child: ListTile(
                  style: ListTileStyle.drawer,
                  title: Text(
                    menu['title']!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    menu['subtitle']! == '-' ? '' : menu['subtitle']!,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              if (menu['subtitle']! == '-')
                Divider(
                  height: 25,
                  endIndent: 0.6 * size,
                  indent: 10,
                ),
            ],
          );
        },
      ),
    );
  }
}
