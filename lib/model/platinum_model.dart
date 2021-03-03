class PlatinumModel {
  String id;
  String namaBank;
  String nama;
  String definisi;
  String produk;
  String path;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  PlatinumModel(
      {this.id,
      this.namaBank,
      this.nama,
      this.definisi,
      this.produk,
      this.path});

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory PlatinumModel.fromJson(Map<String, dynamic> json) => PlatinumModel(
      id: json['id'],
      namaBank: json['nama_bank'],
      nama: json['nama'],
      definisi: json['isi'],
      produk: json['produk'],
      path: json['path']);
}
