import 'user.dart';

class Message {
  dynamic id;
  String text;
  DateTime date;
  User user;
  bool log;

  Message({
    this.id,
    this.text,
    DateTime date,
    this.user,
    this.log:false
  }): this.date = date ?? DateTime.now();
}