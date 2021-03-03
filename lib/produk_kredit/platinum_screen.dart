import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/produk_kredit/platinum_view_screen.dart';
import 'package:kredit_pensiun/provider/platinum_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PlatinumScreen extends StatefulWidget {
  String namaProduk;
  PlatinumScreen(this.namaProduk);
  @override
  _PlatinumScreenState createState() => _PlatinumScreenState();
}

class _PlatinumScreenState extends State<PlatinumScreen> {
  @override
  Widget build(BuildContext context) {
    var cardTextStyle1 = TextStyle(
        fontFamily: "Montserrat Regular", fontSize: 14, color: Colors.grey);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            widget.namaProduk,
            style: TextStyle(
              fontFamily: 'Montserrat Regular',
              color: Colors.black,
            ),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () =>
                Provider.of<PlatinumProvider>(context, listen: false)
                    .getPlatinum(),
            color: Colors.red,
            child: Container(
              margin: EdgeInsets.all(10),
              child: FutureBuilder(
                future: Provider.of<PlatinumProvider>(context, listen: false)
                    .getPlatinum(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue)),
                    );
                  }
                  return Consumer<PlatinumProvider>(
                    builder: (context, data, _) {
                      if (data.dataPlatinum.length == 0) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading:
                                      Icon(Icons.hourglass_empty, size: 50),
                                  title: Text(
                                    'DATA TIDAK DITEMUKAN',
                                    style: cardTextStyle1,
                                  ),
                                  subtitle: Text(''),
                                ),
                              ]),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: data.dataPlatinum.length,
                          itemBuilder: (context, i) {
                            String path = data.dataPlatinum[i].path;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlatinumViewScreen(
                                                data.dataPlatinum[i].id,
                                                data.dataPlatinum[i].produk,
                                                data.dataPlatinum[i].namaBank,
                                                data.dataPlatinum[i].nama,
                                                data.dataPlatinum[i]
                                                    .definisi)));
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    //color: const Color(0xff7c94b6),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://nabasa.co.id/" + path),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  child: null,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            )));
  }

  messageStatus(String status) {
    if (status == '0') {
      return 'Belum Dibayar';
    } else {
      return 'Sudah Dibayar';
    }
  }

  iconStatus(String status) {
    if (status == '0') {
      return Icon(
        Icons.info,
        size: 30,
      );
    } else {
      return Icon(
        Icons.check,
        size: 30,
      );
    }
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
