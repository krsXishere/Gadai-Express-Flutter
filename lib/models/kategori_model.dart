class KategoriModel {
  int? id;
  String? namaKategori, image;

  KategoriModel({
    required this.id,
    required this.namaKategori,
    required this.image,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> object) {
    return KategoriModel(
      id: object['id'],
      namaKategori: object['nama_kategori'],
      image: object['image'],
    );
  }
}
