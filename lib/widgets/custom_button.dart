import 'package:flutter/material.dart';
import '../common/theme.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color colorButton = white;
  Color textColorButton = primaryOrange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onHover: (value) {
          if (value == true) {
            setState(() {
              colorButton = primaryOrange;
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
    );
  }
}
