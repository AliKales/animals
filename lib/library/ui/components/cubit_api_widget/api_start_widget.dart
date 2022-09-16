import 'package:animals/common_libs.dart';
import 'package:animals/library/core/cubit/cubit_api/cubit_api.dart';
import 'package:animals/library/ui/components/c_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiStartWidget extends StatelessWidget {
  const ApiStartWidget({
    super.key,
    required this.description,
    this.function,
    this.onButtonClick,
  });

  final String description;
  final Future? function;
  final VoidCallback? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            description,
            style: context.textTheme.headlineSmall,
            maxLines: null,
            overflow: TextOverflow.fade,
            softWrap: true,
          ),
        ),
        context.emptySizedHeightBoxLow,
        CElevatedButton(
          context,
          onPressed: onButtonClick ??
              () {
                if (function != null) {
                  context.read<CubitApi>().fetchData(function!);
                }
              },
          text: "Start",
        ),
        context.emptySizedHeightBoxNormal,
      ],
    );
  }
}
