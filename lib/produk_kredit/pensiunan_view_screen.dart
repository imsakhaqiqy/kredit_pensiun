import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/produk_simulasi/simulasi_pensiunan.dart';
import 'package:kredit_pensiun/provider/biaya_provider.dart';
import 'package:kredit_pensiun/provider/guna_provider.dart';
import 'package:kredit_pensiun/provider/header_provider.dart';
import 'package:kredit_pensiun/provider/persyaratan_provider.dart';
import 'package:kredit_pensiun/provider/syarat_provider.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class PensiunanViewScreen extends StatefulWidget {
  String idBank;
  String produk;
  String namaBank;
  String namaProduk;
  String definisi;
  String namaLengkap;
  String gajiPerbulan;
  String tanggalLahir;
  String bankGaji;

  PensiunanViewScreen(
    this.idBank,
    this.produk,
    this.namaBank,
    this.namaProduk,
    this.definisi,
    this.namaLengkap,
    this.gajiPerbulan,
    this.tanggalLahir,
    this.bankGaji,
  );
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<PensiunanViewScreen> {
  double rating = 30000000;
  int jw = 0;
  String asuransi = '';
  String bni = '';
  String tib = '';
  String grm = '';
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String namaPensiun;
  String gajiPensiun;
  String tanggalLahir;
  String plafondPinjaman;
  String takeoverBankLain;
  String bankAmbilGaji;
  var selectedJangkaWaktuType;
  List<String> _jangkaWaktu = <String>[
    '12',
    '24',
    '36',
    '48',
    '60',
    '72',
    '84',
    '96',
    '108',
    '120',
    '132',
    '144',
    '156',
    '168',
    '180'
  ];
  var selectedAsuransiType;
  List<String> _asuransiType = <String>['TIB', 'GRM', 'BNI LIFE'];
  //Getting value from TextField widget.
  final namaPensiunController = TextEditingController();
  final gajiPensiunController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final plafondPinjamanController = TextEditingController();
  final takeoverBankLainController = TextEditingController();
  final bankAmbilGajiController = TextEditingController();

  getDataInputan() {
    //Getting value from controller.
    namaPensiun = namaPensiunController.text;
    gajiPensiun = gajiPensiunController.text;
    tanggalLahir = tanggalLahirController.text;
    plafondPinjaman = plafondPinjamanController.text;
    takeoverBankLain = takeoverBankLainController.text;
    bankAmbilGaji = bankAmbilGajiController.text;
  }

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
                labelColor: Colors.blue,
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
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text('NILAI PINJAMAN'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Center(
                              child: Text(
                                formatRupiah(rating.toString()),
                                style: TextStyle(fontSize: 30.0),
                              ),
                            )),
                        sliderGapok(),
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('30.000.000',
                                  style: TextStyle(fontSize: 12.0)),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text('500.000.000',
                                  style: TextStyle(fontSize: 12.0)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            'TENOR (TAHUN)',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        sliderJangkaWaktu(),
                        Container(
                          width: double.infinity,
                          child: Text(
                            'ASURANSI',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        sliderAsuransi(),
                        SizedBox(
                          height: 10,
                        ),
                        hitung(),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  )),
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

  Widget sliderGapok() {
    return Slider(
      value: rating,
      min: 30000000,
      max: 500000000,
      onChanged: (double value) {
        setState(() {
          rating = value;
        });
      },
      divisions: 470,
      label: formatRupiah(rating.round().toString()),
    );
  }

  Widget sliderJangkaWaktu() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 6,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          int bulan = 10 + index;
          return InkWell(
            onTap: () {
              setState(() {
                jw = bulan;
              });
              print(jw);
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: 60,
              height: 60,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      '$bulan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (jw > 0 && bulan == jw)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (jw > 0 && bulan == jw)
                      ? Colors.blue
                      : Color(0xFFe0f2f1)),
            ),
          );
        },
      ),
    );
  }

  Widget sliderAsuransi() {
    return Container(
      color: Color(0xFFe0f2f1),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                bni = 'BNI LIFE';
                asuransi = bni;
                tib = '';
                grm = '';
              });
            },
            child: Container(
              color: bni != '' ? Colors.blue : Color(0xFFe0f2f1),
              width: MediaQuery.of(context).size.width * 0.30,
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'BNI LIFE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: bni != '' ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                tib = 'TIB';
                asuransi = tib;
                bni = '';
                grm = '';
              });
            },
            child: Container(
              color: tib != '' ? Colors.blue : Color(0xFFe0f2f1),
              width: MediaQuery.of(context).size.width * 0.30,
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'TIB',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: tib != '' ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                grm = 'GRM';
                asuransi = grm;
                bni = '';
                tib = '';
              });
            },
            child: Container(
              color: grm != '' ? Colors.blue : Color(0xFFe0f2f1),
              width: MediaQuery.of(context).size.width * 0.32,
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'GRM',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: grm != '' ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget namaCalonDebitur() {
    return TextFormField(
      controller: namaPensiunController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Nama lengkap wajib diisi...';
        }
        return null;
      },
      decoration: InputDecoration(
        //Add th Hint text here.
        hintText: "Nama Lengkap",
        hintStyle: TextStyle(
          fontFamily: 'Montserrat Regular',
        ),
        labelText: "Nama Lengkap",
        labelStyle: TextStyle(
          fontFamily: 'Montserrat Regular',
        ),
      ),
      textCapitalization: TextCapitalization.characters,
      style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
    );
  }

  Widget gajiCalonDebitur() {
    return TextFormField(
      controller: gajiPensiunController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Gaji pensiun wajib diisi...';
        }
        return null;
      },
      decoration: InputDecoration(
          //Add th Hint text here.
          hintText: "Gaji Pensiun",
          hintStyle: TextStyle(fontFamily: 'Montserrat Regular'),
          labelText: "Gaji Pensiun",
          labelStyle: TextStyle(
            fontFamily: 'Montserrat Regular',
          )),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
    );
  }

  Widget tanggalLahirCalonDebitur() {
    final format = DateFormat("yyyy-MM-dd");
    return Column(children: <Widget>[
      DateTimeField(
        controller: tanggalLahirController,
        validator: (DateTime dateTime) {
          if (dateTime == null) {
            return 'Tanggal lahir wajib diisi...';
          }
          return null;
        },
        decoration: InputDecoration(
            //Add th Hint text here.
            hintText: "Tanggal Lahir",
            hintStyle: TextStyle(fontFamily: 'Montserrat Regular'),
            labelText: "Tanggal Lahir",
            labelStyle: TextStyle(
              fontFamily: 'Montserrat Regular',
            )),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
        style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
      ),
    ]);
  }

  Widget plafondCalonDebitur() {
    return TextFormField(
      controller: plafondPinjamanController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Plafond wajib diisi...';
        }
        return null;
      },
      decoration: InputDecoration(
          //Add th Hint text here.
          hintText: "Plafond",
          hintStyle: TextStyle(fontFamily: 'Montserrat Regular'),
          labelText: "Plafond",
          labelStyle: TextStyle(
            fontFamily: 'Montserrat Regular',
          )),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
    );
  }

  Widget pelunasanCalonDebitur() {
    return TextFormField(
      controller: takeoverBankLainController,
      decoration: InputDecoration(
          //Add th Hint text here.
          hintText: "Hutang Bank Lain",
          hintStyle: TextStyle(fontFamily: 'Montserrat Regular'),
          labelText: "Hutang Bank Lain",
          labelStyle: TextStyle(
            fontFamily: 'Montserrat Regular',
          )),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
    );
  }

  Widget bankGajiCalonDebitur() {
    return TextFormField(
      controller: bankAmbilGajiController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Bank ambil gaji wajib diisi...';
        }
        return null;
      },
      decoration: InputDecoration(
          //Add th Hint text here.
          hintText: "Bank Ambil Gaji",
          hintStyle: TextStyle(fontFamily: 'Montserrat Regular'),
          labelText: "Bank Ambil Gaji",
          labelStyle: TextStyle(
            fontFamily: 'Montserrat Regular',
          )),
      textCapitalization: TextCapitalization.characters,
      style: TextStyle(fontSize: 12, fontFamily: 'Montserrat Regular'),
    );
  }

  Widget jangkaWaktuCalonDebitur() {
    return DropdownButtonFormField(
      items: _jangkaWaktu
          .map((value) => DropdownMenuItem(
                child: Text(
                  value,
                  style:
                      TextStyle(fontFamily: 'Montserrat Regular', fontSize: 12),
                ),
                value: value,
              ))
          .toList(),
      onChanged: (selectedJangkaWaktu) {
        setState(() {
          selectedJangkaWaktuType = selectedJangkaWaktu;
        });
      },
      decoration: InputDecoration(
          labelText: 'Jangka Waktu',
          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          labelStyle:
              TextStyle(fontFamily: 'Montserrat Regular', fontSize: 12)),
      value: selectedJangkaWaktuType,
      isExpanded: true,
    );
  }

  Widget asuransiCalonDebitur() {
    return DropdownButtonFormField(
      items: _asuransiType
          .map((value) => DropdownMenuItem(
                child: Text(
                  value,
                  style:
                      TextStyle(fontFamily: 'Montserrat Regular', fontSize: 12),
                ),
                value: value,
              ))
          .toList(),
      onChanged: (selectedAsuransi) {
        setState(() {
          selectedAsuransiType = selectedAsuransi;
        });
      },
      decoration: InputDecoration(
          labelText: 'Asuransi',
          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          labelStyle:
              TextStyle(fontFamily: 'Montserrat Regular', fontSize: 12)),
      value: selectedAsuransiType,
      isExpanded: true,
    );
  }

  Widget hitung() {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        color: Colors.blue, //MENGATUR WARNA TOMBOL
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SimulationPensiunanResult(
                      'IMSAK HAQIQY',
                      '3500000',
                      '1960-01-24',
                      'Pensiun',
                      'Kredit Baru',
                      'BNI BEKASI',
                      rating.toString(),
                      (jw * 12).toString(),
                      asuransi,
                      '0',
                      '0',
                      '0'))).then((result) {});
        },
        child: Text(
          'Simulasi',
          style:
              TextStyle(color: Colors.white, fontFamily: 'Montserrat Regular'),
        ),
      ),
    );
  }

  formatRupiah(String a) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: double.parse(a),
        settings: MoneyFormatterSettings(
          symbol: 'IDR',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 3,
        ));
    return 'IDR ' + fmf.output.withoutFractionDigits;
  }
}
