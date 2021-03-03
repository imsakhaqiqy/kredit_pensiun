import 'package:flutter/material.dart';
import 'package:kredit_pensiun/account/pekerjaan_screen.dart';
import 'package:kredit_pensiun/account/pribadi_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String foto = 'https://www.nabasa.co.id/avatar.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Me'),
      ),
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
                                ProfileScreen();
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
                                      child: InkWell(
                                        child: Text(
                                          'Pribadi',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PribadiScreen()));
                                        },
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
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black12,
              ))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Nama Lengkap',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Sanusi',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black12,
              ))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Telepon',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '081283570918',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black12,
              ))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Tanggal Lahir',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '17 Nov 1960',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black12,
              ))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Jenis Kelamin',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Pria',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black12,
              ))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Alamat',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Indonesia, DKI Jakarta, Jakarta Timur',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
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
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PekerjaanScreen()));
                                        },
                                        child: Text(
                                          'Pekerjaan',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
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
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black12,
              ))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Instansi',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'PLN',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black12,
              ))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Gaji perbulan',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                '4.500.000',
                                style: TextStyle(
                                    fontFamily: 'Montserrat Regular',
                                    color: Colors.black,
                                    fontSize: 12.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
