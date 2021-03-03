import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kredit_pensiun/constans.dart';

class MessagePage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Center(
                child: Text(
                  'Messages',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat Regular',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              actions: <Widget>[],
              bottom: TabBar(
                labelColor: KreditPensiunPalette.green,
                unselectedLabelColor: Colors.black87,
                tabs: <Widget>[
                  Tab(
                    text: 'Chats',
                  ),
                  Tab(
                    text: 'Notifications',
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  SizedBox(height: 100.0),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: SvgPicture.asset('assets/chats.svg'),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "You'll find all your chats here",
                            style: TextStyle(
                                color: Colors.grey,
                                letterSpacing: 1.2,
                                fontSize: 16.0,
                                height: 2.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  SizedBox(height: 100.0),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: SvgPicture.asset('assets/notify.svg'),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "You'll find all your notifications here",
                            style: TextStyle(
                                color: Colors.grey,
                                letterSpacing: 1.2,
                                fontSize: 16.0,
                                height: 2.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
