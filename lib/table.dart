// import 'package:flutter/material.dart';

// class TableWidget extends StatelessWidget {
//   TableWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TableRow tableRow = TableRow(
//       children: [
//         Container(
//           padding: EdgeInsets.all(10),
//           child: Text("name of the ITEM.", overflow: TextOverflow.ellipsis),
//         ),
//         Container(
//           padding: EdgeInsets.all(10),
//           child: Text("Item No", overflow: TextOverflow.fade),
//         ),
//         Container(
//           padding: EdgeInsets.all(10),
//           child: Text("HSN/SAC no.", overflow: TextOverflow.ellipsis),
//         ),
//         Container(
//           padding: EdgeInsets.all(10),
//           child: Text("GST%.", overflow: TextOverflow.fade),
//         ),
//         Container(
//           padding: EdgeInsets.all(10),
//           child: Text("Price.", overflow: TextOverflow.fade),
//         ),
//       ],
//     );
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text("Table"),
//           actions: [
            
//             FlatButton(onPressed: (){}, child: Text('Add Item'),
//             color: Colors.cyan[600],)
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: new Table(
//             children: [
//               tableRow,
//               tableRow,
//               tableRow,
//               tableRow,
//               tableRow,
//               tableRow,
//               tableRow,
//               tableRow,
//               tableRow,
//             ],
//             columnWidths: const <int, TableColumnWidth>{
//               0: FlexColumnWidth(0.4),
//               1: FlexColumnWidth(0.2),
//               2: FlexColumnWidth(0.2),
//               3: FlexColumnWidth(0.2),
//               4: FlexColumnWidth(0.3),
//             },
//             border: TableBorder.all(),
//           ),
//         ) // end table,
//         );
//   }
// }



import 'package:flutter/material.dart';  
  
  
class TableExample extends StatefulWidget {  
  @override  
  _TableExample createState() => _TableExample();  
}  
  
class _TableExample extends State<TableExample> {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            title: Text('Item Table'),  
            backgroundColor: Colors.cyan,
          ),  
          body: Center(  
              child: Column(children: [  
                Container(  
                  margin: EdgeInsets.all(20),  
                  child: Table(  
                    defaultColumnWidth: FixedColumnWidth(120.0),  
                    border: TableBorder.all(  
                        color: Colors.black,  
                        style: BorderStyle.solid,  
                        width: 2),  
                    children: [  
                      TableRow( children: [  
                        Column(children:[Text('Item Name', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('GST No', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Price', style: TextStyle(fontSize: 20.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('car')]),  
                        Column(children:[Text('12')]),  
                        Column(children:[Text('611211')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Samsung S10')]),  
                        Column(children:[Text('18')]),  
                        Column(children:[Text('22121')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('bike')]),  
                        Column(children:[Text('5')]),  
                        Column(children:[Text('12220')]),  
                      ]),  
                    ],  
                  ),  
                ),  
              ])  
          )),  
    );  
  }  
}  
