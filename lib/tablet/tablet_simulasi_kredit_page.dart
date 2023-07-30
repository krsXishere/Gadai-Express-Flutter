import 'package:flutter/material.dart';
import 'package:simulasi_kredit/widgets/simulasi_kredit_widget.dart';

class TabletSimulasiKreditPage extends StatefulWidget {
  final String barang, image, idKategori;

  const TabletSimulasiKreditPage({
    super.key,
    required this.barang,
    required this.image,
    required this.idKategori,
  });

  @override
  State<TabletSimulasiKreditPage> createState() =>
      _TabletSimulasiKreditPageState();
}

class _TabletSimulasiKreditPageState extends State<TabletSimulasiKreditPage> {
  @override
  Widget build(BuildContext context) {
    return SimulasiKreditWidget(
      barang: widget.barang,
      image: widget.image,
      idKategori: widget.idKategori,
    );
  }
}
