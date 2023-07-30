class BarangModel {
  int? id, kategoriId, merkId;
  String? namaBarang, merkBarang, tipeBarang, spesifikasi, image;
  double? hargaBarang;
  bool isLoading = false;

  BarangModel({
    required this.id,
    required this.namaBarang,
    required this.merkBarang,
    required this.tipeBarang,
    required this.hargaBarang,
    required this.spesifikasi,
    required this.image,
    required this.kategoriId,
    required this.merkId,
  });

  factory BarangModel.fromJson(Map<String, dynamic> object) {
    return BarangModel(
      id: object['id'],
      namaBarang: object['nama_barang'],
      merkBarang: object['merk_barang'],
      tipeBarang: object['tipe_barang'],
      hargaBarang: double.parse(object['harga_barang']),
      spesifikasi: object['spesifikasi'],
      image: object['image'],
      kategoriId: int.parse(object['kategori_id']),
      merkId: int.parse(object['merk_id']),
    );
  }
}
