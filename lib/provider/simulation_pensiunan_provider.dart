import 'package:kredit_pensiun/model/simulation_pensiunan_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types
class simulationPensiunanItem {
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
  simulationPensiunanItem(
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
      this.angsuranPerbulan);
}

class SimulationPensiunanProvider extends ChangeNotifier {
  List<SimulationPensiunanModel> _data = [];
  List<SimulationPensiunanModel> get dataSimulationPensiunan => _data;

  Future<List<SimulationPensiunanModel>> getSimulationPensiunan(
      simulationPensiunanItem simulationPensiunan) async {
    final url =
        'https://www.nabasa.co.id/api_kredit_pensiun_v1/tes.php/getSimulationPensiunan';
    final response = await http.post(url, body: {
      'nama_pensiun': simulationPensiunan.namaPensiun,
      'gaji_pensiun': simulationPensiunan.gajiPensiun,
      'tanggal_lahir': simulationPensiunan.tanggalLahir,
      'jenis_simulasi': simulationPensiunan.jenisSimulasi,
      'jenis_kredit': simulationPensiunan.jenisKredit,
      'bank_bayar_pensiun': simulationPensiunan.bankBayarPensiun,
      'plafond_pinjaman': simulationPensiunan.plafondPinjaman,
      'jangka_waktu': simulationPensiunan.jangkaWaktu,
      'jenis_asuransi': simulationPensiunan.jenisAsuransi,
      'blokir_pinjaman': simulationPensiunan.blokirAngsuran,
      'takeover_bank_lain': simulationPensiunan.takeoverBankLain,
      'angsuran_perbulan': simulationPensiunan.angsuranPerbulan
    });

    if (response.statusCode == 200) {
      final result = json
          .decode(response.body)['Daftar_Simulasi_Pensiunan']
          .cast<Map<String, dynamic>>();
      _data = result
          .map<SimulationPensiunanModel>(
              (json) => SimulationPensiunanModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
