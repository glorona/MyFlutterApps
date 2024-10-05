import 'package:cinemapedia/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      //Ya no se necesita home, recuerda! Esta en la configuracion del router..
    );
  }
}