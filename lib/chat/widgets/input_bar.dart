import 'package:flutter/material.dart';
import '../data/message.dart';
import '../data/user.dart';
import '../data/conversation.dart';
import '../base/ChatInputBase.dart';

class ChatInputBar extends StatefulWidget implements ChatInputBase {
  @override
  final Conversation conversation;
  
  @override
  final Function onSubmit;

  final String value;

  @override
  State<StatefulWidget> createState() => new ChatInputBarState();

  ChatInputBar({ this.conversation, this.value, this.onSubmit });
}

class ChatInputBarState extends State<ChatInputBar> {
  @override
  User user;

  TextEditingController controller = new TextEditingController();
  
  @override
  void initState() {
    this.user = widget.conversation.currentUser;
    this.controller.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 4,
            color: Color.fromRGBO(0, 0, 0, .3),
            spreadRadius: 0
          )
        ]
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                autocorrect: true,
                autofocus: true,
                controller: controller,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none
                  ),
                  hintText: 'Escreva aqui...',
                  fillColor: Colors.white,
                  filled: true,
                  hasFloatingPlaceholder: false,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => submit(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit () {
    widget.onSubmit([new Message(text: controller.text, user: user)]);
    // controller.text = '';
    // controller.clear();
    // controller.text = null;
  }
}
