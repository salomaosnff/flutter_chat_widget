import 'user.dart';
import 'message.dart';

class Conversation {
  List<User> users = [];
  List<Message> messages = [];
  User currentUser;

  Conversation({ this.users, this.messages, this.currentUser });
}