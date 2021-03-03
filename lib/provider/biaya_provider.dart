import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kredit_pensiun/model/biaya_model.dart';
import 'dart:convert';

class BiayaItem {
  String idBank;
  String idProduk;

  BiayaItem(this.idBank, this.idProduk);
}

class BiayaProvider extends ChangeNotifier {
  List<BiayaModel> _data = [];
  List<BiayaModel> get dataBiaya => _data;

  Future<List> getBiaya(BiayaItem biayaItem) async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getBiaya';
    final response = await http.post(url,
        body: {'id_produk': biayaItem.idProduk, 'id_bank': biayaItem.idBank});
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Biaya']
          .cast<Map<String, dynamic>>();
      _data =
          result.map<BiayaModel>((json) => BiayaModel.fromJson(json)).toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
