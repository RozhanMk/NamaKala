import 'package:example/pages/Home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Welcome/Body.dart';

class signupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child:Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom:0,
                left:0,
                child: Image.asset(
                  "assets/images/signHaze.png",
                  color: Colors.white.withOpacity(0.3),
                  colorBlendMode: BlendMode.modulate,
                  //width:size.width,
                ),
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 130,
                  ),
                  Text(
                    "ثبت نام",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "A Mitra 05",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Column(
                children:<Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: size.height*0.08,
                    width: size.width * 0.8,
                    
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 212, 196, 218),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      style: TextStyle(fontFamily: "A Mitra 05"),
                      decoration: InputDecoration(
                        icon: Icon(Icons.person , color:Color.fromRGBO(110, 10, 138, 1)),
                        hintText: "*نام و نام خانوادگی",
                        hintStyle: TextStyle( fontFamily: "A Mitra 05"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  height: size.height*0.08,
                  width: size.width * 0.8,
                  
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 196, 218),
                    borderRadius: BorderRadius.circular(30),
                  ),    
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontFamily: "A Mitra 05"),
                    decoration: InputDecoration(   
                      icon: Icon(Icons.phone , color:Color.fromRGBO(110, 10, 138, 1)),
                      
                      hintText: "*شماره تماس",
                      hintStyle: TextStyle( fontFamily: "A Mitra 05"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                    height: 10,
                  ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  height: size.height*0.08,
                  width: size.width * 0.8,
                  
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 196, 218),
                    borderRadius: BorderRadius.circular(30),
                  ),    
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontFamily: "A Mitra 05"),
                    decoration: InputDecoration(   
                      icon: Icon(Icons.lock , color:Color.fromRGBO(110, 10, 138, 1)),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(110, 10, 138, 1),
                      ),
                      hintText: "*رمز عبور",
                      hintStyle: TextStyle( fontFamily: "A Mitra 05"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                 height: 10,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  height: size.height*0.08,
                  width: size.width * 0.8,
                  
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 196, 218),
                    borderRadius: BorderRadius.circular(30),
                  ),    
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontFamily: "A Mitra 05"),
                    decoration: InputDecoration(   
                      icon: Icon(Icons.store , color:Color.fromRGBO(110, 10, 138, 1)),
                      
                      hintText: "نام فروشنده یا فروشگاه",
                      hintStyle: TextStyle( fontFamily: "A Mitra 05"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                    height: 10,
                  ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  height: size.height*0.08,
                  width: size.width * 0.8,
                  
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 196, 218),
                    borderRadius: BorderRadius.circular(30),
                  ),    
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontFamily: "A Mitra 05"),
                    decoration: InputDecoration(   
                      icon: Icon(Icons.email , color:Color.fromRGBO(110, 10, 138, 1)),
                      
                      hintText: "ایمیل",
                      hintStyle: TextStyle( fontFamily: "A Mitra 05"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
               SizedBox(
                  height: 30,
                ),
                Container(
                child: RoundedButton(
                  color: Color.fromRGBO(110, 10, 138, 1),
                  text: "ورود",
                  textColor: Colors.white,
                  press : (){Navigator.push(
                context , MaterialPageRoute(builder: (context)
                {return homeScreen();},),);},
                ),
              ), 
                
            ],
          )
            ]  
        )
        ),
      )
    );
  }
}
