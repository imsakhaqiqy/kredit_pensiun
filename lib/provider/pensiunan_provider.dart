import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kredit_pensiun/model/pensiunan_model.dart';

class PensiunanProvider extends ChangeNotifier {
  List<PensiunanModel> _data = [];
  List<PensiunanModel> get dataPensiunan => _data;

  Future<List> getPensiunan() async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getKreditPensiunan';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Produk']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<PensiunanModel>((json) => PensiunanModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
