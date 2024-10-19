import 'package:filenominatool/core/route/app_route.dart';
import 'package:filenominatool/core/route/app_route_name.dart';
import 'package:filenominatool/core/theme/app_theme.dart';
import 'package:filenominatool/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    appWindow.minSize = const Size(1000, 720); // Minimum pencere boyutu
    appWindow.size = const Size(1024, 720); // Başlangıç boyutu
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: Builder(builder: (context) {
        final themeMode = context.watch<ThemeCubit>().state.themeMode;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'File Nomina Tool',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          initialRoute: AppRouteName.home,
          onGenerateRoute: AppRoute.generate,
        );
      }),
    );
  }
}
