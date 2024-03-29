import 'package:example/models/Product.dart';
import 'package:example/models/ProfilePerson.dart';
import 'package:example/pages/Detail/detailScreen.dart';
import 'package:flutter/material.dart';

class myProductsScreen extends StatefulWidget {
  final ProfilePerson person;
  const myProductsScreen({Key? key, required this.person}) : super(key: key);
  @override
  State<myProductsScreen> createState() => _myProductsScreenState();
}

class _myProductsScreenState extends State<myProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              widget.person.store,
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: widget.person.sellProducts.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(widget.person.sellProducts[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 115, 106),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          widget.person.sellProducts.removeAt(index);
                        });
                      },
                      child: ItemBox(context, widget.person.sellProducts[index],
                           widget.person),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row ItemBox(BuildContext context, Product item , ProfilePerson person) {
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
                  builder: (context) => detailScreen(product: item , person: person),
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
