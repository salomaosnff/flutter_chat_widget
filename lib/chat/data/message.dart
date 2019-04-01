import 'user.dart';

class Message {
  final dynamic id;
  final String text;
  final DateTime date;
  final User user;
  final bool log;

  Message({
    this.id,
    this.text,
    DateTime date,
    this.user,
    this.log:false
  }): this.date = date ?? DateTime.now();
}