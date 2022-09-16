import 'package:animals/library/core/services/dio/s_dio.dart';

class DioCatFacts extends SDio {
  DioCatFacts(super.dio);

  final baseUrl = "https://meowfacts.herokuapp.com/";

  Future<List<String>?> fetchData() async {
    var response = await dio.get("$baseUrl?count=3");

    if (response.statusCode != 200) return null;

    return response.data['data']?.cast<String>();
  }
}
