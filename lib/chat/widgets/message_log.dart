import 'package:flutter/material.dart';

class MessageLog extends StatelessWidget {
  final String text;

  MessageLog({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(child: Divider(color: Colors.grey)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(text, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Divider(color: Colors.grey)),
        ],
      ),
    );
  }
}
