import 'package:animals/library/core/services/dio/s_dio.dart';

class DioDogPhotos extends SDio {
  DioDogPhotos(super.dio);

  final baseUrl = "https://dog.ceo/";
  final pathUrl = "api/breeds/image/random";

  Future<String?> fetchData() async {
    var response = await dio.get("$baseUrl$pathUrl");

    if (response.statusCode != 200) return null;
    if (response.data['status'] != "success") return null;

    String result = response.data['message'];
    result = result.replaceAll(r"\", "");

    return result;
  }

  Future<String?> fetchShibeData() async {
    var response = await dio.get("http://shibe.online/api/shibes?count=1");

    if (response.statusCode != 200) return null;

    List<String> result = response.data.cast<String>();

    return result.first;
  }
}
