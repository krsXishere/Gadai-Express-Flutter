import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:simulasi_kredit/common/theme.dart';
import 'package:simulasi_kredit/widgets/footer.dart';
import '../providers/kategori_provider.dart';
import '../widgets/card_barang.dart';
import '../widgets/navigation_drawer.dart';

class TabletBarangPage extends StatefulWidget {
  const TabletBarangPage({super.key});

  @override
  State<TabletBarangPage> createState() => _TabletBarangPageState();
}

class _TabletBarangPageState extends State<TabletBarangPage> {
  double widthContainer = 700;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<KategoriProvider>(
        context,
        listen: false,
      ).getSemuaKategori();
    });

    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: AppBar(
        centerTitle: kIsWeb ? true : false,
        backgroundColor: primaryOrange,
        elevation: 2,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Row(
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
                width: 20,
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
      body: Consumer<KategoriProvider>(
        builder: (context, value, child) {
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
                      crossAxisCount: 2,
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
        },
      ),
    );
  }
}
