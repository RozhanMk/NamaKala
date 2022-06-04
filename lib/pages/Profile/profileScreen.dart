import 'package:example/pages/Profile/favouritesScreen.dart';
import 'package:example/pages/Profile/myProductsScreen.dart';
import 'package:example/pages/Profile/ordersScreen.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    "پروفایل",
                    style: TextStyle(
                      fontFamily: "A Mitra 05",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 100),
                    SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 5),
                    Column(
                      children: [
                        SizedBox(height: 80),
                        Container(
                          margin: EdgeInsets.only(left: 185),
                          child: Text(
                            "نام و نام خانوادگی:",
                            style: TextStyle(
                              fontFamily: "A Mitra 05",
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: textBox("فاطمه میرزائی کلانی", Icons.person),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 240),
                          child: Text(
                            "شماره تماس:",
                            style: TextStyle(
                              fontFamily: "A Mitra 05",
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: textBox("09354179723", Icons.phone),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 290),
                          child: Text(
                            "ایمیل:",
                            style: TextStyle(
                              fontFamily: "A Mitra 05",
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: textBox("rozhan.mirzaei82@gmail.com", Icons.email),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: buttonBox("سفارشات", Icons.shop,
                      (){Navigator.push(
                      context , MaterialPageRoute(builder: (context)
                      {return ordersScreen();},),);},),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: buttonBox("کالاهای من", Icons.store,
                      (){Navigator.push(
                      context , MaterialPageRoute(builder: (context)
                      {return myProductsScreen();},),);},),
                      ),
                    
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: buttonBox("علاقه مندی", Icons.thumb_up ,
                      (){Navigator.push(
                      context , MaterialPageRoute(builder: (context)
                      {return favouritesScreen();},),);},),
                      ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textBox(String text, IconData icon) => Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 196, 218).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "A Mitra 05",
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );

Widget buttonBox(String text, IconData icon, VoidCallback? press) => InkWell(
    
    onTap: press,

    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      height:70,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 196, 218).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        children: [
        
          Icon(icon , color:Colors.black),

          SizedBox(width: 20),

          Expanded(

            child: Text(

              text,

              style: TextStyle(

                  color: Colors.black54,

                  fontFamily: "A Mitra 05",

                  fontSize: 12,

              ),

            ),

          ),
          

          Icon(Icons.arrow_forward_ios , color:Color.fromARGB(255, 92, 82, 91)),
        ],
      ),
    ),
  );

