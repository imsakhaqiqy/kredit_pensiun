import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kredit_pensiun/model/guna_model.dart';

class GunaItem {
  String idBank;
  String idProduk;

  GunaItem(this.idBank, this.idProduk);
}

class GunaProvider extends ChangeNotifier {
  List<GunaModel> _data = [];
  List<GunaModel> get dataGuna => _data;

  Future<List> getGuna(GunaItem gunaItem) async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getManfaat';
    final response = await http.post(url,
        body: {'id_produk': gunaItem.idProduk, 'id_bank': gunaItem.idBank});
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Manfaat']
          .cast<Map<String, dynamic>>();
      _data =
          result.map<GunaModel>((json) => GunaModel.fromJson(json)).toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
