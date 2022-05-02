// <> CinemaModel()
class CinemaModel {
  final String id;
  final String nom;
  final String adress;
  final dynamic tarifs;
  final List<dynamic> films;
  bool favori;

  CinemaModel({
    required this.id,
    required this.nom,
    required this.adress,
    required this.tarifs,
    required this.films,
    required this.favori,
  });

  Map<String, dynamic> toJson(String docId) => {
        'id': docId,
        'nom': nom,
        'adress': adress,
        'tarifs': tarifs,
        'films': films,
        'favori': favori,
      };

  static CinemaModel fromJson(Map<String, dynamic> json) => CinemaModel(
        id: json['id'],
        nom: json['nom'],
        adress: json['adress'],
        tarifs: json['tarifs'],
        films: json['films'],
        favori: json['favori'],
      );
}
