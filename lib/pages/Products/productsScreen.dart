import 'package:example/models/Product.dart';
import 'package:example/pages/Detail/detailScreen.dart';
import 'package:flutter/material.dart';

class productsScreen extends StatelessWidget {
  String phone;
  final String title;

  List<Product> chooseGroup(String title) {
    if (title == 'موبایل') {
      return mobileProducts;
    }
    return mobileProducts;
    //ToDo
  }

  productsScreen({Key? key, required this.title, required this.phone})
      : super(key: key);
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
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "A Mitra 05",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: this.chooseGroup(title).length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ItemBox(context, this.chooseGroup(title)[index]),
                  ),
                ),
              ),
            ),
          ],
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
                    builder: (context) => detailScreen(product: item, phone: phone),
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
