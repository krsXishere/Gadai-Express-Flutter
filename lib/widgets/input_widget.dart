import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/theme.dart';

class InputWidget extends StatelessWidget {
  final String label, hintText, prefixText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? formatters;
  final Function(String)? onChanged;
  final double width;

  const InputWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.prefixText,
    required this.formatters,
    required this.onChanged,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: primaryTextStyle.copyWith(
              color: white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: width,
            child: TextFormField(
              style: primaryTextStyle,
              cursorColor: primaryOrange,
              keyboardType: keyboardType,
              controller: controller,
              inputFormatters: formatters,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: unClickColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: unClickColor,
                  ),
                ),
                hintText: hintText,
                prefixText: prefixText,
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: regular,
                  color: grey,
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: white,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
