import 'package:animals/library/core/services/dio/s_dio.dart';

class DioDuckPhotos extends SDio {
  DioDuckPhotos(super.dio);

  final baseUrl = "https://random-d.uk/api/v2";
  final pathUrl = "/randomimg?type=";

  Future<String?> fetchData(bool isGif) async {
    String getPath = isGif ? "${pathUrl}gif" : "${pathUrl}jpg";

    var response = await dio.get("$baseUrl$getPath");

    if (response.statusCode != 200) return null;

    return response.data;
  }
}
