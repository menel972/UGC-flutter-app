// <> FilmModel()
import 'package:cloud_firestore/cloud_firestore.dart';

class FilmModel {
  final String id;
  final String titre;
  final String synopsis;
  final String label;
  final String langue;
  final String affiche;
  final List<dynamic> realisateur;
  final List<dynamic> genre;
  final int note;
  int userNote;
  final String duree;
  final Timestamp dateDeSortie;
  final List<Timestamp> programmation;
  bool more;
  // final DateTime dateDeSortie;
  // final List<DateTime> programmation;
  // bool more;

// <> Constructor
  FilmModel({
    required this.id,
    required this.titre,
    required this.synopsis,
    required this.label,
    required this.langue,
    required this.affiche,
    required this.realisateur,
    required this.genre,
    required this.note,
    required this.userNote,
    required this.duree,
    required this.dateDeSortie,
    required this.programmation,
    required this.more,
  });

// {} Film // Json
  Map<String, dynamic> toJson(String docId) => {
        'id': docId,
        'titre': titre,
        'synopsis': synopsis,
        'label': label,
        'langue': langue,
        'affiche': affiche,
        'realisateur': realisateur,
        'genre': genre,
        'note': note,
        'userNote': userNote,
        'duree': duree,
        'dateDeSortie': dateDeSortie,
        'programmation': programmation,
        'more': more,
      };
  // NOTE : Convert FilmModel to Json

  static FilmModel fromJson(Map<String, dynamic> json) => FilmModel(
        id: json['id'],
        titre: json['titre'],
        synopsis: json['synopsis'],
        label: json['label'],
        langue: json['langue'],
        affiche: json['affiche'],
        realisateur: json['realisateur'],
        genre: json['genre'],
        note: json['note'],
        userNote: json['userNote'],
        duree: json['duree'],
        dateDeSortie: json['dateDeSortie'],
        programmation: List<Timestamp>.from(json['programmation']),
        more: json['more'],
      );
  // NOTE : Convert Json to FilmModel

// {}
  List<DateTime> todaySeance(FilmModel film) {
    List<DateTime> datePgm =
        film.programmation.map((stamp) => stamp.toDate()).toList();

    return datePgm
        .where((date) => (date.hour - DateTime.now().hour) < 0)
        .toList();
  }
  // NOTE : Get programmation of the day


  Duration dureeToDuration(String duree) {
    List<String> splitDuree = duree.split('H');
    return Duration(
      hours: int.parse(splitDuree[0]),
      minutes: int.parse(splitDuree[1]),
    );
  }
  // NOTE : Get film duree in Duration
}
