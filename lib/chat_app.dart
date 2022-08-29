import 'package:basic_chat_app/chat_message.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [];
  TextEditingController _controller = TextEditingController();

  void submited( String text ){
    _controller.clear();
    ChatMessage message = ChatMessage(text: text);
    setState(() {
      messages.insert(0, message);
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible
        (
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_, int index){
             return  messages[index];

            },
            itemCount: messages.length,
            )
        ),
        Divider(

        ),
        _textcomposurewidget()

      ],
    );
  }

  Widget _textcomposurewidget(){
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
              Flexible(
               child: TextField(
                     decoration: InputDecoration.collapsed(
                       hintText: "Send a message"
                     ),
                     controller: _controller,
                     onSubmitted: submited
                   ),
             ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: IconButton(
            onPressed: (){
              submited(_controller.text);
            },
             icon: Icon(Icons.send)),
        )
          ],
        )
       
      ),
    );

  }
}