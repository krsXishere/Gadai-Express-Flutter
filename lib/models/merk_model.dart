class MerkModel {
  int? id, kategoriId;
  String? namaMerk;

  MerkModel({
    required this.id,
    required this.namaMerk,
    required this.kategoriId,
  });

  factory MerkModel.fromJson(Map<String, dynamic> object) {
    return MerkModel(
      id: object['id'],
      namaMerk: object['nama_merk'],
      kategoriId: int.parse(object['kategori_id']),
    );
  }
}
