import 'package:flutter/material.dart';
import 'package:simulasi_kredit/common/responsive_layout.dart';
import 'package:simulasi_kredit/common/theme.dart';
import 'package:simulasi_kredit/desktop/desktop_simulasi_kredit_page.dart';
import 'package:simulasi_kredit/mobile/mobile_simulasi_kredit_page.dart';
import 'package:simulasi_kredit/tablet/tablet_simulasi_kredit_page.dart';

class SimulasiKreditPage extends StatefulWidget {
  final String barang, image, idKategori;

  const SimulasiKreditPage({
    super.key,
    required this.barang,
    required this.image,
    required this.idKategori,
  });

  @override
  State<SimulasiKreditPage> createState() => _SimulasiKreditPageState();
}

class _SimulasiKreditPageState extends State<SimulasiKreditPage> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Simulasi Kredit | Gadai Express",
      color: primaryOrange,
      child: ResponsiveLayout(
        mobileBody: MobileSimulasiKreditPage(
          barang: widget.barang,
          image: widget.image,
          idKategori: widget.idKategori,
        ),
        tabletBody: TabletSimulasiKreditPage(
          barang: widget.barang,
          image: widget.image,
          idKategori: widget.idKategori,
        ),
        desktopBody: DesktopSimulasiKreditPage(
          barang: widget.barang,
          image: widget.image,
          idKategori: widget.idKategori,
        ),
      ),
    );
  }
}
