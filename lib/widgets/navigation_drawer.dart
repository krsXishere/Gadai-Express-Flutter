import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/theme.dart';
import 'drawer_item.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext buildContext) => Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryOrange,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/image/png/logo.png"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Gadai Express",
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
              color: white,
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Solusi Keuangan Cepat, Aman & Terjamin",
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
              color: white,
            ),
          ),
        ],
      ),
    );

_launchUrl(String link) async {
  final Uri url = Uri.parse(link);

  if (!await launchUrl(url)) {
    throw Exception("Gagal membuka $url");
  }
}

Widget buildMenuItems(BuildContext context) => Column(
      children: [
        DrawerItem(
          text: "Beranda",
          onTap: () {
            _launchUrl("https://gadaiexpress.id/");
          },
        ),
        DrawerItem(
          text: "Produk Gadai",
          onTap: () {
            _launchUrl("https://gadaiexpress.id/?page_id=28");
          },
        ),
        DrawerItem(
          text: "Cabang Kami",
          onTap: () {
            _launchUrl("https://gadaiexpress.id/?page_id=127");
          },
        ),
        DrawerItem(
          text: "Syarat & Ketentuan",
          onTap: () {
            _launchUrl("https://gadaiexpress.id/#/");
          },
        ),
        DrawerItem(
          text: "Hubungi Kami",
          onTap: () {
            _launchUrl(
                "https://api.whatsapp.com/send?phone=6281331361959&text=Hallo%20Daimin,%20Saya%20ingin%20menggadaikan%20barang%20ini%20...");
          },
        ),
      ],
    );
