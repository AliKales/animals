import 'package:animals/common_libs.dart';
import 'package:flutter/services.dart';
import 'package:uikit/uikit.dart';

class UCopy {
  void copyText(String text, [BuildContext? context]) {
    Clipboard.setData(ClipboardData(text: text));

    CustomSnackbar().showSnackBar(context, "Copied");
  }
}
