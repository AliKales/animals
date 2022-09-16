import 'package:animals/library/core/cubit/cubit_api/cubit_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApisAppBar extends AppBar {
  ApisAppBar(
    BuildContext context, {
    super.key,
    required final String text,
    final bool resetCubit = false,
    final List<Widget>? actions,
  }) : super(
          actions: actions,
          leading: IconButton(
            onPressed: () {
              if (resetCubit) context.read<CubitApi>().reset();
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(text),
          centerTitle: true,
        );
}
