import 'package:flutter/material.dart';
import 'package:simulasi_kredit/common/responsive_layout.dart';
import 'package:simulasi_kredit/desktop/desktop_barang_page.dart';
import 'package:simulasi_kredit/mobile/mobile_barang_page.dart';
import 'package:simulasi_kredit/tablet/tablet_barang_page.dart';
import '../common/theme.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Barang | Gadai Express",
      color: primaryOrange,
      child: const ResponsiveLayout(
        mobileBody: MobileBarangPage(),
        tabletBody: TabletBarangPage(),
        desktopBody: DesktopBarangPage(),
      ),
    );
  }
}
