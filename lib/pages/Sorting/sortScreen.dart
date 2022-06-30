import 'package:example/const.dart';
import 'package:example/models/Product.dart';
import 'package:example/models/group.dart';
import 'package:example/pages/Products/productsScreen.dart';
import 'package:flutter/material.dart';
import 'package:example/models/ProfilePerson.dart';

import 'package:flutter/material.dart';

class sortingScreen extends StatelessWidget {
  ProfilePerson person;
  sortingScreen({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                  //width:  MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 196, 218).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (value) => print(value),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "جستجو در نماکالا",
                        hintStyle: TextStyle(
                          fontFamily: "A Mitra 05",
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(Icons.search),
                        iconColor: Color.fromRGBO(110, 10, 138, 1)),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 110),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "کالای دیجیتال",
                        style: TextStyle(
                          fontFamily: "A Mitra 05",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 140),
                    Container(
                      height: 150,
                      child: ListView.separated(
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (context, _) => SizedBox(width: 10),
                        itemBuilder: (context, index) => buildCard(
                            groupDigital.elementAt(index),
                            context,
                            groupDigital.elementAt(index).name),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 320),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "پوشاک",
                        style: TextStyle(
                          fontFamily: "A Mitra 05",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 350),
                    Container(
                      height: 150,
                      child: ListView.separated(
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (context, _) => SizedBox(width: 10),
                        itemBuilder: (context, index) => buildCard(
                            groupClothes.elementAt(index),
                            context,
                            groupClothes.elementAt(index).name),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 540),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "کتاب و لوازم التحریر",
                        style: TextStyle(
                          fontFamily: "A Mitra 05",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 570),
                    Container(
                      height: 150,
                      child: ListView.separated(
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        separatorBuilder: (context, _) => SizedBox(width: 10),
                        itemBuilder: (context, index) => buildCard(
                            groupBook.elementAt(index),
                            context,
                            groupBook.elementAt(index).name),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 740),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "ورزش و سفر",
                        style: TextStyle(
                          fontFamily: "A Mitra 05",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 770),
                    Container(
                      height: 150,
                      child: ListView.separated(
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (context, _) => SizedBox(width: 10),
                        itemBuilder: (context, index) => buildCard(
                            groupSport.elementAt(index),
                            context,
                            groupSport.elementAt(index).name),
                      ),
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

  Widget buildCard(Group group, BuildContext context, String name) => SizedBox(
        width: 140,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.02,
                child: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 212, 196, 218).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(group.image),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => productsScreen(title: name, person: person),
                          ));
                    }),
              ),
            ),
            Text(
              group.name,
              style: TextStyle(
                fontFamily: "A Mitra 05",
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
}
