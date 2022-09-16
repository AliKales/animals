import 'package:animals/common_libs.dart';
import 'package:animals/library/ui/components/scaffold_random_photos.dart';
import 'package:dio/dio.dart';

import '../../../api_list.dart';
import '../../../core/services/dio/dio_dog_photos.dart';

class DogPhotosView extends StatelessWidget {
  const DogPhotosView({super.key, required this.apiList});

  final ApiList apiList;

  @override
  Widget build(BuildContext context) {
    var function = DioDogPhotos(Dio());
    return ScaffoldRandomPhotos(
      description:
          "You will see random $_getType photos and you can download for free.",
      apiList: apiList,
      function: _isDog ? function.fetchData() : function.fetchShibeData(),
    );
  }

  String get _getType => _isDog ? "dog" : "shibe";

  bool get _isDog => apiList == ApiList.dogPhotos;
}
