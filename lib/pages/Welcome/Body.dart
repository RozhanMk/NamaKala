import 'package:example/pages/Signup/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:example/pages/Login/loginScreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
            ),
            Container(
              child: RoundedButton(
                color: Color.fromRGBO(110, 10, 138, 1),
                text: "ورود",
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return loginScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: RoundedButton(
                color: Color.fromARGB(255, 212, 196, 218),
                text: "ثبت نام",
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return signupScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      size: size,
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback? press;
  const RoundedButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.textColor,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
            onPressed: press,
            child: Text(
              this.text,
              style: TextStyle(
                  color: this.textColor,
                  fontFamily: "A Mitra 05",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary: this.color,
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
            )));
  }
}

class Background extends StatelessWidget {
  final Widget child;
  final Size size;
  const Background({
    Key? key,
    required this.child,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 200,
            child: Image.asset(
              "assets/images/welcome1.png",
              color: Colors.white.withOpacity(0.3),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
