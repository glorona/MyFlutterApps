import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              clickCounter == 1 ? 'Click' : 'Clicks',
              //otra forma 'Click${clickCounter == 1 ? '':'s'}
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              clickCounter++;
            });
            //Tambien puede hacerse
            //setState((){}); y por fuera el clickCounter
          },
          child: const Icon(Icons.plus_one)),
    );
  }
}
