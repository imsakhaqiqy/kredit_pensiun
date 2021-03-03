import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kredit_pensiun/model/syarat_model.dart';

class SyaratItem {
  String idBank;
  String idProduk;

  SyaratItem(this.idBank, this.idProduk);
}

class SyaratProvider extends ChangeNotifier {
  List<SyaratModel> _data = [];
  List<SyaratModel> get dataSyarat => _data;

  Future<List> getSyarat(SyaratItem syaratItem) async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getSyarat';
    final response = await http.post(url,
        body: {'id_produk': syaratItem.idProduk, 'id_bank': syaratItem.idBank});
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Syarat']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<SyaratModel>((json) => SyaratModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
