import 'dart:async';

import 'package:flutter/material.dart';
import '../chat/widgets/chat.dart';
import '../chat/data/user.dart';
import '../chat/data/message.dart';
import '../chat/data/conversation.dart';

class ChatView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatViewState();
}

class ChatViewState extends State<ChatView> {
  Conversation conversation = new Conversation(
    currentUser: User(id: 1, info: {
      'name': 'Usuário 1'
    }),
    users: [
      User(id: 2)
    ],
    messages: []
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(this.startLogsSimulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ChatWidget(
        conversation: conversation,
        onSubmit: simulateResponse,
      ),
    );
  }

  simulateResponse(List<Message> messages) {
    // Simular resposta
    Timer(Duration(seconds: 2), (){
      setState(() {
        conversation.messages.insertAll(0, messages.map((item){
          return new Message(
            id: item.id, 
            date: item.date, 
            log: item.log, 
            text: item.text, 
            user: conversation.users[0]
          );
        }));
      });
    });
  }

  void startLogsSimulation (_) {
    setState(() {
      conversation.messages.insert(0, Message(text: 'Escreva uma mensagem', log: true));
    });
    Timer.periodic(Duration(seconds: 10), (_) => setState(() {
      conversation.messages.insert(0, Message(text: 'Log: ${DateTime.now()}', log: true));
    }));
  }
}


