import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';
//import 'package:hello_world_app/presentation/counter/counter_screen.dart';

void main() {
  runApp(const MyApp()); //Corre la app principal
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  //Todos los StatelessWidgets necesitan su build
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //Esto no cambiara durante toda la app.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple
        ),
      home: const CounterFunctionsScreen()
    );
  }
}
