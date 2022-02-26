import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../table.dart';

class PurchaseForm extends StatefulWidget {
  const PurchaseForm({Key key}) : super(key: key);

  @override
  _PurchaseFormState createState() => _PurchaseFormState();
}

class _PurchaseFormState extends State<PurchaseForm> {
  final _keyForm = GlobalKey<FormState>();
  final _suplier = TextEditingController();
  final _purchaseInvoice = TextEditingController();
  final _purchaseDate = TextEditingController();
  final _pName = TextEditingController();
  final _code = TextEditingController();
  final _price = TextEditingController();
  final _qty = TextEditingController();
  final _pDate = TextEditingController();
  DateFormat _dateFormat = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PURCHASE Page'),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TableExample()));
              });
            },
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
                    'PURCHASE...',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Supplier',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _suplier,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Supplier'),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Purchase Invoice',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Purchase Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _purchaseInvoice,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Purchase Invoice'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Purchase Invoice';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    Flexible(
                      child: DateTimeField(
                        validator: (value) {
                          if ((value == null)) {
                            return 'Please enter date';
                          }
                        },
                        format: _dateFormat,
                        onShowPicker: (context, currentValue) async {
                          final firstDate =
                              DateTime.now().add(Duration(days: -365 * 5));
                          final lastDate = DateTime.now();
                          final time = showDatePicker(
                            context: context,
                            initialDate: currentValue ?? DateTime.now(),
                            firstDate: firstDate,
                            lastDate: lastDate,
                          );
                          return time;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Select the Date',
                            
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Item Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 140.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Item No',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _pName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Item Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Item name';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _code,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Item No'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Item No';
                          }
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 174.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Quantity',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _price,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Price'),
                      ),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _qty,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Quantity'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Quantity';
                          }
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text(
                      'save',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    onPressed: () {
                      if (_keyForm.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Data is in processing'),
                          ),
                        );
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
