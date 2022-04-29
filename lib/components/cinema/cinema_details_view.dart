import 'package:flutter/material.dart';
import 'package:ugc/components/cinema/film_picker.dart';
import '../../services/models/cinema_model.dart';

// <> CinemaDetailsView()
class CinemaDetailsView extends StatefulWidget {
  // =
  static const route = './cinema_details';
  final CinemaModel cinema;

  // <> Constructor
  const CinemaDetailsView({
    Key? key,
    required this.cinema,
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
    return Scaffold(
      // <> AppBar
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Center(
          child: Text(
            'ugc ciné cité ${widget.cinema.nom}'.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.visible,
            softWrap: true,
          ),
        ),
      ),

      // <> Body
      body: SingleChildScrollView(
        child: FilmPicker(
          cinema: widget.cinema,
          more: more,
          seeMore: seeMore,
        ),
      ),
    );
  }
}
