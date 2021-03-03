import 'package:flutter/material.dart';
import 'package:kredit_pensiun/account/profile_screen.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => new _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    String foto = 'https://www.nabasa.co.id/avatar.png';
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white54),
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 16.0),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 82,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(foto),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
                                },
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'USERNAME',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat Medium',
                                        color: Colors.blueGrey,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    'expanded',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat Medium',
                                        fontStyle: FontStyle.italic,
                                        color: Colors.blueGrey,
                                        fontSize: 10),
                                  ),
                                ],
                              )
                            ])),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Gold',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Reward',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Business Profile',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Cards',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Help Center',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Settings',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 0.0),
                          onPressed: () {},
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Share Feedback',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
