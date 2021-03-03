import 'package:flutter/material.dart';
import 'package:kredit_pensiun/activity/activity_view.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/beranda/beranda_view.dart';
import 'package:kredit_pensiun/message/message_view.dart';
import 'package:kredit_pensiun/account/account_view.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new BerandaPage(),
    new ActivityPage(),
    new MessagePage(),
    new AccountsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _bottomNavCurrentIndex = index;
        });
      },
      currentIndex: _bottomNavCurrentIndex,
      items: [
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.home,
            color: KreditPensiunPalette.green,
          ),
          icon: new Icon(
            Icons.home,
            color: Colors.grey,
          ),
          title: new Text(
            'Beranda',
            style: TextStyle(fontFamily: 'Montserrat Regular'),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.assignment,
            color: KreditPensiunPalette.green,
          ),
          icon: new Icon(
            Icons.assignment,
            color: Colors.grey,
          ),
          title: new Text(
            'Aplikasi',
            style: TextStyle(fontFamily: 'Montserrat Regular'),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.mail,
            color: KreditPensiunPalette.green,
          ),
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          ),
          title: new Text(
            'Pesan',
            style: TextStyle(fontFamily: 'Montserrat Regular'),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.person,
            color: KreditPensiunPalette.green,
          ),
          icon: new Icon(
            Icons.person,
            color: Colors.grey,
          ),
          title: new Text(
            'Akun',
            style: TextStyle(fontFamily: 'Montserrat Regular'),
          ),
        ),
      ],
    );
  }
}
