// <> FilmModel()
class FilmModel {
  final String id;
  final String titre;
  final String synopsis;
  final String label;
  final String langue;
  final String affiche;
  final List<String> realisateur;
  final List<String> genre;
  int note;
  final Duration duree;
  final DateTime dateDeSortie;
  final List<DateTime> programmation;

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
    required this.duree,
    required this.dateDeSortie,
    required this.programmation,
  });
}
