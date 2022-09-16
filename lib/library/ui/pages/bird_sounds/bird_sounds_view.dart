import 'package:animals/common_libs.dart';
import 'package:animals/library/api_list.dart';
import 'package:animals/library/core/cubit/cubit_api/cubit_api.dart';
import 'package:animals/library/core/models/m_bird_sound.dart';
import 'package:animals/library/core/services/dio/dio_bird_sounds.dart';
import 'package:animals/library/core/utilities/u_get_countries.dart';
import 'package:animals/library/core/utilities/u_just_audio.dart';
import 'package:animals/library/ui/components/apis_appbar.dart';
import 'package:animals/library/ui/components/cubit_api_widget/cubit_api_widget.dart';
import 'package:animals/library/ui/pages/bird_sounds/bird_sound_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:uikit/uikit.dart';

part 'complete_widget.dart';

class BirdSoundsView extends StatefulWidget {
  const BirdSoundsView({super.key, required this.apiList});

  final ApiList apiList;

  @override
  State<BirdSoundsView> createState() => _BirdSoundsViewState();
}

class _BirdSoundsViewState extends State<BirdSoundsView> {
  void _handleStart(BuildContext context) async {
    List<String>? countries =
        await UGetCountries().getCountriesWithProgress(context);

    if (countries == null) {
      CustomSnackbar().showSnackBar(context, "Error!");
      return null;
    }

    int? result = await CustomDialog.showDialogRadios(
      context: context,
      list: countries,
      title: "Country",
    );

    if (result == null) return;

    context.read<CubitApi>().fetchData(
          DioBirdSounds(Dio()).fetchData(countries[result]),
        );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CubitApi>().reset();

        return true;
      },
      child: Scaffold(
        appBar: ApisAppBar(
          context,
          text: widget.apiList.title,
          resetCubit: true,
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: CubitApiWidget(
            completeWidget: (p0) {
              if (p0 is List<MBirdSound>) {
                return _CompleteWidget(birdSounds: p0);
              }
              return Container();
            },
            description: "You will see birds with their sounds.",
            onButtonClick: () => _handleStart(context),
          ),
        ),
      ),
    );
  }
}
