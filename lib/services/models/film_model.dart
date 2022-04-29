// <> FilmModel()
class FilmModel {
  final String id;
  final String titre;
  final String synopsis;
  final String label;
  final String langue;
  final String affiche;
  final List<dynamic> realisateur;
  final List<dynamic> genre;
  int note;
  final String duree;
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
        'duree': duree,
        'dateDeSortie': dateDeSortie,
        'programmation': programmation,
      };

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
        duree: json['duree'],
        dateDeSortie: json['dateDeSortie'],
        programmation: json['programmation'],
      );
}
