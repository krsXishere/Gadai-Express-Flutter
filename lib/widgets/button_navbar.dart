import 'package:flutter/material.dart';
import '../common/theme.dart';

class ButtonNavbar extends StatefulWidget {
  final String text;
  final Function()? onPressed;

  const ButtonNavbar({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<ButtonNavbar> createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  Color colorButton = white;
  Color textColorButton = primaryOrange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        right: 5,
      ),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: colorButton,
            minimumSize: const Size(100, 50),
            maximumSize: const Size(500, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onHover: (value) {
            if (value == true) {
              setState(() {
                colorButton = secondaryOrange;
                textColorButton = white;
              });
            } else {
              setState(() {
                colorButton = white;
                textColorButton = primaryOrange;
              });
            }
          },
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: primaryTextStyle.copyWith(
              color: textColorButton,
            ),
          ),
        ),
      ),
    );
  }
}
