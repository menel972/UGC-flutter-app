import 'package:flutter/material.dart';
import 'package:ugc/views/admin/widgets/update_cinema_view.dart';
import 'package:ugc/views/admin/widgets/update_film_view.dart';

// <> UpdateView()
class UpdateView extends StatelessWidget {
  // =
  static const route = './update';
  final Map<String, dynamic> id;

  // <> Constructor
  const UpdateView({Key? key, required this.id}) : super(key: key);

  // <> Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // <> AppBar
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/img/logo_ugc.png'),
          width: 50,
        ),
      ),

      // <> Body
      body: id['type'] == 'cine'
          ? UpdateCinemaView(cine: id['content']!)
          : UpdateFilmView(film: id['content']!),
    );
  }
}
