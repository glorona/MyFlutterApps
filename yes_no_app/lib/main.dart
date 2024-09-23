import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart'; //usando mateapp es un snippet

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()) // Guion bajo es buildcontext, pero no se usa por eso se ignora.
      ],
      child: MaterialApp(
        title: 'Yes No App',
        theme: AppTheme(selectedColor: 1).theme(),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
