import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi amor <3'),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/joss.jpg'),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider =
        context.watch<ChatProvider>(); //Busca una instancia de chatprovider
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController, //Enlazar chatscrollcontroller con pantalla de chat
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return message.fromWho == FromWho.hers
                      ? HerMessageBubble(message: message,)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            //Caja de texto
            MessageFieldBox(
               onValue: chatProvider.sendMessage //Automaticamente se asume como valor de parametro si no se envia, ya que el callback tiene la misma cantidad de argumentos y en la misma posicion que el metodo.
              //onValue: (value) => chatProvider.sendMessage(value) //Otra forma de hacer
            ),
          ],
        ),
      ),
    );
  }
}
