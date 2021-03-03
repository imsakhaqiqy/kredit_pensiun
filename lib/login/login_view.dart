import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kredit_pensiun/login/numeric_pad.dart';
import 'package:kredit_pensiun/login/verify_phone.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = "";
  bool _loadingOtp = false;
  String kodeOtp = '';

  Future requestOtp() async {
    setState(() {
      _loadingOtp = true;
    });
    //server login api
    var url = 'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/sendOtp';
    //starting web api call
    var response = await http.post(url, body: {
      'telepon': phoneNumber,
    });
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['Save_Otp'];
      print(message);
      if (message['message'].toString() == 'Otp Success') {
        setState(() {
          _loadingOtp = false;
          kodeOtp = message['kode_otp'];
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyPhone(phoneNumber, kodeOtp),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
          title: Text(
            'Continue with phone',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 0.9],
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF7F7F7),
                  ],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 130,
                      child: Image.asset('assets/images/holding-phone.png'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 64),
                      child: Text(
                        "You'all receive a 4 digit code to verify next.",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF818181)),
                      ),
                    )
                  ],
                ),
              )),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Enter your phone',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              phoneNumber,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (phoneNumber == '' || phoneNumber == null) {
                              Toast.show(
                                "Nomor telepon tidak boleh kosong",
                                context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM,
                                backgroundColor: Colors.red,
                              );
                            } else if (phoneNumber.length < 10) {
                              Toast.show(
                                "Nomor telepon minimal 10 digit",
                                context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM,
                                backgroundColor: Colors.red,
                              );
                            } else {
                              requestOtp();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFDC3D),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: _loadingOtp
                                  ? SizedBox(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                      height: 20.0,
                                      width: 20.0,
                                    )
                                  : Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              NumericPad(onNumberSelected: (value) {
                setState(() {
                  if (value != -1) {
                    phoneNumber = phoneNumber + value.toString();
                  } else {
                    phoneNumber =
                        phoneNumber.substring(0, phoneNumber.length - 1);
                  }
                });
              })
            ],
          ),
        ));
  }
}
