import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key key}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  final _keyAddForm = GlobalKey<FormState>();
  final _keyEditForm = GlobalKey<FormState>();
  final itemnoAController = TextEditingController();
  final itemnameAController = TextEditingController();
  final priceAController = TextEditingController();
  final qtyAController = TextEditingController();
  final itemnoEController = TextEditingController();
  final itemnameEController = TextEditingController();
  final priceEController = TextEditingController();
  final qtyEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 350.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        tabs: [
                          Row(
                            children: [
                              Tab(
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Add Item',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Tab(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Edit Item',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Form(
                              key: _keyAddForm,
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30.0),
                                    child: Text(
                                      'Add Item',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: TextFormField(
                                          controller: itemnoAController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Item No',
                                              labelText: 'Item No'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the Item No';
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Flexible(
                                        child: TextFormField(
                                          controller: itemnameAController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Item Name',
                                              labelText: 'Item Name'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the Item Name';
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: TextFormField(
                                          controller: qtyAController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Quantity',
                                              labelText: 'Quantity'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the min Quantity';
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Flexible(
                                        child: TextFormField(
                                          controller: priceAController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Price',
                                              labelText: 'Price'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the Item Price';
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RaisedButton(
                                    color: Colors.cyan,
                                    child: Text(
                                      'ADD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      final grocerys = GroceryList(
                                        itemNo:
                                            int.parse(itemnoAController.text),
                                        itemName: itemnameAController.text,
                                        price: int.parse(priceAController.text),
                                      );
                                      createItem(grocerys);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Form(
                              key: _keyEditForm,
                              child: ListView(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30.0),
                                        child: Text(
                                          'Edit Item',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 195.0,
                                      ),
                                      RaisedButton(
                                        color: Colors.red[400],
                                        child: Text('Delete'),
                                        onPressed: () {
                                          final docItem = FirebaseFirestore.instance.collection('grocery').doc('54ZVKAU0iljt1jrdkQb2');
                                                 
                                                 docItem.delete();
                                        },
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: TextFormField(
                                          controller: itemnoEController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Item No',
                                              labelText: 'Item No'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the Item No';
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Flexible(
                                        child: TextFormField(
                                          controller: itemnameEController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Item Name',
                                              labelText: 'Item Name'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the Item Name';
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: TextFormField(
                                          controller: qtyEController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Quantity',
                                              labelText: 'Quantity'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the min Quantity';
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Flexible(
                                        child: TextFormField(
                                          controller: priceEController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Price',
                                              labelText: 'Price'),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the Item Price';
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RaisedButton(
                                    color: Colors.cyan,
                                    child: Text(
                                      'Re-ADD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Future createItem(GroceryList grocerys) async {
    final docItem =
        FirebaseFirestore.instance.collection('grocery').doc('id-112');
    grocerys.id = docItem.id;

    final json = grocerys.tojson();
    await docItem.set(json);
  }
}

class GroceryList {
  String id;
  final int itemNo;
  final String itemName;
  final int price;

  GroceryList({
    this.id = '',
    this.itemNo,
    this.itemName,
    this.price,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'item no': itemNo,
        'item name': itemName,
        'price': price,
      };
}
