import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chat/widgets/chat.dart';
import './chat/data/user.dart';
import './chat/data/message.dart';
import './chat/data/conversation.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: ChatWidget(
          conversation: new Conversation(
            currentUser: User(id: 1, info: 'Usuário 1'),
            users: [User(id: 1, info: 'Usuário 2')],
            messages: [
              Message(
                text: 'Usuário 2 entrou no chat',
                log: true
              )
            ]
          ),
          onSubmit: (List<Message> messages) {
            print('Enviando Mensagens...');
            print(messages);
          },
        ),
      ),
    );
  }
}

void main(List<String> args) {
  Intl.defaultLocale = 'pt_BR';
  runApp(ChatApp());
}
