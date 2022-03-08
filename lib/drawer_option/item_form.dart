import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifa_ecfile_solution/table.dart';
import 'package:ifa_ecfile_solution/utils/database.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({Key key}) : super(key: key);

  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _keyForm = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _codeController = TextEditingController();
  
  final _priceController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("Foods");

  String dropdownvalue = '0';

  var items = ['0', '5', '12', '18', '28'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITEMS Page'),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text('VIEW/EDIT'),
            color: Colors.cyan[600],
          ),
        ],
      ),
      body: Center(
        child: Form(
          key: _keyForm,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'ITEMS...',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Item Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Item name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Item Name';
                    }
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Item No',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Item No.'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Item No';
                    }
                  },
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'HSN/SAC',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 135.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'GST %',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _codeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'HSN/SAC'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the HSN/SAC code';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Flexible(
                      child: DropdownButtonFormField(
                          value: dropdownvalue,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          }),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Price'),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(12),
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text(
                      'save',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    onPressed: () async{
                      if (_keyForm.currentState.validate()) {
                        await Database.addItem(
                          name: _nameController.text,
                          no: int.parse(_numberController.text),
                          code: _codeController.text,
                          gst: int.parse(dropdownvalue),
                          price: int.parse(_priceController.text),
                        );
                       Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
