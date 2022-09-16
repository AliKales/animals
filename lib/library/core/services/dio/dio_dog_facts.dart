import 'package:animals/library/core/services/dio/s_dio.dart';

class DioDogFacts extends SDio {
  DioDogFacts(super.dio);

  final baseUrl = "http://dog-api.kinduff.com/";
  final pathUrl = "api/facts";

  Future<List<String>?> fetchData() async {
    var response = await dio.get("$baseUrl$pathUrl?number=5");

    if (response.statusCode != 200) return null;
    if (response.data['success'] != true) return null;

    return response.data['facts']?.cast<String>();
  }
}
