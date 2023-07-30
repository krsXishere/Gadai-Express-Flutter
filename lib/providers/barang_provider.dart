import 'package:flutter/material.dart';
import 'package:simulasi_kredit/services/barang_service.dart';
import '../models/barang_model.dart';

class BarangProvider with ChangeNotifier {
  final _barangService = BarangService();
  BarangModel? _barang;
  BarangModel? get barang => _barang;
  List<BarangModel> _barangs = [];
  List<BarangModel> get barangs => _barangs;
  List<BarangModel> _barangsPerkategori = [];
  List<BarangModel> get barangsPerkategori => _barangsPerkategori;
  List<BarangModel> _barangsPerkategoriPermerk = [];
  List<BarangModel> get barangsPerkategoriPermerk => _barangsPerkategoriPermerk;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getBarang(String keyword) async {
    checkLoading(true);
    final data = await _barangService.getBarang(keyword);

    _barang = data;
    checkLoading(false);
  }

  Future<void> getSemuaBarang() async {
    checkLoading(true);
    final data = await _barangService.getSemuaBarang();

    _barangs = data;
    checkLoading(false);
  }

  Future<void> getBarangPerkategori(String id) async {
    checkLoading(true);
    final data = await _barangService.getBarangPerkategori(id);

    _barangsPerkategori = data;
    checkLoading(false);
  }

  Future<void> getBarangsPerkategoriPermerk(
    String kategoriId,
    String merkId,
  ) async {
    checkLoading(true);
    final data = await _barangService.getBarangsPerkategoriPermerk(
      kategoriId,
      merkId,
    );

    _barangsPerkategoriPermerk = data;
    checkLoading(false);
  }
}
