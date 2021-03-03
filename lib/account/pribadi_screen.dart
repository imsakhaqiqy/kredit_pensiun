import 'package:flutter/material.dart';

class PribadiScreen extends StatefulWidget {
  @override
  _PribadiScreenState createState() => new _PribadiScreenState();
}

class _PribadiScreenState extends State<PribadiScreen> {
  final namaLengkap = TextEditingController();
  final telepon = TextEditingController();
  final tanggalLahir = TextEditingController();
  final jenisKelamin = TextEditingController();
  final kota = TextEditingController();
  final propinsi = TextEditingController();
  final negara = TextEditingController();

  setData() {
    setState(() {
      namaLengkap.text = 'Sanusi';
      telepon.text = '081283570918';
      tanggalLahir.text = '17 Nov 1960';
      jenisKelamin.text = 'Pria';
      kota.text = 'Jakarta Timur';
      propinsi.text = 'DKI Jakarta';
      negara.text = 'Indonesia';
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
        title: Text('Pribadi'),
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
                      controller: namaLengkap,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Nama Lengkap'),
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
                      controller: telepon,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Telepon'),
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
                      controller: tanggalLahir,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Tanggal Lahir'),
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
                      controller: jenisKelamin,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Jenis Kelamin'),
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
                      controller: kota,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Kota'),
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
                      controller: propinsi,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Provinsi'),
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
                      controller: negara,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Negara'),
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
