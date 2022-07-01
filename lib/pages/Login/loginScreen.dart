import 'dart:convert';
import 'dart:io';

import 'package:example/models/ProfilePerson.dart';
import 'package:example/pages/Home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Welcome/Body.dart';
import 'package:example/pages/Signup/signupScreen.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  ProfilePerson person =
      ProfilePerson("name", "p", "p", "email", "store", [], [], []);
  final TextEditingController _callControl = TextEditingController(text: "");
  final TextEditingController _passControl = TextEditingController(text: "");
  bool _isObscure = true;
  String _log = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/loginHaze.png",
                color: Colors.white.withOpacity(0.3),
                colorBlendMode: BlendMode.modulate,
                //width:size.width,
              ),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                Text(
                  "ورود",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "A Mitra 05",
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 210,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 212, 196, 218),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _callControl,
                      style: TextStyle(fontFamily: "A Mitra 05"),
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone,
                            color: Color.fromRGBO(110, 10, 138, 1)),
                        hintText: "شماره تماس",
                        hintStyle: TextStyle(fontFamily: "A Mitra 05"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 212, 196, 218),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _passControl,
                      obscureText: _isObscure,
                      style: TextStyle(fontFamily: "A Mitra 05"),
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock,
                            color: Color.fromRGBO(110, 10, 138, 1)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: "رمز عبور",
                        hintStyle: TextStyle(fontFamily: "A Mitra 05"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  child: RoundedButton(
                    color: Color.fromRGBO(110, 10, 138, 1),
                    text: "ورود",
                    textColor: Colors.white,
                    press: () {
                      send(_callControl.text, _passControl.text);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return signupScreen();
                            },
                          ),
                        );
                      },
                      child: Text("ثبت نام",
                          style: TextStyle(
                            color: Color.fromRGBO(110, 10, 138, 1),
                            fontFamily: "A Mitra 05",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Text(
                      "ثبت نام نکرده اید؟ ",
                      style: TextStyle(
                        color: Color.fromRGBO(110, 10, 138, 1),
                        fontFamily: "A Mitra 05",
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Text(
                  _log,
                  style: TextStyle(
                    fontFamily: "A Mitra 05",
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  send(String call, String pass) async {
    String request = "login,telephone:$call,password:$pass\n";

    await Socket.connect("192.168.43.204", 8000).then((serverSocket) {
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) async {
        String result = utf8.decode(response);
        if (result == "valid") {
          getPerson(_callControl.text);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return homeScreen(person: person);
              },
            ),
          );
        } else {
          setState(() {
            if (_log == "") {
              _log += "دوباره تلاش کنید";
            }
          });
        }
      });
    });
  }

  getPersonServer(String call) async {
    String request = "getPersonProfile,$call\n";

    await Socket.connect("192.168.43.204", 8000).then((serverSocket) {
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) async {
        String result = utf8.decode(response);
        person = ProfilePerson(
            result.split(",")[0],
            result.split(",")[1],
            result.split(",")[2],
            result.split(",")[3],
            result.split(",")[4],
            [],
            demo,
            demo);
      });
    });
  }

  getPerson(String call) {
    ProfilePerson p;
    for (p in persons) {
      if (p.phone == call) {
        person = p;
        return;
      }
    }
    getPersonServer(call);
  }
}
