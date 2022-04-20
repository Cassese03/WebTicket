/*import 'dart:convert';

import 'package:http/http.dart' as http;
*/
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
 /* // ignore: deprecated_member_use
  List<ChatModel> _notes = List<ChatModel>();

  Future<List<ChatModel>> fetchNotes() async {
      var url = '';

      // ignore: deprecated_member_use
      List<ChatModel> _notes = List<ChatModel>();

      var response = await http.get(Uri.parse(url));

      // ignore: deprecated_member_use
      var notes = List<ChatModel>();

      if (response.statusCode == 200) {
        var notesJson = json.decode(response.body);
        for (var noteJson in notesJson) {
          notes.add(ChatModel.fromJson(noteJson));
          }
      }
      return notes;
  }
*/

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Pawan Kumar",
      message: "Hey Flutter, You are so amazing !",
      time: "15:30",
      avatarUrl:
          "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
  new ChatModel(
      name: "Harvey Spectre",
      message: "Hey I have hacked whatsapp!",
      time: "17:30",
      avatarUrl:          
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
       
  new ChatModel(
      name: "Fabio Giovine",
      message: "WeWeWe",
      time: "17:30",
      avatarUrl:         
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
  new ChatModel(
      name: "Mike Ross",
      message: "Wassup !",
      time: "5:00",
      avatarUrl:         
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
  new ChatModel(
      name: "Rachel",
      message: "I'm good!",
      time: "10:30",
      avatarUrl:         
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
  new ChatModel(
      name: "Givoanni",
      message: "I'm good!",
      time: "10:30",
      avatarUrl:         
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
  new ChatModel(
      name: "Lorenzo",
      message: "Wewewe",
      time: "17:20",
      avatarUrl:         
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
  new ChatModel(
      name: "Barry Allen",
      message: "I'm the fastest man alive!",
      time: "12:30",
      avatarUrl:         
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:         
      "https://scontent.fnap5-2.fna.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IXMJWINQEaEAX8qMvUO&_nc_ht=scontent.fnap5-2.fna&oh=00_AT-GX7JnblBCOtUAYu2Uw_XgFgBmF-JlySv-bkznjIC-yA&oe=627FD477"),
];
