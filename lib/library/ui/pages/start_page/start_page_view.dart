import 'package:animals/library/ui/components/c_buttons.dart';
import 'package:animals/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

class StartPageView extends StatelessWidget {
  const StartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "HELLO!",
                style: context.textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Let's discover planet of animals!",
                style: context.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 3),
              CElevatedButton(
                context,
                onPressed: () {
                  context.replace(PagePaths.apis);
                },
                text: "Start",
              ),
              context.emptySizedHeightBoxNormal
            ],
          ),
        ),
      ),
    );
  }
}
