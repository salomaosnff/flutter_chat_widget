import 'package:flutter/material.dart';
import '../data/message.dart';
import '../data/conversation.dart';

class ChatMessageBubble extends StatelessWidget {
  final Message message;
  final Conversation conversation;

  get right =>
      message.user != null && message.user.id == conversation.currentUser.id;

  ChatMessageBubble({this.message, this.conversation});

  @override
  Widget build(BuildContext context) { 
    String hour = message.date.hour >= 10 ? message.date.hour.toString() : '0${message.date.hour}';
    String minute = message.date.minute >= 10 ? message.date.minute.toString() : '0${message.date.minute}';

    MainAxisAlignment messageAlignment =
        right ? MainAxisAlignment.end : MainAxisAlignment.start;
    return Row(
      mainAxisAlignment: messageAlignment,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 8),
          constraints: BoxConstraints(maxWidth: 240),
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: right ? Colors.blue : Colors.white,
            borderRadius: right
              ? BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              )
              : BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 4),
                constraints: BoxConstraints(
                  minWidth: 30,
                ),
                child: Text(message.text,
                    style: TextStyle(
                        color: right ? Colors.white : Colors.black87,
                        fontSize: 16),
                    textAlign: TextAlign.left),
              ),
              Text('$hour:$minute',
                  style: TextStyle(
                      color: right ? Colors.white : Colors.black38,
                      fontSize: 12),
                  textAlign: TextAlign.right),
            ],
          ),
        )
      ],
    );
  }
}
