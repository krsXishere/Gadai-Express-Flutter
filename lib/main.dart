import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simulasi_kredit/pages/barang_page.dart';
import 'package:provider/provider.dart';
import 'package:simulasi_kredit/providers/barang_provider.dart';
import 'package:simulasi_kredit/providers/kategori_provider.dart';
import 'package:simulasi_kredit/providers/merk_provider.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BarangProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KategoriProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MerkProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BarangPage(),
      ),
    );
  }
}
