import 'package:flutter/material.dart';

class Message {
  final String subject;
  final String body;

  Message({this.subject, this.body});

  Message.fromjson(Map<String, dynamic> json)
      : subject = json['subject'],
        body = json['body'];
}
