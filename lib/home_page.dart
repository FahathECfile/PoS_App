import 'package:flutter/material.dart';
import 'package:ifa_ecfile_solution/drawer_option/item_form.dart';

import 'drawer_option/p_form_demo.dart';
import 'drawer_option/purchase_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle drawerStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = [
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
    Text(
      'Logout',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SALES PAGE'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            color: Colors.cyan[300],
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: const Text(
                    'Customer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      //color: Colors.indigo,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.people_outline_rounded),
                  title: const Text(
                    'Supplier',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      //color: Colors.indigo,
                    ),
                  ),
                ),
                SizedBox(),
                Divider(
                  color: Colors.black45,
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: const Text(
                    'Item',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ItemForm()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.inventory),
                  title: const Text(
                    'Purchase Invoice',
                    style: drawerStyle,
                  ),
                  onTap: () {
                     Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => PurchaseFormIn()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.linear_scale_sharp),
                  title: const Text(
                    'Sales',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: const Text(
                    'Stock',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.cyan,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.cyan,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
            backgroundColor: Colors.cyan,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
