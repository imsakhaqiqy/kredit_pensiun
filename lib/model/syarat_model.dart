class SyaratModel {
  String isi;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  SyaratModel({this.isi});

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory SyaratModel.fromJson(Map<String, dynamic> json) =>
      SyaratModel(isi: json['isi']);
}
