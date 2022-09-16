import 'package:animals/library/core/services/dio/s_dio.dart';

class DioCountries extends SDio {
  DioCountries(super.dio);

  final baseUrl = "https://restcountries.com/";
  final pathUrl = "v2/all?fields=name";

  Future<List<String>?> fetchData() async {
    var response = await dio.get("$baseUrl$pathUrl");

    if (response.statusCode != 200) return null;

    List<String> datas = [];

    for (var element in response.data) {
      datas.add(element['name']);
    }

    return datas;
  }
}
