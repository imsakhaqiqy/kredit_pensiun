class PersyaratanModel {
  String isi;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  PersyaratanModel({this.isi});

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory PersyaratanModel.fromJson(Map<String, dynamic> json) =>
      PersyaratanModel(isi: json['isi']);
}
