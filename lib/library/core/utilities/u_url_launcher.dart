import 'package:animals/common_libs.dart';
import 'package:uikit/uikit.dart';
import 'package:url_launcher/url_launcher.dart';

class UUrlLauncher {
  Future<void> launchUrlCustom(String url, [BuildContext? context]) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      if (context != null) CustomSnackbar().showSnackBar(context, "Error");
    }
  }

  void launchGoogleMaps(String lat, String lng) {
    launchUrlCustom("http://www.google.com/maps/place/$lat,$lng");
  }

  void launchBirdSoundSource(String id) {
    launchUrlCustom("https://xeno-canto.org/$id");
  }

  void launchGoogleImages(String query) {
    launchUrlCustom("https://www.google.com/search?tbm=isch&q=$query");
  }
}
