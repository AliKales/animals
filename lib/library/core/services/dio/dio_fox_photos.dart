import 'package:animals/library/core/services/dio/s_dio.dart';

class DioFoxPhotos extends SDio {
  DioFoxPhotos(super.dio);

  final baseUrl = "https://randomfox.ca/floof/";

  Future<String?> fetchData(bool isGif) async {
    var response = await dio.get(baseUrl);

    if (response.statusCode != 200) return null;

    return response.data['image'].replaceAll(r"\", "");
  }
}
