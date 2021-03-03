import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kredit_pensiun/model/persyaratan_model.dart';

class PersyaratanItem {
  String idBank;
  String idProduk;

  PersyaratanItem(this.idBank, this.idProduk);
}

class PersyaratanProvider extends ChangeNotifier {
  List<PersyaratanModel> _data = [];
  List<PersyaratanModel> get dataPersyaratan => _data;

  Future<List> getPersyaratan(PersyaratanItem persyaratanItem) async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getPersyaratan';
    final response = await http.post(url, body: {
      'id_produk': persyaratanItem.idProduk,
      'id_bank': persyaratanItem.idBank
    });
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Persyaratan']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<PersyaratanModel>((json) => PersyaratanModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
