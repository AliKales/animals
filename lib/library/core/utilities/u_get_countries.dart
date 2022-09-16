import 'package:animals/library/core/services/dio/dio_countries.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class UGetCountries {
  Future<List<String>?> getCountries() async {
    return await DioCountries(Dio()).fetchData();
  }

  Future<List<String>?> getCountriesWithProgress(BuildContext context) async {
    CustomProgressIndicator().showProgressIndicator(context);
    var result = await DioCountries(Dio()).fetchData();
    Navigator.pop(context);

    return result;
  }
}
