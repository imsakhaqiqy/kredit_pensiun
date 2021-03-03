import 'package:flutter/material.dart';

class PekerjaanScreen extends StatefulWidget {
  @override
  _PekerjaanScreenState createState() => new _PekerjaanScreenState();
}

class _PekerjaanScreenState extends State<PekerjaanScreen> {
  final instansi = TextEditingController();
  final gaji = TextEditingController();

  setData() {
    setState(() {
      instansi.text = 'PLN';
      gaji.text = '4.500.000';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 8),
          child: new Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Batal',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Pekerjaan'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Save',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white54),
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 16.0),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
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
                    child: TextField(
                      controller: instansi,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Instansi'),
                    ),
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
                    child: TextField(
                      controller: gaji,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Gaji'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
