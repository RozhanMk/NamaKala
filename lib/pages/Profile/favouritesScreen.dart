import 'package:example/models/Cart.dart';
import 'package:example/models/Product.dart';
import 'package:example/pages/Detail/detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:example/models/ProfilePerson.dart';


class favouritesScreen extends StatelessWidget {
  ProfilePerson person;
  favouritesScreen({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              "علاقه مندی",
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "A Mitra 05",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: demoCarts.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ItemBox(context, demoCarts[index].product),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row ItemBox(BuildContext context, Product item) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //SizedBox(height: 80),
      Expanded(
        child: InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 180,
              //width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 212, 196, 218).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(item.image),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        detailScreen(product: item, person: person),
                  ));
            }),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            width: 200,
            child: Text(
              item.title,
              style: TextStyle(
                fontFamily: "A Mitra 05",
              ),
            ),
          ),
          Text(
            item.price,
            style: TextStyle(
              fontFamily: "A Mitra 05",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ]);
  }
}
