import 'dart:convert';
import 'Heroe.dart';
import 'package:http/http.dart' as http;

class Service {
  final String baseUrl = "https://www.superheroapi.com/api";
  final String token = "7019859888057850";

  Future<Heroe> elementHeroe() async {
    final response = await http.get(Uri.parse('$baseUrl/$token/1'));
    if (response.statusCode == 200) {
      return Heroe.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error de consumo de API");
    }
  }

  Future<List<Heroe>> consultaHeroe(String keyword) async {
    final response = await http.get(Uri.parse("$baseUrl/$token/search/$keyword"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['response'] == 'success') {
        final List<dynamic> results = data['results'];
        return results.map((json) => Heroe.fromJson(json)).toList();
      } else {
        throw Exception("No heroes found");
      }
    } else {
      throw Exception("Error de consumo de API");
    }
  }
}