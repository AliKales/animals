import 'package:animals/library/core/cubit/cubit_api/cubit_api.dart';
import 'package:animals/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.pink);
    return BlocProvider(
      create: (context) => CubitApi(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          toggleableActiveColor: colorScheme.primary,
          colorScheme: colorScheme,
          dividerTheme: const DividerThemeData(thickness: 2),
          textTheme: const TextTheme(
            displayMedium: TextStyle(color: Colors.black),
            displaySmall: TextStyle(color: Colors.black),
            headlineLarge: TextStyle(color: Colors.black),
          ),
        ),
        routerDelegate: appRouter.routerDelegate,
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
      ),
    );
  }
}
