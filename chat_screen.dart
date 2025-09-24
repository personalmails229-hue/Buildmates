import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(child: ListView(
            padding: const EdgeInsets.all(8),
            children: List.generate(6, (i) => Align(
              alignment: i%2==0?Alignment.centerLeft:Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
                child: Text(i%2==0? 'Labour: Is ₹1200 acceptable?':'Contractor: Yes, confirm arrival 8AM'),
              ),
            )),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(decoration: const InputDecoration(hintText: 'Type a message'))),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }
}
