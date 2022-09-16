import 'package:animals/common_libs.dart';
import 'package:animals/library/ui/components/scaffold_facts_widget.dart';
import 'package:dio/dio.dart';

import '../../../api_list.dart';
import '../../../core/services/dio/dio_cat_facts.dart';

class CatFactsView extends StatelessWidget {
  const CatFactsView({super.key, required this.apiList});

  final ApiList apiList;

  @override
  Widget build(BuildContext context) {
    return ScaffoldFactsWidget(
      apiList: apiList,
      function: DioCatFacts(Dio()).fetchData(),
      description: "Cat Facts Description",
    );
  }
}
