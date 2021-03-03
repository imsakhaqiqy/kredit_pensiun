import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kredit_pensiun/model/header_model.dart';

class HeaderItem {
  String idBank;
  String idProduk;

  HeaderItem(this.idBank, this.idProduk);
}

class HeaderProvider extends ChangeNotifier {
  List<HeaderModel> _data = [];
  List<HeaderModel> get dataHeader => _data;

  Future<List> getHeader(HeaderItem headerItem) async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getHeader';
    final response = await http.post(url,
        body: {'id_produk': headerItem.idProduk, 'id_bank': headerItem.idBank});
    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Header']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<HeaderModel>((json) => HeaderModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
