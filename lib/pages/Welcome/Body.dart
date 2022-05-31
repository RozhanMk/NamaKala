

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           
        ],
      ),
      size: size,
    );
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
