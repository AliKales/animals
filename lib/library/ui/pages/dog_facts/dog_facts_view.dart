import 'package:animals/common_libs.dart';
import 'package:animals/library/core/services/dio/dio_dog_facts.dart';
import 'package:dio/dio.dart';

import '../../../api_list.dart';
import '../../components/scaffold_facts_widget.dart';

class DogFactsView extends StatelessWidget {
  const DogFactsView({super.key, required this.apiList});

  final ApiList apiList;

  @override
  Widget build(BuildContext context) {
    return ScaffoldFactsWidget(
      apiList: apiList,
      function: DioDogFacts(Dio()).fetchData(),
      description: "Dog Facts Description",
    );
  }
}
