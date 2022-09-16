import 'package:animals/common_libs.dart';
import 'package:animals/library/api_list.dart';
import 'package:animals/library/core/cubit/cubit_api/cubit_api.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apis_appbar.dart';
import 'card_text_widget.dart';
import 'cubit_api_widget/cubit_api_widget.dart';

class ScaffoldFactsWidget extends StatefulWidget {
  const ScaffoldFactsWidget(
      {super.key,
      required this.apiList,
      required this.function,
      required this.description,
      this.child});

  final ApiList apiList;
  final Future function;
  final String description;
  final Widget Function<T>(dynamic)? child;

  @override
  State<ScaffoldFactsWidget> createState() => _ScaffoldFactsWidgetState();
}

class _ScaffoldFactsWidgetState extends State<ScaffoldFactsWidget> {
  List<String> facts = [];

  void _setFacts(List<String> value) {
    facts = value;
    facts.removeWhere((element) =>
        element.contains("subscribe") || element.contains("unsubscribe"));
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
            completeWidget: (value) {
              if (value is List<String>) {
                _setFacts(value);
                return _body();
              }
              return Container();
            },
            description: widget.description,
            function: widget.function,
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
      itemCount: facts.length,
      itemBuilder: (context, index) {
        String fact = facts[index];

        return CardTextWidget(
          text: fact,
        );
      },
    ).animate().slide(begin: const Offset(0, -1));
  }
}
