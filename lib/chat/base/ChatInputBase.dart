import '../data/conversation.dart';

abstract class ChatInputBase {
  final Function onSubmit;
  final Conversation conversation;

  ChatInputBase({ this.onSubmit, this.conversation });
}