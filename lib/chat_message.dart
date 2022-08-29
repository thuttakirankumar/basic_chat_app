import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({
   required this.text
  });

  String text;
  String _name = "Kiran";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_name, style: Theme.of(context).textTheme.subtitle1,),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(text),
              )


            ],
          )
        ],
      ),
    );
  }
}