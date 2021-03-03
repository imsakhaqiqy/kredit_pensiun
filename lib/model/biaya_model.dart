class BiayaModel {
  String title;
  String isi;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  BiayaModel({this.title, this.isi});

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory BiayaModel.fromJson(Map<String, dynamic> json) => BiayaModel(
        title: json['title'],
        isi: json['isi'],
      );
}
