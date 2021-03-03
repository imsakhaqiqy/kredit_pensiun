import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:kredit_pensiun/landing/landing_view.dart';
import 'package:kredit_pensiun/items.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  var value;
  var key;
  var _loginStatus;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    value = preferences.getInt("counter");
    print(value);
    value != null
        ? Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LandingPage()))
        : startLaunching();
  }

  removePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(preferences.getKeys());
    // for (String key in preferences.getKeys()) {
    //   if (key != "email" && key != "password") {
    //     preferences.remove(key);
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new WelcomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset("assets/logo.png", height: 100.0, width: 200.0),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map((item) => Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: SvgPicture.asset(item['image'])),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFF3F3D56),
                              height: 2.0)),
                      Text(
                        item['description'],
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color(0XFF256075)
                    : Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
  int indexnya = 0;
  final _pageViewController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page;
                  });
                });
                return slides[index];
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(top: 70.0),
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: (currentPage == 4.0)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 300.0,
                                child: FlatButton(
                                    padding: EdgeInsets.all(16.0),
                                    color: KreditPensiunPalette.green,
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             LandingPage()));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text(
                                      'MULAI',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat Regular',
                                          color: Colors.white,
                                          fontSize: 20.0),
                                    )),
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: indicator())))
          ],
        ),
      ),
    );
  }
}
