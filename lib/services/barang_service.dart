import 'dart:convert';
import '../models/barang_model.dart';
import 'package:http/http.dart' as http;
import '../common/global_variable.dart' as global;

class BarangService {
  Future<BarangModel> getBarang(String keyword) async {
    var url = Uri.parse("${global.baseLocalURL}/barang/$keyword");
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final barang = jsonDecode(response.body);
      final data = BarangModel.fromJson(barang['data']);

      return data;
    } else {
      throw Exception("Gagal get data barang!");
    }
  }

  Future<List<BarangModel>> getSemuaBarang() async {
    String url = "${global.baseLocalURL}/barang";
    // var url = Uri.http("");
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final barang = jsonDecode(response.body)['data'] as List;
      final data = barang.map((object) {
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
      }).toList();

      return data;
    } else {
      throw Exception("Gagal get data barang!");
    }
  }

  Future<List<BarangModel>> getBarangPerkategori(String id) async {
    // print("ID KATEGORI: $id");
    String url = "${global.baseLocalURL}/kategori/barang/$id";
    // var url = Uri.http("");
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final barang = jsonDecode(response.body)['data']['barang'] as List;
      final data = barang.map((object) {
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
      }).toList();

      return data;
    } else {
      throw Exception("Gagal get data barang!");
    }
  }

  Future<List<BarangModel>> getBarangsPerkategoriPermerk(
    String kategoriId,
    String merkId,
  ) async {
    String url = "${global.baseLocalURL}/barang/$kategoriId/$merkId";
    // var url = Uri.http("");
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final barang = jsonDecode(response.body)['data'] as List;
      final data = barang.map((object) {
        return BarangModel(
          id: int.parse(object['id']),
          namaBarang: object['nama_barang'],
          merkBarang: object['merk_barang'],
          tipeBarang: object['tipe_barang'],
          hargaBarang: double.parse(object['harga_barang']),
          spesifikasi: object['spesifikasi'],
          image: object['image'],
          kategoriId: int.parse(object['kategori_id']),
          merkId: int.parse(object['merk_id']),
        );
      }).toList();

      return data;
    } else {
      throw Exception("Gagal get data barang!");
    }
  }
}
