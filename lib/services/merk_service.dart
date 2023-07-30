import 'dart:convert';
import '../common/global_variable.dart' as global;
import 'package:http/http.dart' as http;
import '../models/merk_model.dart';

class MerkService {
  Future<List<MerkModel>> getMerkPerkategori(String id) async {
    String url = "${global.baseLocalURL}/kategori/merk/$id";
    // var url = Uri.http("");
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final kategori = jsonDecode(response.body)['data']['merk'] as List;
      final data = kategori.map((object) {
        return MerkModel(
          id: object['id'],
          namaMerk: object['nama_merk'],
          kategoriId: int.parse(object['kategori_id']),
        );
      }).toList();

      return data;
    } else {
      throw Exception("Gagal get data Merk!");
    }
  }
}
