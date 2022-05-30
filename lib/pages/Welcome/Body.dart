import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //height and width of screen
    return Background(size: size);
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

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
            bottom:30,
            child: Image.asset("assets/images/welcome1.png", color: Colors.white.withOpacity(0.3), colorBlendMode: BlendMode.modulate,),
            
          ),
        ],
      ),
    );
  }
}
