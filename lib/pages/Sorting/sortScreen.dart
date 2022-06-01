import 'package:example/const.dart';
import 'package:example/sizeHandler.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class sortingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            
            Container(
            margin: EdgeInsets.symmetric(vertical: 50 , horizontal: 15),
            //width:  MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 196, 218).withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 9),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "جستجو در نماکالا",
                  hintStyle: TextStyle(
                    fontFamily: "A Mitra 05",
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(Icons.search),iconColor: Color.fromRGBO(110, 10, 138, 1)),
            ),
              ),
          ],
          ),
      ),
    );
  }
}
