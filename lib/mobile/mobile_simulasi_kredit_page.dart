import 'package:flutter/material.dart';
import '../widgets/simulasi_kredit_widget.dart';

class MobileSimulasiKreditPage extends StatefulWidget {
  final String barang, image, idKategori;
  
  const MobileSimulasiKreditPage({super.key,
    required this.barang,
    required this.image,
    required this.idKategori,
    });

  @override
  State<MobileSimulasiKreditPage> createState() => _MobileSimulasiKreditPageState();
}

class _MobileSimulasiKreditPageState extends State<MobileSimulasiKreditPage> {
  @override
  Widget build(BuildContext context) {
    return SimulasiKreditWidget(
      barang: widget.barang,
      image: widget.image,
      idKategori: widget.idKategori,
    );
  }
}