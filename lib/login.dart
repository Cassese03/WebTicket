// ignore_for_file: await_only_futures
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterwhatsapp/models/login_data.dart';
import 'package:camera/camera.dart';
import 'package:flutterwhatsapp/pages/open_chat_screen.dart';
//import 'package:flutterwhatsapp/whatsapp_home.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter_session/flutter_session.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({key, this.title}) : super(key: key);
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<List<LoginData>> fetchLogin(numero) async {
    var url = 'https://centralino.gamwki.it/api/login/' + numero;

    var response = await http.get(Uri.parse(url));

    // ignore: deprecated_member_use
    var notes = List<LoginData>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(LoginData.fromJson(noteJson));
      }
    }
    return notes;
  }

  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  var numero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'),
            const SizedBox(
              height: 50.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 300.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) => (value.length) == 10
                          ? null
                          : "Inserire un numero di Telefono valido",
                      onChanged: (val) {
                        if (val.length == 10) numero = val;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Enter your number phone',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        // ignore: deprecated_member_use
                        List<LoginData> _session = List<LoginData>();
                        await fetchLogin(numero).then((value) {
                          _session.addAll(value);
                        });
                        if (_session.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new ChatScreen23(
                                    token: _session[0].token.toString(),
                                    contatto: _session[0].contatto.toString())),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor:
                                      Color.fromRGBO(217, 253, 211, 0.9),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 30),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text("Errore!",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const Text(
                                            "Non riusciamo ad associare il numero selezionato ad un nostro cliente.",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        MaterialButton(
                                          onPressed: () async {
                                            setState(() {});
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
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Entra',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
