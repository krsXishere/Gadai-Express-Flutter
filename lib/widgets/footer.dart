import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/theme.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: primaryOrange,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.network(
                          "https://gadai-express-simulasi.nextspace.cloud/assets/assets/image/png/motto.png",
                          scale: 20,
                        ),
                      ),
                      Text(
                        "Solusi Keuangan Cepat,\nAman & Terjamin",
                        textAlign: TextAlign.center,
                        style: primaryTextStyle.copyWith(
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/image/svg/facebook.svg",
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/image/svg/instagram.svg",
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 3,
                color: white,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "©2023. Gadai Express. All Rights Reserved.",
                style: primaryTextStyle.copyWith(
                  color: white,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
