import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DHomePage extends StatefulWidget {
  const DHomePage({Key key}) : super(key: key);

  @override
  _DHomePageState createState() => _DHomePageState();
}

class _DHomePageState extends State<DHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: ScaffoldState(),
      appBar: AppBar(
        title: Text('Add Items to DataBase'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Please Add Your Item ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic),
              ),
              DataBaseItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class DataBaseItem extends StatefulWidget {
  const DataBaseItem({Key key}) : super(key: key);

  @override
  _DataBaseItemState createState() => _DataBaseItemState();
}

class _DataBaseItemState extends State<DataBaseItem> {
  final _dataFormKey = GlobalKey<FormState>();
  final _dataNameController = TextEditingController();
  final _dataNoController = TextEditingController();
  final _dataPriceController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("Foods");



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _dataFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _dataNameController,
                decoration: InputDecoration(
                  labelText: 'Enter the Item Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Item Name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _dataNoController,
                decoration: InputDecoration(
                  labelText: 'Enter the Item No',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Item No';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _dataPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Price',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Price';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_dataFormKey.currentState.validate()) {
                        dbRef.push().set({
                          "name": _dataNameController.text,
                          "no": _dataNoController.text,
                          "price": _dataPriceController.text
                        }).then((value) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Successfully Added')));
                          _dataNameController.clear();
                          _dataNoController.clear();
                          _dataPriceController.clear();
                        }).catchError((onError) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text(onError)));
                        });
                      }
                    },
                    child: Text('Submit'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DHomePage()),
                        );
                      },
                      child: Text('Add Item')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dataNameController.dispose();
    _dataNoController.dispose();
    _dataPriceController.dispose();
  }
}

// class DataBaseItem extends StatefulWidget {
//   const DataBaseItem({Key key}) : super(key: key);

//   @override
//   _DataBaseItemState createState() => _DataBaseItemState();
// }

// class _DataBaseItemState extends State<DataBaseItem> {
//   final _dataForm = GlobalKey<FormState>();
//   final _dataName = TextEditingController();
//   final _dataNo = TextEditingController();
//   final _dataprice = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _dataForm,
//       child: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: ListView(
//           children: [
//             Container(
//               child: Text(
//                 'ITEMS',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Container(
//               child: Text(
//                 'Item Name',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 8.0),
//             TextFormField(
//               controller: _dataName,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(), hintText: 'Item Name'),
//             ),
//             SizedBox(height: 8.0),
//             Container(
//               child: Text(
//                 'Item No',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 8.0),
//             TextFormField(
//               controller: _dataNo,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(), hintText: 'Item No'),
//             ),
//             SizedBox(height: 8.0),
//             Container(
//               child: Text(
//                 'Price',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 8.0),
//             TextFormField(
//               keyboardType: TextInputType.number,
//               controller: _dataprice,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(), hintText: 'Price'),
//             ),
//             SizedBox(height: 8.0),
//             RaisedButton(
//               color: Colors.cyan,
//               child: Text(
//                 'Add to DataBase',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
