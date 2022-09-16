import 'package:animals/common_libs.dart';
import 'package:animals/library/core/services/dio/dio_cat_photos.dart';
import 'package:animals/library/ui/components/scaffold_random_photos.dart';
import 'package:dio/dio.dart';

import '../../../api_list.dart';

class CatPhotosView extends StatelessWidget {
  const CatPhotosView({super.key, required this.apiList, this.isGif = false});

  final ApiList apiList;
  final bool? isGif;

  @override
  Widget build(BuildContext context) {
    return ScaffoldRandomPhotos(
      description:
          "You will see random cat $getGifOrPhoto and you can download for free.",
      apiList: apiList,
      function: DioCatPhotos(Dio()).fetchData(isGif!),
    );
  }

  String get getGifOrPhoto => isGif! ? "gifs" : "photos";
}
