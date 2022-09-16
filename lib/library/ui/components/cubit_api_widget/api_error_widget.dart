import 'package:animals/common_libs.dart';

class ApiErrorWidget extends StatelessWidget {
  const ApiErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Error!",
        style: context.textTheme.displayMedium!.copyWith(
          color: context.colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
