import 'package:animals/library/core/models/m_animal.dart';
import 'package:animals/library/core/services/dio/s_dio.dart';
import 'package:animals/library/no_github.dart';
import 'package:dio/dio.dart';

class DioAllAnimals extends SDio {
  DioAllAnimals(super.dio);

  final baseUrl = "https://animaliapi3.p.rapidapi.com";
  final pathUrl = "/all";

  Future<List<MAnimal>?> fetchData() async {
    Options options = Options(headers: {
      'X-RapidAPI-Key': ngXRapidApiKey,
      'X-RapidAPI-Host': 'animaliapi3.p.rapidapi.com',
    });

    var response = await dio.get("$baseUrl$pathUrl", options: options);

    if (response.statusCode != 200) return null;

    List<MAnimal> animals = [];

    for (var element in response.data['animals']) {
      animals.add(MAnimal.fromJson(element));
    }

    animals.shuffle();

    return animals;
  }
}
