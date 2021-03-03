import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kredit_pensiun/model/platinum_model.dart';

class PlatinumProvider extends ChangeNotifier {
  List<PlatinumModel> _data = [];
  List<PlatinumModel> get dataPlatinum => _data;

  Future<List> getPlatinum() async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getKreditPlatinum';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Produk']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<PlatinumModel>((json) => PlatinumModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
