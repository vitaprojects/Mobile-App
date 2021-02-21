class ChatModel {
  String messageid;
  String email;
  ChatModel({this.messageid, this.email});

  String createdAt;
  String message;
  String messageId;
  String senderEmail;
  String receiveremail;
  bool isImage;

  ChatModel.message({
    this.createdAt,
    this.message,
    this.messageId,
    this.senderEmail,
    this.receiveremail,
    this.isImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageid': messageid,
      'email': email,
    };
  }

  Map<String, dynamic> toMapMessage() {
    return {
      'createdAt': createdAt,
      'message': message,
      'messageId': messageId,
      'senderEmail': senderEmail,
      'receiveremail': receiveremail,
      'isImage': isImage,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChatModel(
      messageid: map['messageid'],
      email: map['email'],
    );
  }
}
