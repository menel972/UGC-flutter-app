// <> CinemaModel()
class CinemaModel {
  final String id;
  final String nom;
  final String adress;
  final Map<String, double> tarifs;
  final List<String> films;
  bool favori;

  CinemaModel({
    required this.id,
    required this.nom,
    required this.adress,
    required this.tarifs,
    required this.films,
    required this.favori,
  });
}
