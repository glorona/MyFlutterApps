import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading the latest movies',
      'Popping some popcorn',
      'Getting the most popular movies',
      'Calling my girlfriend',
      'Almost done!',
      'This is taking longer than expected D:'
    ];

    return Stream.periodic(const Duration(milliseconds: 2000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Loading, wait please...'),
          const SizedBox(height: 30),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 30),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
