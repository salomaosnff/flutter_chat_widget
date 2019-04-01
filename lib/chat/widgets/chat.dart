import 'package:flutter/material.dart';
import 'message_bubble.dart';
import 'message_list.dart';
import 'input_bar.dart';
import '../data/conversation.dart';
import '../data/message.dart';
import '../data/user.dart';

final defaultMessageBubbleBuilder = () => ChatMessageBubble();

class ChatWidget extends StatefulWidget {
  final Function onSubmit;
  final Conversation conversation;
  final Function messageListBuilder;
  final Function messageBubbleBuilder;
  final Function messageLogBuilder;
  final Function chatInputBuilder;

  @override
  State<StatefulWidget> createState() => new ChatWidgetState();

  ChatWidget(
      {Key key,
      this.conversation,
      this.onSubmit,
      this.messageBubbleBuilder,
      this.messageListBuilder,
      this.messageLogBuilder,
      this.chatInputBuilder})
      : super(key: key);
}

class ChatWidgetState extends State<ChatWidget> {
  Conversation conversation = Conversation();

  @override
  void initState() {
    conversation = widget.conversation;
    super.initState();
  }

  Widget buildChatList() {
    if (widget.messageListBuilder is Function) {
      return widget.messageListBuilder(conversation);
    }

    return ChatMessageList(
      conversation: conversation,
      messageBubbleBuilder: widget.messageBubbleBuilder,
      messageLogBuilder: widget.messageLogBuilder
    );
  }

  Widget buildChatInput() {
    if (widget.chatInputBuilder is Function) {
      return widget.chatInputBuilder(conversation);
    }

    return ChatInputBar(
      conversation: conversation,
      onSubmit: (List<Message> messages) {
        if (messages.length > 0) {
          addMessages(messages);
          if (widget.onSubmit is Function) widget.onSubmit(messages);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: buildChatList(),
        ),
        buildChatInput(),
      ],
    );
  }

  void addMessages(List<Message> messages) {
    setState(() {
      this.conversation.messages.insertAll(0, messages);
    });
  }
}
