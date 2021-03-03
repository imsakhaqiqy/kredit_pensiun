import 'package:flutter/material.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/login/informasi_tambahan.dart';

class GabungMemberScreen extends StatefulWidget {
  String phoneNumber;

  GabungMemberScreen(this.phoneNumber);

  @override
  _GabungMemberState createState() => new _GabungMemberState();
}

class _GabungMemberState extends State<GabungMemberScreen> {
  final formKey = GlobalKey<FormState>();
  String namaLengkap;
  String password;
  //Getting value from TextField widget.
  final namaLengkapController = TextEditingController();
  final passwordController = TextEditingController();

  getDataInputan() {
    //Getting value from controller.
    namaLengkap = namaLengkapController.text;
    password = passwordController.text;
  }

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
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
          'Gabung Jadi Member',
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
                    namaField(),
                    SizedBox(
                      height: 16,
                    ),
                    passwordField(),
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

  Widget namaField() {
    return TextFormField(
      controller: namaLengkapController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Nama sesuai KTP/Paspor (tanpa gelar) wajib diisi...';
        }
        return null;
      },
      decoration: InputDecoration(
        //Add th Hint text here.
        hintText: "Nama sesuai KTP/Paspor (tanpa gelar)",
        hintStyle: TextStyle(
          fontFamily: 'Montserrat Regular',
        ),
        labelText: "Nama sesuai KTP/Paspor (tanpa gelar)",
        labelStyle: TextStyle(
          fontFamily: 'Montserrat Regular',
        ),
      ),
      textCapitalization: TextCapitalization.characters,
      style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: _isHidden,
      controller: passwordController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Password wajib diisi...';
        }
        return null;
      },
      decoration: InputDecoration(
          //Add th Hint text here.
          hintText: "Password",
          hintStyle: TextStyle(fontFamily: 'Montserrat Regular'),
          labelText: "Password",
          suffixIcon: IconButton(
            onPressed: () {
              _toggleVisibility();
            },
            icon: Icon(Icons.visibility_off),
          ),
          labelStyle: TextStyle(
            fontFamily: 'Montserrat Regular',
          )),
      textCapitalization: TextCapitalization.characters,
      style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
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
            getDataInputan();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InformasiTambahanScreen(
                  namaLengkap,
                  password,
                  widget.phoneNumber,
                ),
              ),
            );
          }
        },
        child: Text(
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
