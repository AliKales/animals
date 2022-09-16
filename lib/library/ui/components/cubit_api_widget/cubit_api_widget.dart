import 'package:animals/library/ui/components/cubit_api_widget/api_error_widget.dart';
import 'package:animals/library/ui/components/cubit_api_widget/api_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubit/cubit_api/cubit_api.dart';
import '../../../core/cubit/cubit_api/cubit_states_api.dart';

class CubitApiWidget extends StatelessWidget {
  const CubitApiWidget({
    super.key,
    required this.completeWidget,
    required this.description,
    this.function,
    this.onButtonClick,
  });

  final Widget Function(dynamic) completeWidget;
  final String description;
  final Future? function;
  final VoidCallback? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitApi, CSApi>(
      builder: (context, state) {
        if (state is CSCompleted) {
          return completeWidget(state.data);
        } else if (state is CSError) {
          return const ApiErrorWidget();
        } else if (state is CSStart) {
          return ApiStartWidget(
            description: description,
            function: function,
            onButtonClick: onButtonClick,
          );
        }

        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
