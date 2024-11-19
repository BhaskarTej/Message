class MessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      senderId: map['senderId'],
      senderName: map['senderName'],
      content: map['content'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}