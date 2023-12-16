// To parse this JSON data, do
//
//     final ideaResponse = ideaResponseFromMap(jsonString);

import 'dart:convert';

IdeaResponse ideaResponseFromMap(String str) =>
    IdeaResponse.fromMap(json.decode(str));

String ideaResponseToMap(IdeaResponse data) => json.encode(data.toMap());

class IdeaResponse {
  int index;
  Message message;
  dynamic logprobs;
  String finishReason;

  IdeaResponse({
    required this.index,
    required this.message,
    this.logprobs,
    required this.finishReason,
  });

  factory IdeaResponse.fromMap(Map<String, dynamic> json) => IdeaResponse(
        index: json["index"],
        message: Message.fromMap(json["message"]),
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toMap() => {
        "index": index,
        "message": message.toMap(),
        "logprobs": logprobs,
        "finish_reason": finishReason,
      };
}

class Message {
  String role;
  String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "role": role,
        "content": content,
      };
}
