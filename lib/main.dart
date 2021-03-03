import 'package:flutter/material.dart';
import 'package:kredit_pensiun/launcher/launcher_view.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/provider/biaya_provider.dart';
import 'package:kredit_pensiun/provider/guna_provider.dart';
import 'package:kredit_pensiun/provider/header_provider.dart';
import 'package:kredit_pensiun/provider/pegawai_aktif_provider.dart';
import 'package:kredit_pensiun/provider/pensiunan_provider.dart';
import 'package:kredit_pensiun/provider/persyaratan_provider.dart';
import 'package:kredit_pensiun/provider/platinum_provider.dart';
import 'package:kredit_pensiun/provider/prapensiun_provider.dart';
import 'package:kredit_pensiun/provider/simulation_pensiunan_provider.dart';
import 'package:kredit_pensiun/provider/syarat_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PegawaiAktifProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PrapensiunProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PensiunanProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlatinumProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SyaratProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PersyaratanProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => GunaProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HeaderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BiayaProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SimulationPensiunanProvider(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kredit Pensiun',
            theme: new ThemeData(
                primaryColor: Colors.greenAccent,
                accentColor: Colors.greenAccent),
            home: new LauncherPage()));
  }
}
