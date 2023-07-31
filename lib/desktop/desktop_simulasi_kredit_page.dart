import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:simulasi_kredit/providers/barang_provider.dart';
import 'package:simulasi_kredit/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/theme.dart';
import '../models/barang_model.dart';
import '../models/merk_model.dart';
import '../providers/merk_provider.dart';
import '../widgets/button_navbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/input_widget.dart';
import '../widgets/loading_button.dart';
import '../common/global_variable.dart' as global;

class DesktopSimulasiKreditPage extends StatefulWidget {
  final String barang, image, idKategori;

  const DesktopSimulasiKreditPage({
    super.key,
    required this.barang,
    required this.image,
    required this.idKategori,
  });

  @override
  State<DesktopSimulasiKreditPage> createState() =>
      _DesktopSimulasiKreditPageState();
}

class _DesktopSimulasiKreditPageState extends State<DesktopSimulasiKreditPage> {
  TextEditingController merkController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  double width = 300;
  bool isCalculated = false;
  bool isLoading = false;
  double persenPendanaan = 0.7;
  double dana = 0;
  double administrasiTwoWeeks = 0;
  double administrasiFourWeeks = 0;
  double totalDanaDiterimaTwoWeeks = 0;
  double totalDanaDiterimaFourWeeks = 0;
  DateTime dateNow = DateTime.now();
  late DateTime dateTwoWeeks;
  late DateTime dateFourWeeks;
  final dateFormat = DateFormat("dd-MM-yyyy");
  int currentIndex = 0;
  int currentIndex2 = 0;
  int? merkId;
  List<BarangModel> barangs = [];
  List<MerkModel> merks = [];
  bool merkIsLoading = false;

  String calcBesaranPendanaan(String harga) {
    dana = persenPendanaan * double.parse(harga);

    return dana.toString();
  }

  String calcAdministrasiTwoWeeks() {
    administrasiTwoWeeks = dana * 0.05;

    return administrasiTwoWeeks.toString();
  }

  String calcAdministrasiFourWeeks() {
    administrasiFourWeeks = dana * 0.1;

    return administrasiFourWeeks.toString();
  }

  String calcTotalDanaDiterimaTwoWeeks() {
    totalDanaDiterimaTwoWeeks = dana - administrasiTwoWeeks;

    return totalDanaDiterimaTwoWeeks.toString();
  }

  String calcTotalDanaDiterimaFourWeeks() {
    totalDanaDiterimaFourWeeks = dana - administrasiFourWeeks;

    return totalDanaDiterimaFourWeeks.toString();
  }

  calcTanggal() {
    setState(() {
      dateTwoWeeks = dateNow.add(const Duration(
        days: 13,
      ));
      dateFourWeeks = dateNow.add(const Duration(
        days: 29,
      ));
    });
  }

  calculated(String harga) {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(microseconds: 300), () {
      calcBesaranPendanaan(harga);
      calcAdministrasiTwoWeeks();
      calcAdministrasiFourWeeks();
      calcTotalDanaDiterimaTwoWeeks();
      calcTotalDanaDiterimaFourWeeks();
      calcTanggal();

      setState(() {
        isCalculated = true;
        isLoading = false;
      });
    });
  }

  String formatCurrency(var currency) {
    final initialData = NumberFormat("#,##0", "id");
    String currentData = initialData.format(currency);
    return currentData;
  }

  _launchUrl(String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw Exception("Gagal membuka $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MerkProvider>(
        context,
        listen: false,
      ).getMerkPerkategori(widget.idKategori);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOrange,
        elevation: 2,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 50),
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
                        child: Image.network(
                          "https://gadai-express-simulasi.nextspace.cloud/assets/assets/image/png/logo.png",
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
      body: Consumer2<BarangProvider, MerkProvider>(builder: (
        context,
        value,
        value2,
        child,
      ) {
        final barangs = value.barangsPerkategoriPermerk;
        this.barangs = barangs;
        final merks = value2.merk;
        this.merks = merks;
        merkIsLoading = value.isLoading;

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Simulasi Pendanaan Pegadaian ${widget.barang}",
                style: primaryTextStyle.copyWith(
                  color: primaryOrange,
                  fontWeight: bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                width: double.maxFinite,
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 500,
                            width: 440,
                            decoration: BoxDecoration(
                              color: secondaryOrange,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${global.imageBaseURL}${widget.image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Text(
                              widget.barang,
                              style: primaryTextStyle.copyWith(
                                color: white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 10,
                      child: Container(
                        height: 500,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: secondaryOrange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: isCalculated == true
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: Text(
                                        "Hasil Kalkulasi Simulasi Pendanaan Pegadaian untuk\n${widget.barang} ${merkController.text} ${typeController.text}",
                                        textAlign: TextAlign.center,
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: bold,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    builDataTable(context),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomButton(
                                            text: "Kembali",
                                            onPressed: () {
                                              setState(() {
                                                isCalculated = false;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: double.maxFinite,
                                      child: buildCustomTabBar(context),
                                    ),
                                    value.isLoading == true
                                        ? buildShimmerListBarang(context)
                                        : barangs.isEmpty
                                            ? Center(
                                                child: Text(
                                                  "Pilih merk di atas",
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    color: white,
                                                    fontSize: 18,
                                                    fontWeight: medium,
                                                  ),
                                                ),
                                              )
                                            : buildListBarang(context),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const FooterWidget(),
          ],
        );
      }),
    );
  }

  Widget buildShimmerListBarang(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                child: Shimmer(
                  color: secondaryOrange,
                  child: Container(
                    decoration: BoxDecoration(color: white),
                    width: double.maxFinite,
                    height: 50,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                child: Shimmer(
                  color: secondaryOrange,
                  child: Container(
                    decoration: BoxDecoration(color: white),
                    width: double.maxFinite,
                    height: 50,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                child: Shimmer(
                  color: secondaryOrange,
                  child: Container(
                    decoration: BoxDecoration(color: white),
                    width: double.maxFinite,
                    height: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCustomTabBar(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        itemCount: merks.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final merk = merks[index];
          // merkId = merks[0].id;

          return Column(
            children: [
              merkIsLoading == true
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            child: Shimmer(
                              color: secondaryOrange,
                              child: Container(
                                decoration: BoxDecoration(color: white),
                                width: 80,
                                height: 45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          currentIndex2 = index;
                          merkId = merk.id;
                        });

                        WidgetsBinding.instance.addPostFrameCallback(
                          (timeStamp) {
                            Provider.of<BarangProvider>(
                              context,
                              listen: false,
                            ).getBarangsPerkategoriPermerk(
                              widget.idKategori,
                              merkId.toString(),
                            );
                          },
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                          color: currentIndex == index ? white : unClickColor,
                          borderRadius: currentIndex == index
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            merk.namaMerk.toString(),
                            style: primaryTextStyle.copyWith(
                              color: secondaryOrange,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          );
        },
      );

  Widget buildListBarang(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          itemCount: barangs.length,
          itemBuilder: (context, index) {
            final barang = barangs[index];
            // merkId = barang.

            return Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: white,
                    backgroundImage:
                        NetworkImage("${global.imageBaseURL}${barang.image}"),
                  ),
                  title: Text(
                    "${barang.namaBarang}",
                    style: primaryTextStyle.copyWith(
                      color: black,
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  subtitle: Text(
                    "${barang.tipeBarang}",
                    style: primaryTextStyle.copyWith(
                      color: black,
                    ),
                  ),
                  trailing: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                    ),
                    child: barang.isLoading == true
                        ? CircularProgressIndicator(
                            strokeWidth: 3,
                            color: primaryOrange,
                          )
                        : Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: primaryOrange,
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      barang.isLoading = true;
                    });

                    Future.delayed(const Duration(seconds: 3), () {
                      calculated(
                        barang.hargaBarang.toString(),
                      );
                      setState(() {
                        barang.isLoading = false;
                      });
                    });
                  },
                ),
              ),
            );
          },
        ),
      );

  Widget builDataTable(BuildContext context) => SizedBox(
        width: double.maxFinite,
        child: DataTable(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15),
          ),
          columns: [
            DataColumn(
              label: Text(
                "Keterangan",
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                "Tenor 14 Hari",
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                "Tenor 30 Hari",
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Administrasi",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(calcAdministrasiTwoWeeks()))}",
                    style: primaryTextStyle,
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(calcAdministrasiFourWeeks()))}",
                    style: primaryTextStyle,
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Total Angsuran",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(dana.toString()))}",
                    style: primaryTextStyle,
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(dana.toString()))}",
                    style: primaryTextStyle,
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Total Dana Diterima",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(calcTotalDanaDiterimaTwoWeeks()))}",
                    style: primaryTextStyle,
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(calcTotalDanaDiterimaFourWeeks()))}",
                    style: primaryTextStyle,
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Biaya Perpanjangan",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(calcAdministrasiTwoWeeks()))}",
                    style: primaryTextStyle,
                  ),
                ),
                DataCell(
                  Text(
                    "Rp ${formatCurrency(int.parse(calcAdministrasiFourWeeks()))}",
                    style: primaryTextStyle,
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Jatuh Tempo",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    dateFormat.format(dateTwoWeeks).toString(),
                    style: primaryTextStyle,
                  ),
                ),
                DataCell(
                  Text(
                    dateFormat.format(dateFourWeeks).toString(),
                    style: primaryTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildCalculator(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputWidget(
            label: "Merk",
            controller: merkController,
            hintText: "Masukkan Merk",
            keyboardType: TextInputType.text,
            prefixText: "",
            formatters: const [],
            width: width,
            onChanged: (value) {},
          ),
          InputWidget(
            label: "Tipe",
            controller: typeController,
            hintText: "Masukkan Tipe",
            keyboardType: TextInputType.text,
            prefixText: "",
            formatters: const [],
            width: width,
            onChanged: (value) {},
          ),
          InputWidget(
            label: "Harga Pasaran",
            controller: hargaController,
            hintText: "Rp 0.000",
            keyboardType: TextInputType.number,
            prefixText: "",
            width: width,
            formatters: [
              CurrencyTextInputFormatter(
                locale: 'id',
                decimalDigits: 0,
                symbol: 'Rp ',
              ),
            ],
            onChanged: (value) {},
          ),
          CustomDropdown(
            width: width,
            dropdownValue: "50%",
            onChanged: (value) {
              if (value == "50%") {
                setState(() {
                  persenPendanaan = 0.5;
                });
              } else {
                setState(() {
                  persenPendanaan = 0.6;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isLoading == true
                    ? LoadingButton(
                        onPressed: () {},
                      )
                    : CustomButton(
                        text: "Hitung",
                        onPressed: calculated(""),
                      ),
              ],
            ),
          ),
        ],
      );
}
