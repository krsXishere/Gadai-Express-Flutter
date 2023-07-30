import 'package:flutter/material.dart';
import 'package:simulasi_kredit/common/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody, tabletBody, desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileBody;
      } else if (constraints.maxWidth < tabletWidth) {
        return tabletBody;
      } else {
        return desktopBody;
      }
    });
  }
}
