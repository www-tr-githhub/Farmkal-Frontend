class MessageModel {
  String? type;
  String? message;

  MessageModel({required this.type, required this.message});

  // Create a factory constructor to convert a JSON map into a MessageModel object.
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      type: json['type'] as String,
      message: json['message'] as String,
    );
  }

  // Create a method to convert a MessageModel object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'message': message,
    };
  }
}

class ChatRoom {
  String roomId; // Unique identifier for the chat room.
  List<MessageModel> messages; // List of messages within the chat room.

  ChatRoom({
    required this.roomId,
    required this.messages,
  });

  // Create a factory constructor to convert a JSON map into a ChatRoom object.
  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    List<dynamic> messageList = json['messages'] as List<dynamic>;
    List<MessageModel> parsedMessages = messageList
        .map((messageJson) => MessageModel.fromJson(messageJson))
        .toList();

    return ChatRoom(
      roomId: json['roomId'] as String,
      messages: parsedMessages,
    );
  }

  // Create a method to convert a ChatRoom object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }
}