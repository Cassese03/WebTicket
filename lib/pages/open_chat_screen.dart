import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/pages/camera_screen.dart';
//import 'package:flutterwhatsapp/models/risposta.dart';
//import 'package:flutter_session/flutter_session.dart';
//import '../models/login_data.dart';
import '../models/messages.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class ChatScreen23 extends StatefulWidget {
  final User user;
  final String token;
  final String contatto;
    final List<CameraDescription> cameras;
  ChatScreen23({this.token, this.user, this.contatto,this.cameras});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen23> {
  Future<http.Response> sendTicket(text, contatto) async {
    print(text);
    print(contatto);
    final response = await  http.post(
      Uri.parse('https://centralino.gamwki.it/api/crea_ticket/cZU95xvnDfgjp9fnyHqz4DVQKLCNw8IVeFRnm1KrVM9Q98YVA0'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'messaggio': text,
        'contatto': contatto,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return response;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return response;
    }
  }

  var text;
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color:
            isMe ? Theme.of(context).colorScheme.secondary : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(20.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        children: <Widget>[
          new ListTile(
            onTap: (){},
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              //backgroundImage: AssetImage('assets/logo1.png'),
            ),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  currentUser.name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),/*
                SizedBox(height: 8.0,),
                new Text(
                  message.time,
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                ),*/
              ],
            ),
            subtitle: new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(
                message.text,
                style: new TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          )
        ],
      ), 
      /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(backgroundImage: NetworkImage("https://centralino.gamwki.it/img/icona.png"),),
          Text(
            currentUser.name,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          //SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          //SizedBox(height: 8.0,),
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 8.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),*/
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg, /*
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          onPressed: () {},
        )*/
      ],
    );
  }

  _buildMessageComposer() {
    String contatto = widget.contatto;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {/*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new CameraScreen(widget.cameras)),
                        );*/},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                text = value;
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Scrivi qui il tuo ticket...',
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () async  {
                var risposta = await sendTicket(text, contatto);
                // ignore: unrelated_type_equality_checks
                if(risposta.statusCode == '200'){
                    showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text("Grazie per aver inviato il Ticket, verrà risolto il prima possibile!",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      MaterialButton(
                                        onPressed: () async {
                                          setState(() {
                                          });
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Arrivederci"),
                                        color: (Colors.red),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        minWidth: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                }else{
                  showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text("Errore! Non riusciamo a ricevere il ticket. Riprova più tardi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      MaterialButton(
                                        onPressed: () async {
                                          setState(() {
                                          });
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Riprova"),
                                        color: (Colors.red),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        minWidth: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                }
              }
         ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  String token = widget.token;
    String contatto = widget.contatto;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          contatto,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,/*
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],*/
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
