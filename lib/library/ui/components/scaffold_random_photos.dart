import 'package:animals/common_libs.dart';
import 'package:animals/library/api_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';

import '../../core/cubit/cubit_api/cubit_api.dart';
import '../../core/services/dio/s_dio.dart';
import 'apis_appbar.dart';
import 'cubit_api_widget/cubit_api_widget.dart';

class ScaffoldRandomPhotos extends StatelessWidget {
  const ScaffoldRandomPhotos({
    super.key,
    required this.apiList,
    required this.function,
    required this.description,
  });

  final ApiList apiList;
  final Future function;
  final String description;

  Future<void> _handleDownload(context, String link) async {
    CustomProgressIndicator().showProgressIndicator(context);
    bool result = await DioDownload(Dio()).downloadFile(link);
    Navigator.pop(context);

    if (result) {
      CustomSnackbar().showSnackBar(context, "Done!");
    } else {
      CustomSnackbar().showSnackBar(context, "Error!");
    }
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
          text: apiList.title,
          resetCubit: true,
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: CubitApiWidget(
            completeWidget: (p0) {
              if (p0 is String) {
                return _body(context, p0);
              }

              return const SizedBox.shrink();
            },
            description: description,
            function: function,
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, String link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: context.width),
        _image(context, link),
        _iconButtonDownload(context, link),
      ],
    );
  }

  Align _iconButtonDownload(context, String link) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () => _handleDownload(context, link),
        iconSize: 30,
        icon: const Icon(Icons.file_download_outlined),
      ).animate().slide(begin: const Offset(0, 1)),
    );
  }

  Expanded _image(BuildContext context, String link) {
    print(link);
    return Expanded(
      child: Center(
        child: ClipRRect(
          borderRadius: context.lowBorderRadius,
          child: Image.network(
            link,
            loadingBuilder: (context, child, loadingProgress) {
              int expectedBytes = loadingProgress?.expectedTotalBytes ?? 0;
              int cumulativeBytes = loadingProgress?.cumulativeBytesLoaded ?? 0;

              if (expectedBytes == cumulativeBytes) return child;

              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
