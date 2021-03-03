import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:http/http.dart' as http;
import 'package:kredit_pensiun/landing/landing_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformasiTambahanScreen extends StatefulWidget {
  String namaLengkap;
  String password;
  String phoneNumber;

  InformasiTambahanScreen(this.namaLengkap, this.password, this.phoneNumber);
  @override
  _InformasiTambahanState createState() => new _InformasiTambahanState();
}

class _InformasiTambahanState extends State<InformasiTambahanScreen> {
  final formKey = GlobalKey<FormState>();
  String fotoProfil;
  String tanggalLahir;
  String jenisKelamin;
  String foto = 'https://www.nabasa.co.id/avatar.png';
  int _jenisKelamin = -1;
  final List<RadioGroup> _jenisKelaminList = [
    RadioGroup(index: 1, text: "Pria"),
    RadioGroup(index: 2, text: "Wanita")
  ];
  bool visible = false;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt("counter", counter).then((bool success) {
        return counter;
      });
    });
  }

  //Getting value from TextField widget.
  final tanggalLahirController = TextEditingController();

  Future savePlanning() async {
    //showing CircularProgressIndicator
    setState(() {
      visible = true;
    });

    //getting value from controller
    tanggalLahir = tanggalLahirController.text;

    //server save api
    var url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/addAccountManual';

    //starting web api call
    var response = await http.post(url, body: {
      'telepon': widget.phoneNumber,
      'nama_lengkap': widget.namaLengkap,
      'password': widget.password,
      'foto': '',
      'tanggal_lahir': tanggalLahir,
      'jenis_kelamin': jenisKelamin,
    });

    if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['Save_Account_Manual'];
      if (message['message'].toString() == 'Save Success') {
        setState(() {
          visible = false;
          _incrementCounter();
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LandingPage()));
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Selamat datang di kredit pensiun'),
            //content: Text('We hate to see you leave...'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        setState(() {
          visible = false;
        });
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Gagal membuat account'),
            //content: Text('We hate to see you leave...'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: KreditPensiunPalette.green,
        elevation: 0,
        title: Text(
          'Informasi tambahan',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[],
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    fotoProfilField(),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text('Tanggal Lahir'),
                    ),
                    tanggalLahirField(),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text('Jenis Kelamin'),
                    ),
                    jenisKelaminField(),
                    SizedBox(
                      height: 16,
                    ),
                    hitung(),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget fotoProfilField() {
    return Container(
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
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                    child: InkWell(
                                      onTap: () {},
                                      child: ListTile(
                                        title: Center(
                                          child: Text(
                                            'Gallery',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                    child: InkWell(
                                      onTap: () {},
                                      child: ListTile(
                                        title: Center(
                                          child: Text(
                                            'Camera',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
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
                          'Ganti Foto Profil',
                          style: TextStyle(
                              fontFamily: 'Montserrat Medium', fontSize: 14),
                        ),
                      ],
                    )
                  ])),
        ],
      ),
    );
  }

  Widget tanggalLahirField() {
    final format = DateFormat("yyyy-MM-dd");
    return Column(children: <Widget>[
      DateTimeField(
          controller: tanggalLahirController,
          validator: (DateTime dateTime) {
            if (dateTime == null) {
              return 'Tanggal Lahir wajib diisi...';
            }
            return null;
          },
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
          style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular')),
    ]);
  }

  Widget jenisKelaminField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _jenisKelaminList
          .map((jenisKelaminx) => Row(
                children: <Widget>[
                  Radio(
                    value: jenisKelaminx.index,
                    groupValue: _jenisKelamin,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      setState(() {
                        _jenisKelamin = value;
                        jenisKelamin = jenisKelaminx.text;
                      });
                    },
                  ),
                  Text(jenisKelaminx.text),
                ],
              ))
          .toList(),
    );
  }

  Widget hitung() {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        padding: EdgeInsets.all(8),
        color: Colors.blue, //MENGATUR WARNA TOMBOL
        onPressed: () {
          if (formKey.currentState.validate()) {
            //print(widget.phoneNumber);
            savePlanning();
          }
        },
        child: visible
            ? SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                height: 20.0,
                width: 20.0,
              )
            : Text(
                'Selesai',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
      ),
    );
  }
}

class RadioGroup {
  final int index;
  final String text;
  RadioGroup({this.index, this.text});
}
