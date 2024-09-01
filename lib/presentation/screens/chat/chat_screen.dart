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
          leading: const Padding(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://media.licdn.com/dms/image/D4E03AQG71tMVZoFz7Q/profile-displayphoto-shrink_200_200/0/1703629446804?e=2147483647&v=beta&t=4yAgZViXDFGhprt0fn792_1wxJaZ7SFiMFECmhPUzSA"),
            ),
          ),
          title: const Text(
            "Miguel yes or no app 👨‍💻",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          titleTextStyle:
              const TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollContoller,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            //caja de texto de mensajes
            SizedBox(
                height: 58,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: MessageFieldBox(
                    onValue: chatProvider.sendMessage,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
