import 'dart:convert';
import 'package:candidature/models/person.dart';
import 'package:http/http.dart' as http;

Future<void> sendDataToServer(Person person) async {
  final url = Uri.https('jsonplaceholder.typicode.com', '/users');
  final body = jsonEncode(person.toJson());

  final response = await http.post(url, body: body);

  if (response.statusCode == 201) {
    // La requête a réussi, vous pouvez afficher un message de succès ou effectuer une autre action
    print('Données envoyées avec succès');
  } else {
    // La requête a échoué, vous pouvez afficher un message d'erreur ou effectuer une autre action
    print('Erreur lors de l\'envoi des données : ${response.statusCode}');
  }
}