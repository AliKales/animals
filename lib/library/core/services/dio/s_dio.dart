import 'package:animals/library/core/utilities/u_permissions.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class SDio {
  SDio(this.dio);
  final Dio dio;
}

class DioDownload extends SDio {
  DioDownload(super.dio);

  Future<bool> downloadFile(String url) async {
    if (!await UPermissions().checkPermissions([Permission.storage])) {
      return false;
    }

    String savePath =
        "storage/emulated/0/Pictures/Animals/${url.split("/").last}";

    var response = await dio.download(url, savePath);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
