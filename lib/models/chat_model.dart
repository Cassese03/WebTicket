class ChatModel {
   String name;
   String message;
   String time;
   String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});

    ChatModel.fromJson (Map<String, dynamic> json){
      name = json['nominativo_operatore'];
      message = json['oggetto'];
      time = json['data'];
      avatarUrl = json['id_operatore_chiusura'];
    }

}    