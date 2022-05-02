import 'package:flutter/material.dart';
import 'package:ugc/services/database/cinemas_crud.dart';
import 'package:ugc/views/components/cinema/film_picker.dart';
import '../../../services/models/cinema_model.dart';

// <> CinemaDetailsView()
class CinemaDetailsView extends StatefulWidget {
  // =
  static const route = './cinema_details';
  final String cineId;

  // <> Constructor
  const CinemaDetailsView({
    Key? key,
    required this.cineId,
  }) : super(key: key);

  @override
  State<CinemaDetailsView> createState() => _CinemaDetailsViewState();
}

// <> _CinemaDetailsViewState()
class _CinemaDetailsViewState extends State<CinemaDetailsView> {
  bool more = false;

  // {}
  void seeMore() {
    setState(() {
      more = !more;
    });
  }

  // <> Build
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CinemaModel>(
        stream: CinemasCrud.fetchById(widget.cineId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cinema = snapshot.data!;
            return Scaffold(
              // <> AppBar
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                title: Center(
                  child: Text(
                    'ugc ciné cité ${cinema.nom}'.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
              ),

              // <> Body
              body: SingleChildScrollView(
                // <!> FilmPicker()
                child: FilmPicker(
                  cinema: cinema,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('There is an error');
          }
          return const CircularProgressIndicator();
        });
  }
}
