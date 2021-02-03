import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Message.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({this.title});
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var message = const [];

  Future loadMessageList() async {
    var content = await rootBundle
        .loadString('data/message.json'); //these package is load files
    List collection = json.decode(
        content); //we get the string so convert it proper in json we use json decode
    //we are decoding the string into the collection
    List<Message> _messages =
        collection.map((json) => Message.fromjson(json)).toList();
    //[1,2,3,4].map((el))
    print(content);
    setState(() {
      message = _messages; //to assign collection to mwssages
    });
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: message.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          Message messages = message[index];
          return ListTile(
            title: Text(messages.subject),
            subtitle: Text(
              messages.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text("A"),
            ),
            trailing: Text("ssss"),
          );
        },
      ),
    );
  }
}
