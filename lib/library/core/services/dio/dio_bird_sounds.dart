import 'package:animals/library/core/models/m_bird_sound.dart';
import 'package:animals/library/core/services/dio/s_dio.dart';

class DioBirdSounds extends SDio {
  DioBirdSounds(super.dio);

  final baseUrl = "https://xeno-canto.org";
  final pathUrl = "/api/2/recordings?query=cnt:";

  Future<List<MBirdSound>?> fetchData(String country) async {
    var response = await dio.get("$baseUrl$pathUrl${country.toLowerCase()}");

    if (response.statusCode != 200) return null;

    List<MBirdSound> sounds = [];

    for (var element in response.data['recordings']) {
      sounds.add(MBirdSound.fromJson(element));
    }

    sounds.shuffle();

    return sounds;
  }
}
