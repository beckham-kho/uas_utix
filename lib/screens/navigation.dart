import 'package:flutter/material.dart';
import 'package:uas_utix/screens/fnb_screen.dart';
import 'package:uas_utix/screens/history_screen.dart';
import 'package:uas_utix/screens/home_screen.dart';

class Navigation extends StatefulWidget {
  final int index;
  const Navigation(this.index, {super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  dynamic _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    //tambahin beberapa screen kalo udah jadi
    HomeScreen(),
    FnbScreen(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        selectedItemColor: const Color.fromRGBO(247, 67, 70, 1),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Food n Beverage',
            icon: Icon(Icons.fastfood_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Ticket',
            icon: Icon(Icons.confirmation_number),
          )
        ],
      ),
    );
  }
}