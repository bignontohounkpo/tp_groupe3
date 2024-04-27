//import 'package:hash/hash.dart';
class Person {
  String? name;
  String? surname;
  String? bibliography;


  Person({this.name, this.surname, this.bibliography});

  // Méthode toJson pour convertir en format JSON
  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'bibliography': bibliography,
  };

}