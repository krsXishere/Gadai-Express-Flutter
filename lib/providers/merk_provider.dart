import 'package:flutter/material.dart';
import '../models/merk_model.dart';
import '../services/merk_service.dart';

class MerkProvider with ChangeNotifier {
  final _merkService = MerkService();
  List<MerkModel> _merks = [];
  List<MerkModel> get merk => _merks;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getMerkPerkategori(String id) async {
    checkLoading(true);
    final data = await _merkService.getMerkPerkategori(id);

    _merks = data;
    checkLoading(false);
  }
}