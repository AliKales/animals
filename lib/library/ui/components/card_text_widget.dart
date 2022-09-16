import 'package:animals/common_libs.dart';
import 'package:animals/library/core/utilities/u_copy.dart';
import 'package:uikit/uikit.dart';

class CardTextWidget extends StatelessWidget {
  const CardTextWidget({super.key, required this.text});

  final String text;

  void _onPress(BuildContext context) async {
    int result = await CustomContextMenu.showContextMenu(context, icons: [
      Icons.copy,
    ]);

    if (result == 0) {
      UCopy().copyText(text, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onPress(context),
      child: Card(
        child: Padding(
          padding: context.paddingLow,
          child: Text(
            text,
            style: context.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
