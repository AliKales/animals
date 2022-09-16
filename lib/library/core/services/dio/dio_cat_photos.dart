import 'package:animals/library/core/services/dio/s_dio.dart';

class DioCatPhotos extends SDio {
  DioCatPhotos(super.dio);

  final baseUrl = "https://cataas.com";
  final pathUrl = "/cat?json=true";
  final pathUrlGif = "/cat/gif?json=true";

  Future<String?> fetchData(bool isGif) async {
    String getPath = isGif ? pathUrlGif : pathUrl;
    var response = await dio.get("$baseUrl$getPath");

    if (response.statusCode != 200) return null;

    return "$baseUrl${response.data['url']}";
  }
}
