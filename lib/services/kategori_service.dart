import 'dart:convert';
import '../models/kategori_model.dart';
import '../common/global_variable.dart' as global;
import 'package:http/http.dart' as http;

class KategoriService {
  Future<List<KategoriModel>> getSemuaKategori() async {
    String url = "${global.baseLocalURL}/kategori";
    // var url = Uri.http("");
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final kategori = jsonDecode(response.body)['data'] as List;
      final data = kategori.map((object) {
        return KategoriModel(
          id: object['id'],
          namaKategori: object['nama_kategori'],
          image: object['image'],
        );
      }).toList();

      return data;
    } else {
      throw Exception("Gagal get data Kategori!");
    }
  }
}
