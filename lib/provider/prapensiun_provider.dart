import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kredit_pensiun/model/prapensiun_model.dart';

class PrapensiunProvider extends ChangeNotifier {
  List<PrapensiunModel> _data = [];
  List<PrapensiunModel> get dataPrapensiun => _data;

  Future<List> getPrapensiun() async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getKreditPrapensiun';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Produk']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<PrapensiunModel>((json) => PrapensiunModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
