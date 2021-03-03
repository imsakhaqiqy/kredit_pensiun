import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/provider/biaya_provider.dart';
import 'package:kredit_pensiun/provider/guna_provider.dart';
import 'package:kredit_pensiun/provider/header_provider.dart';
import 'package:kredit_pensiun/provider/persyaratan_provider.dart';
import 'package:kredit_pensiun/provider/syarat_provider.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class PrapensiunViewScreen extends StatefulWidget {
  String idBank;
  String produk;
  String namaBank;
  String namaProduk;
  String definisi;
  PrapensiunViewScreen(
      this.idBank, this.produk, this.namaBank, this.namaProduk, this.definisi);
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<PrapensiunViewScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Center(
                child: Text(
                  widget.namaBank + ' ' + widget.namaProduk,
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
                    text: 'Info',
                  ),
                  Tab(
                    text: 'Tarif',
                  ),
                  Tab(
                    text: 'Simulasi',
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      header(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Definisi",
                              style: TextStyle(
                                fontFamily: "Montserrat Regular",
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: Text(widget.definisi,
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      height: 1.5,
                                    ),
                                    textAlign: TextAlign.justify))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: false,
                        ),
                        header: Container(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Manfaat',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "Montserrat Regular",
                                  ),
                                ),
                              ),
                              ExpandableIcon(
                                theme: const ExpandableThemeData(
                                  expandIcon: Icons.arrow_right,
                                  collapseIcon: Icons.arrow_drop_down,
                                  iconColor: Colors.black,
                                  iconSize: 28.0,
                                  iconRotationAngle: math.pi / 2,
                                  iconPadding: EdgeInsets.only(right: 5),
                                  hasIcon: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        expanded: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            manfaat(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: false,
                        ),
                        header: Container(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Syarat dan Ketentuan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "Montserrat Regular",
                                  ),
                                ),
                              ),
                              ExpandableIcon(
                                theme: const ExpandableThemeData(
                                  expandIcon: Icons.arrow_right,
                                  collapseIcon: Icons.arrow_drop_down,
                                  iconColor: Colors.black,
                                  iconSize: 28.0,
                                  iconRotationAngle: math.pi / 2,
                                  iconPadding: EdgeInsets.only(right: 5),
                                  hasIcon: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        expanded: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            syaratKetentuan(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: false,
                        ),
                        header: Container(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Persyaratan Dokumen',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "Montserrat Regular",
                                  ),
                                ),
                              ),
                              ExpandableIcon(
                                theme: const ExpandableThemeData(
                                  expandIcon: Icons.arrow_right,
                                  collapseIcon: Icons.arrow_drop_down,
                                  iconColor: Colors.black,
                                  iconSize: 28.0,
                                  iconRotationAngle: math.pi / 2,
                                  iconPadding: EdgeInsets.only(right: 5),
                                  hasIcon: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        expanded: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            persyarataDokumen(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(physics: ClampingScrollPhysics(), children: <Widget>[
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "Biaya",
                            style: TextStyle(
                              fontFamily: "Montserrat Regular",
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Column(
                              children: <Widget>[
                                biaya(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            ListView(physics: ClampingScrollPhysics(), children: <Widget>[
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget header() {
    return FutureBuilder(
      future: Provider.of<HeaderProvider>(context, listen: false)
          .getHeader(HeaderItem(widget.idBank, widget.produk)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          );
        }
        return Consumer<HeaderProvider>(
          builder: (context, data, _) {
            if (data.dataHeader.length == 0) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.hourglass_empty, size: 50),
                    title: Text(
                      'DATA TIDAK DITEMUKAN',
                    ),
                    subtitle: Text(''),
                  ),
                ]),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.dataHeader.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: Image.network(
                        'https://nabasa.co.id/' + data.dataHeader[i].path),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  Widget manfaat() {
    return FutureBuilder(
      future: Provider.of<GunaProvider>(context, listen: false)
          .getGuna(GunaItem(widget.idBank, widget.produk)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          );
        }
        return Consumer<GunaProvider>(
          builder: (context, data, _) {
            if (data.dataGuna.length == 0) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.hourglass_empty, size: 50),
                    title: Text(
                      'DATA TIDAK DITEMUKAN',
                    ),
                    subtitle: Text(''),
                  ),
                ]),
              );
            } else {
              print(data.dataGuna.length);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.dataGuna.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.check,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(data.dataGuna[i].isi,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.blue)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  Widget syaratKetentuan() {
    return FutureBuilder(
      future: Provider.of<SyaratProvider>(context, listen: false)
          .getSyarat(SyaratItem(widget.idBank, widget.produk)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          );
        }
        return Consumer<SyaratProvider>(
          builder: (context, data, _) {
            if (data.dataSyarat.length == 0) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.hourglass_empty, size: 50),
                    title: Text(
                      'DATA TIDAK DITEMUKAN',
                    ),
                    subtitle: Text(''),
                  ),
                ]),
              );
            } else {
              print(data.dataSyarat.length);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.dataSyarat.length,
                itemBuilder: (context, i) {
                  return Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.check,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(data.dataSyarat[i].isi,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.blue)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  Widget persyarataDokumen() {
    return FutureBuilder(
      future: Provider.of<PersyaratanProvider>(context, listen: false)
          .getPersyaratan(PersyaratanItem(widget.idBank, widget.produk)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          );
        }
        return Consumer<PersyaratanProvider>(
          builder: (context, data, _) {
            if (data.dataPersyaratan.length == 0) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.hourglass_empty, size: 50),
                    title: Text(
                      'DATA TIDAK DITEMUKAN',
                    ),
                    subtitle: Text(''),
                  ),
                ]),
              );
            } else {
              print(data.dataPersyaratan.length);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.dataPersyaratan.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.check,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(data.dataPersyaratan[i].isi,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.blue)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  Widget biaya() {
    return FutureBuilder(
      future: Provider.of<BiayaProvider>(context, listen: false)
          .getBiaya(BiayaItem(widget.idBank, widget.produk)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          );
        }
        return Consumer<BiayaProvider>(
          builder: (context, data, _) {
            if (data.dataBiaya.length == 0) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.hourglass_empty, size: 50),
                    title: Text(
                      'DATA TIDAK DITEMUKAN',
                    ),
                    subtitle: Text(''),
                  ),
                ]),
              );
            } else {
              print(data.dataBiaya.length);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.dataBiaya.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: true,
                                  hasIcon: false,
                                ),
                                header: Container(
                                  padding:
                                      EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            data.dataBiaya[i].title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      ExpandableIcon(
                                        theme: const ExpandableThemeData(
                                          expandIcon: Icons.arrow_right,
                                          collapseIcon: Icons.arrow_drop_down,
                                          iconColor: Colors.black,
                                          iconSize: 28.0,
                                          iconRotationAngle: math.pi / 2,
                                          iconPadding:
                                              EdgeInsets.only(right: 3),
                                          hasIcon: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                expanded: Column(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24.0,
                                            top: 16.0,
                                            bottom: 16.0,
                                            right: 24.0),
                                        child: Text(data.dataBiaya[i].isi,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    'Montserrat Regular',
                                                color: Colors.blue)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
