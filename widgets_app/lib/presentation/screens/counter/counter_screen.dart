import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//ConsumerWidget para consumir los providers en riverpod, en vez de usar stless
//Aplica para stless widgets
//Ofrece la referencia en el build, indica que voy a necesitar un provider
class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: isDarkMode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined))
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
          //No usar watch en metodos, es una mala practica, ya que no se redibuja nada.
          onPressed: () {
            //Una forma de hacerlo es esto
            //ref.read(counterProvider.notifier).state++;
            //Otra forma
            ref.read(counterProvider.notifier).update((state) => state + 1);
          },
          child: const Icon(Icons.add)),
    );
  }
}
