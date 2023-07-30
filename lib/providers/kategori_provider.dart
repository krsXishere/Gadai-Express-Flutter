import 'package:flutter/material.dart';
import '../models/kategori_model.dart';
import '../services/kategori_service.dart';

class KategoriProvider with ChangeNotifier {
  final _kategoriService = KategoriService();
  List<KategoriModel> _kategoris = [];
  List<KategoriModel> get kategori => _kategoris;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getSemuaKategori() async {
    checkLoading(true);
    final data = await _kategoriService.getSemuaKategori();

    _kategoris = data;
    checkLoading(false);
  }
}
