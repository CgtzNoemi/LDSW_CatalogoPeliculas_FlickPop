import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ldsw_catalogo_peliculas/models/Marvel_personajes.dart';

Future<List<Character>> fetchCharacter() async {
  final response = await http.get(
    Uri.parse(
      'https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=630f243d75013f11c363212a40b08461&hash=daceeafe9e621a48510dc50bcfc85de5'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['data']['results'];
      final List<Character> characters = results.map((json) => Character.fromJson(json)).toList();
      return characters;
    } else {
      throw Exception('Error al cargar datos');
    }
}


