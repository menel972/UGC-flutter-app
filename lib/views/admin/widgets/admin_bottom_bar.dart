import 'package:flutter/material.dart';

// <> AdminBottomBar()
class AdminBottomBar extends StatelessWidget {
  // =
  final int index;
  final Function(int) switchIndex;

  // <> Constructor
  const AdminBottomBar({
    Key? key,
    required this.index,
    required this.switchIndex,
  }) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (i) => switchIndex(i),
      items: [
        BottomNavigationBarItem(
          label: 'Film',
          icon: Icon(
              index == 0 ? Icons.slow_motion_video_outlined : Icons.slideshow),
        ),
        BottomNavigationBarItem(
          label: 'Cinema',
          icon: Icon(index == 1 ? Icons.chair : Icons.chair_outlined),
        ),
      ],
    );
  }
}
