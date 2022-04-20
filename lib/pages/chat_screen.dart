import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/chat_model.dart';


class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  // ignore: deprecated_member_use
  List<ChatModel> _notes = List<ChatModel>();

  Future<List<ChatModel>> fetchNotes() async {
      var url = 'https://centralino.gamwki.it/api/ticket_aperti/mDLKbai0cQwLl6F4x3mNVAFFHMiucVPdj3h3ahHYksM2TYZTIa';

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
  @override
  void initState() {
  fetchNotes().then((value) {
    setState(() {
      _notes.addAll(value);
      });
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    fetchNotes().then ( (value) {
      setState(() {
    _notes.addAll(value);    
      });
    });
    return new ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, index) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                onTap: ()=>print('ciao'),
                leading: new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage('https://scontent-mia3-1.xx.fbcdn.net/v/t1.6435-9/78954370_1394163710757529_5042324745471655936_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Xd1jR33zT8YAX8avFGj&_nc_ht=scontent-mia3-1.xx&oh=00_AT_cMRNVJlshEfimqIzGEcTF1vjkioebb923HPb9-KTrig&oe=6283C8F7'),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      _notes[index].name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      _notes[index].time,
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    _notes[index].message,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
