import 'package:flutter/material.dart';
import '../common/theme.dart';

class CustomDropdown extends StatefulWidget {
  final String dropdownValue;
  final Function(String?) onChanged;
  final double width;

  const CustomDropdown({
    super.key,
    required this.dropdownValue,
    required this.onChanged,
    required this.width,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Persen Pendanaan",
            style: primaryTextStyle.copyWith(
              color: white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: widget.width,
            child: DropdownButtonFormField(
              isExpanded: true,
              style: primaryTextStyle,
              iconDisabledColor: unClickColor,
              iconEnabledColor: primaryOrange,
              borderRadius: BorderRadius.circular(15),
              focusColor: white,
              dropdownColor: white,
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
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: regular,
                  color: grey,
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: white,
              ),
              items: [
                DropdownMenuItem(
                  value: "50%",
                  child: Text(
                    "50%",
                    style: primaryTextStyle,
                  ),
                ),
                DropdownMenuItem(
                  value: "60%",
                  child: Text(
                    "60%",
                    style: primaryTextStyle,
                  ),
                ),
              ],
              value: widget.dropdownValue,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
