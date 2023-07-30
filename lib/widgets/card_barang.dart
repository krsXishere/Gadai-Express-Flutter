import 'package:flutter/material.dart';
import 'package:simulasi_kredit/pages/simulasi_kredit_page.dart';
import '../common/theme.dart';
import '../common/global_variable.dart' as global;

class CardBarang extends StatelessWidget {
  final String stuffName, image, idKategori;

  const CardBarang({
    super.key,
    required this.stuffName,
    required this.image,
    required this.idKategori,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryOrange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "${global.imageBaseURL}$image",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  stuffName,
                  style: primaryTextStyle.copyWith(color: white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SimulasiKreditPage(
                            barang: stuffName,
                            image: image,
                            idKategori: idKategori,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: primaryOrange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
