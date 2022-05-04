// <> CinemaModel()
class CinemaModel {
  String id;
  String nom;
  String adress;
  List<dynamic> films;
  bool favori;

  CinemaModel({
    required this.id,
    required this.nom,
    required this.adress,
    required this.films,
    required this.favori,
  });

  Map<String, dynamic> toJson(String docId) => {
        'id': docId,
        'nom': nom,
        'adress': adress,
        'films': films,
        'favori': favori,
      };

  static CinemaModel fromJson(Map<String, dynamic> json) => CinemaModel(
        id: json['id'],
        nom: json['nom'],
        adress: json['adress'],
        films: json['films'],
        favori: json['favori'],
      );
}
