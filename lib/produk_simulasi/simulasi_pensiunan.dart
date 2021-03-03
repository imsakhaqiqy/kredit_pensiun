import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kredit_pensiun/provider/simulation_pensiunan_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

// ignore: must_be_immutable
class SimulationPensiunanResult extends StatefulWidget {
  String namaPensiun;
  String gajiPensiun;
  String tanggalLahir;
  String jenisSimulasi;
  String jenisKredit;
  String bankBayarPensiun;
  String plafondPinjaman;
  String jangkaWaktu;
  String jenisAsuransi;
  String blokirAngsuran;
  String takeoverBankLain;
  String angsuranPerbulan;
  SimulationPensiunanResult(
    this.namaPensiun,
    this.gajiPensiun,
    this.tanggalLahir,
    this.jenisSimulasi,
    this.jenisKredit,
    this.bankBayarPensiun,
    this.plafondPinjaman,
    this.jangkaWaktu,
    this.jenisAsuransi,
    this.blokirAngsuran,
    this.takeoverBankLain,
    this.angsuranPerbulan,
  );

  @override
  _SimulationPensiunanResultState createState() =>
      _SimulationPensiunanResultState();
}

class _SimulationPensiunanResultState extends State<SimulationPensiunanResult> {
  void initState() {
    //print(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: Colors.blue,
            elevation: 0,
            title: Text(
              'Hasil Simulasi',
              style: TextStyle(
                  fontFamily: 'Montserrat Regular', color: Colors.white),
            ),
            actions: <Widget>[],
          ),
          body: FutureBuilder(
              future: Provider.of<SimulationPensiunanProvider>(context,
                      listen: false)
                  .getSimulationPensiunan(simulationPensiunanItem(
                      widget.namaPensiun,
                      widget.gajiPensiun,
                      widget.tanggalLahir,
                      widget.jenisSimulasi,
                      widget.jenisKredit,
                      widget.bankBayarPensiun,
                      widget.plafondPinjaman,
                      widget.jangkaWaktu,
                      widget.jenisAsuransi,
                      widget.blokirAngsuran,
                      widget.takeoverBankLain,
                      widget.angsuranPerbulan)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  );
                }
                return Consumer<SimulationPensiunanProvider>(
                    builder: (context, data, _) {
                  print(data.dataSimulationPensiunan.length);
                  if (data.dataSimulationPensiunan[0].messageText ==
                      "dsr_tinggi") {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white54),
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                      child: Text(
                          'Simulasi gagal, DSR ${data.dataSimulationPensiunan[0].nilai} % melebihi 90.00 %, silahkan coba lagi...'),
                    );
                  } else if (data.dataSimulationPensiunan[0].messageText ==
                      "jangka_waktu_tinggi") {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white54),
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                      child: Text(
                          'Simulasi gagal, jangka waktu maksimal ${data.dataSimulationPensiunan[0].nilai} bulan, silahkan coba lagi...'),
                    );
                  } else {
                    return Container(
                        decoration: BoxDecoration(color: Colors.white54),
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                              ))),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'DATA PRIBADI',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Nama Lengkap',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].namaPensiun}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Gaji Terakhir',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].gajiPensiun)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Tanggal Lahir',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].tanggalLahir}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Usia Saat Ini',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].umur} TAHUN',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Usia (pembulatan)',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].umurPembulatan} TAHUN',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jenis Simulasi',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].jenisSimulasi}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jenis Kredit',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].jenisKredit}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Bank Ambil Gaji',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].bankBayarPensiun}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                              ))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text('PERHITUNGAN PINJAMAN',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    'Montserrat Regular',
                                                color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Nominal Pinjaman',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].plafondMaksimal)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jangka Waktu',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].jangWaktu} BULAN',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Angsuran per Bulan',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].angsuranPerbulan)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'DSR Pinjaman',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].iirPinjaman} %',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Bunga Anuitas',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].bungaAnuitas} %',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Bunga Efektif',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${data.dataSimulationPensiunan[0].bungaEfektif} %',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Sisa Gaji Pensiun',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].sisaGaji)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Status Pinjaman',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              color: Colors.greenAccent,
                                              child: Text(
                                                "${data.dataSimulationPensiunan[0].messageText}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Montserrat Regular',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                              ))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.attach_money,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'PERHITUNGAN TERIMA BERSIH',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jenis Asuransi',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "${data.dataSimulationPensiunan[0].jenisAsuransi}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Biaya Provisi',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].biayaProvisi)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Biaya Administrasi',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].biayaAdministrasi)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Biaya Materai',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].biayaMaterai)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Biaya Asuransi',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].biayaAsuransi)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Total Biaya',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].totalBiaya)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Blokir Angsuran',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].blokirAngsuran)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Hutang Bank Lain',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].takeoverBankLain)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Total Potongan',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${formatRupiah(data.dataSimulationPensiunan[0].totalPotongan)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat Regular'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Terima Bersih',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular'),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              color: Colors.greenAccent,
                                              padding: EdgeInsets.all(5),
                                              child: Text(
                                                '${formatRupiah(data.dataSimulationPensiunan[0].terimaBersih)}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Montserrat Regular',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Stack(
                                      children: <Widget>[ajukan()],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  }
                });
              })),
    );
  }

  Widget ajukan() {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        color: Colors.blue, //MENGATUR WARNA TOMBOL
        onPressed: () {},
        child: Text(
          'Ajukan',
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
