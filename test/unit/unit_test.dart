import 'dart:convert';

import 'package:animals/library/core/services/dio/dio_all_animals.dart';
import 'package:animals/library/core/services/dio/dio_bird_sounds.dart';
import 'package:dio/dio.dart';

void main() async {
  var result = await DioAllAnimals(Dio()).fetchData();

  print(jsonEncode(result!.first));
}
