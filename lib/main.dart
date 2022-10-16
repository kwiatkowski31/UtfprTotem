// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:utfprtotem/controllers/config_controller.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:utfprtotem/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    
    return MultiProvider(
      providers: [
        Provider<Controller>(create: (_) => Controller()),
        Provider<ConfigController>(create: (_) => ConfigController()),
      ],
      
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //theme: ThemeData.light(),
            home: HomePage() ,
          );
        },
      ),
    );
  }
}