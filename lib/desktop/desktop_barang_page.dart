import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:simulasi_kredit/providers/kategori_provider.dart';
import 'package:simulasi_kredit/widgets/button_navbar.dart';
import '../common/theme.dart';
import '../widgets/card_barang.dart';
import '../widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopBarangPage extends StatefulWidget {
  const DesktopBarangPage({super.key});

  @override
  State<DesktopBarangPage> createState() => _DesktopBarangPageState();
}

class _DesktopBarangPageState extends State<DesktopBarangPage> {
  double widthContainer = 700;

  _launchUrl(String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw Exception("Gagal membuka $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<KategoriProvider>(
        context,
        listen: false,
      ).getSemuaKategori();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOrange,
        elevation: 2,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/image/png/logo.png",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Gadai Express",
                        style: primaryTextStyle.copyWith(
                          color: white,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Solusi Keuangan Cepat,\nAman & Terjamin",
                    style: primaryTextStyle.copyWith(
                      color: white,
                      fontSize: 20,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 7,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ButtonNavbar(
                        text: "Beranda",
                        onPressed: () {
                          _launchUrl("https://gadaiexpress.id/");
                        },
                      ),
                      ButtonNavbar(
                        text: "Produk Gadai",
                        onPressed: () {
                          _launchUrl("https://gadaiexpress.id/?page_id=28");
                        },
                      ),
                      ButtonNavbar(
                        text: "Cabang Kami",
                        onPressed: () {
                          _launchUrl("https://gadaiexpress.id/?page_id=127");
                        },
                      ),
                      ButtonNavbar(
                        text: "Syarat & Ketentuan",
                        onPressed: () {
                          _launchUrl("https://gadaiexpress.id/#/");
                        },
                      ),
                      ButtonNavbar(
                        text: "Hubungi Kami",
                        onPressed: () {
                          _launchUrl(
                              "https://api.whatsapp.com/send?phone=6281331361959&text=Hallo%20Daimin,%20Saya%20ingin%20menggadaikan%20barang%20ini%20...");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(
            100,
          ),
          child: SizedBox(
            height: 100,
          ),
        ),
      ),
      body: Consumer<KategoriProvider>(builder: (context, value, child) {
        final kategoris = value.kategori;

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Pilih Barang Simulasi Pendanaan Pegadaian",
                style: primaryTextStyle.copyWith(
                  color: primaryOrange,
                  fontWeight: bold,
                  fontSize: 20,
                ),
              ),
            ),
            value.isLoading == true
                ? GridView.count(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        child: Shimmer(
                          color: white,
                          child: Container(
                            decoration: BoxDecoration(
                              color: secondaryOrange,
                            ),
                            width: double.maxFinite,
                            height: 50,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        child: Shimmer(
                          color: white,
                          child: Container(
                            decoration: BoxDecoration(
                              color: secondaryOrange,
                            ),
                            width: double.maxFinite,
                            height: 50,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        child: Shimmer(
                          color: white,
                          child: Container(
                            decoration: BoxDecoration(
                              color: secondaryOrange,
                            ),
                            width: double.maxFinite,
                            height: 50,
                          ),
                        ),
                      ),
                    ],
                  )
                : GridView.builder(
                    itemCount: kategoris.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final kategori = kategoris[index];

                      return CardBarang(
                        stuffName: kategori.namaKategori.toString(),
                        image: kategori.image.toString(),
                        idKategori: kategori.id.toString(),
                      );
                    },
                  ),
            const FooterWidget(),
          ],
        );
      }),
    );
  }
}
