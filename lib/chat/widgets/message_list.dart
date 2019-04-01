import 'dart:async';

import 'package:flutter/material.dart';
import './message_bubble.dart';
import './message_log.dart';
import '../data/message.dart';
import '../data/conversation.dart';

class ChatMessageList extends StatefulWidget{
  final Conversation conversation;
  final Function messageBubbleBuilder;
  final Function messageLogBuilder;

  ChatMessageList ({
    Key key,
    this.conversation,
    this.messageBubbleBuilder,
    this.messageLogBuilder
  }): super(key: key);

  @override
  State<ChatMessageList> createState() => ChatMessageListState();
}

class ChatMessageListState extends State<ChatMessageList> {
  final _list = ScrollController(initialScrollOffset: 0);
  Conversation conversation;

  @override
  void initState() {
    this.conversation = widget.conversation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(238, 238, 238, 1),
      child: ListView(
        controller: _list,
        reverse: true,
        padding: EdgeInsets.all(8),
        children: buildItems(),
      ),
    );
  }

  Widget buildLogItem(Message message, Conversation conversation) {
    if (widget.messageLogBuilder is Function) {
      return widget.messageLogBuilder(message, conversation);
    }

    return MessageLog(text: message.text);
  }

  Widget buildMessageBubbleItem(Message message, Conversation conversation) {
    if (widget.messageBubbleBuilder is Function) {
      return widget.messageBubbleBuilder(message, conversation);
    }

    return ChatMessageBubble(message: message, conversation: conversation);
  }

  Widget buildMessageItem(Message message,  Conversation conversation) {
    return message.log ? buildLogItem(message, conversation) : buildMessageBubbleItem(message, conversation);
  }

  List<Widget> buildItems () {
    return this.conversation.messages.map((message) => buildMessageItem(message, conversation)).toList();
  }

  void scrollToBottom () {
    _list.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void updateScroll () {
    if (_list.offset <= 64) Timer.run(this.scrollToBottom);
  }

  @override
  void didUpdateWidget(ChatMessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.updateScroll();
  }
}