import 'package:flutter/material.dart';
import '../common/theme.dart';

class LoadingButton extends StatefulWidget {
  final Function()? onPressed;

  const LoadingButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  Color colorButton = white;

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
        onPressed: widget.onPressed,
        child: SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(
              color: primaryOrange,
              strokeWidth: 3,
            )),
      ),
    );
  }
}
