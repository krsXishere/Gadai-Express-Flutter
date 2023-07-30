import 'package:flutter/material.dart';
import '../common/theme.dart';

class DrawerItem extends StatefulWidget {
  final String? text;
  final Function()? onTap;

  const DrawerItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  Color textTileColor = primaryOrange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        hoverColor: secondaryOrange,
        splashColor: white,
        onTap: widget.onTap,
        onHover: (value) {
          if (value == true) {
            setState(() {
              textTileColor = white;
            });
          } else {
            setState(() {
              textTileColor = primaryOrange;
            });
          }
        },
        child: SizedBox(
          child: ListTile(
            title: Text(
              widget.text.toString(),
              style: primaryTextStyle.copyWith(
                fontWeight: regular,
                color: textTileColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
