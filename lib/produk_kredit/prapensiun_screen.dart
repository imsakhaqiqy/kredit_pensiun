import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/produk_kredit/prapensiun_view_screen.dart';
import 'package:kredit_pensiun/provider/pegawai_aktif_provider.dart';
import 'package:kredit_pensiun/provider/prapensiun_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PrapensiunScreen extends StatefulWidget {
  String namaProduk;
  PrapensiunScreen(this.namaProduk);
  @override
  _PrapensiunScreenState createState() => _PrapensiunScreenState();
}

class _PrapensiunScreenState extends State<PrapensiunScreen> {
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
                Provider.of<PrapensiunProvider>(context, listen: false)
                    .getPrapensiun(),
            color: Colors.red,
            child: Container(
              margin: EdgeInsets.all(10),
              child: FutureBuilder(
                future: Provider.of<PrapensiunProvider>(context, listen: false)
                    .getPrapensiun(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue)),
                    );
                  }
                  return Consumer<PrapensiunProvider>(
                    builder: (context, data, _) {
                      if (data.dataPrapensiun.length == 0) {
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
                          itemCount: data.dataPrapensiun.length,
                          itemBuilder: (context, i) {
                            String path = data.dataPrapensiun[i].path;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PrapensiunViewScreen(
                                                data.dataPrapensiun[i].id,
                                                data.dataPrapensiun[i].produk,
                                                data.dataPrapensiun[i].namaBank,
                                                data.dataPrapensiun[i].nama,
                                                data.dataPrapensiun[i]
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
                                      // colorFilter: new ColorFilter.mode(
                                      //     Colors.black.withOpacity(0.5),
                                      //     BlendMode.dstATop),
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
