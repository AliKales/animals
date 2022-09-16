import 'package:permission_handler/permission_handler.dart';

class UPermissions {
  Future<bool> checkPermissions(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> statuses = await permissions.request();

    List<PermissionStatus> listOfStatuses = statuses.values.toList();

    if (listOfStatuses
        .every((element) => element == PermissionStatus.granted)) {
      return true;
    }

    return false;
  }
}
