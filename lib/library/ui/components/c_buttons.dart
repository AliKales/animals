import 'package:flutter/material.dart';

class CElevatedButton extends ElevatedButton {
  CElevatedButton(context,
      {super.key, required VoidCallback onPressed, required String text})
      : super(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
}
