import 'package:kredit_pensiun/model/pegawai_aktif_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PegawaiAktifProvider extends ChangeNotifier {
  List<PegawaiAktifModel> _data = [];
  List<PegawaiAktifModel> get dataPegawaiAktif => _data;

  Future<List> getPegawaiAktif() async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getKreditPegawaiAktif';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Produk']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<PegawaiAktifModel>((json) => PegawaiAktifModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
