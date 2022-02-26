import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:ifa_ecfile_solution/bottom_sheet.dart';
import 'package:ifa_ecfile_solution/drawer_option/item_form.dart';
import 'package:ifa_ecfile_solution/table.dart';
// import 'dart:html';


import 'home_page.dart';

// void main() {
//   runApp(const MyApp());
// }
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      // home: ReadData(),
      // home: TableExample(),
      home: SalesPage(),
    );
  }
}


class SalesPage extends StatefulWidget {
  SalesPage({Key key}) : super(key: key);

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<Map> _formin = [
    {'no': 120, 'name': 'Flutter', 'qty': 1, 'price': 120},
    {'no': 121, 'name': 'git', 'qty': 2, 'price': 10},
    {'no': 122, 'name': 'Firebase', 'qty': 1, 'price': 180}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    'To',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Enter Name'),
                  ),
                ),
              ],
            ),
          ),
          // _createDataTable(),
          _createTable(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => BottomTabs());
          },
          tooltip: 'Add Item',
          label: const Text('Add/Edit Item'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.cyan),
    );
  }

  DataTable _createTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(
        'Item No',
        overflow: TextOverflow.ellipsis,
      )),
      DataColumn(
          label: Text(
        ' Name',
        overflow: TextOverflow.ellipsis,
      )),
      DataColumn(label: Text('Quantity')),
      DataColumn(label: Text('Price')),
    ];
  }

  List<DataRow> _createRows() {
    return _formin
        .map((e) => DataRow(cells: [
              DataCell(Text('#' + e['no'].toString())),
              DataCell(Text(e['name'])),
              DataCell(Text(e['qty'].toString())),
              DataCell(Text(e['price'].toString())),
            ]))
        .toList();
  }
}
