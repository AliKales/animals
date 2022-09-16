import 'package:animals/common_libs.dart';
import 'package:animals/library/core/models/m_bird_sound.dart';
import 'package:animals/library/core/utilities/u_url_launcher.dart';

class BirdSoundDetails {
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium;

  List<Widget> birdSoundDetailsView(
      BuildContext context, MBirdSound birdSound) {
    return [
      _textTitle(birdSound, context),
      const Divider(),
      _textData(context, "Recordist: ${birdSound.rec}"),
      _textData(context, "Country: ${birdSound.cnt}"),
      _textData(context, "Elevation: ${birdSound.alt}"),
      _textData(context, "Date: ${birdSound.date}"),
      _textData(context, "Time: ${birdSound.time}"),
      _textData(context, "Latitude: ${birdSound.lat}"),
      _textData(context, "Longitude: ${birdSound.lng}"),
      if (birdSound.lat != null && birdSound.lng != null)
        TextButton(
          onPressed: () {
            UUrlLauncher().launchGoogleMaps(birdSound.lat!, birdSound.lng!);
          },
          child: const Text("See Map"),
        ),
      TextButton(
        onPressed: () {
          UUrlLauncher().launchBirdSoundSource(birdSound.id!);
        },
        child: const Text("See Source"),
      ),
    ];
  }

  Padding _textData(BuildContext context, String text) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: Text(text, style: context.textTheme.titleLarge),
    );
  }

  Align _textTitle(MBirdSound birdSound, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        birdSound.gen ?? "",
        style: context.textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
