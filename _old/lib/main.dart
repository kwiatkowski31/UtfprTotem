// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';

import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/config_controller.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:utfprtotem/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/utils/nav.dart';

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
            home: SplashScreen(),//HomePage() ,
          );
        },
      ),
    );
  }
}



///---------------------------------------------------------------------[ SPLASH ]
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  int contTimer = 0;

  @override
  void initState() {
    timerSplashScreen();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: splashScreen(),
    );
  }

  splashScreen(){
    return Container(
      width: 100.w,
      height: 100.h,
      color: Colors.white,
      child: Column(
        children: [

          Container(
            width: 100.w,
            height: 50.h,// * 0.5,
            child: Column(
              children: [
                SizedBox( height: 35.h ),
                Center( child: textoPadrao( 1, 'Totem AutoAtendimento', 0.03, FontWeight.w400, 1, Colors.grey[900] ) ),
                SizedBox( height: 3.h ),
                Center( child: textoPadrao( 1, 'Análise e Projeto de Sistemas', 0.020, FontWeight.w400, 1, Colors.grey[900] ) ),
              ]
            )
          ),

          SizedBox( height: 35.h ),

          Container(
            width: 100.w,
            height: 15.h,
            child: Center(
              child: Container(
                width: 100.w,
                height: 12.h,
                padding: EdgeInsets.only(right: 100.w * 0.35, left: 100.w * 0.35),
                child: Image.asset('assets/logo/logo_utfpr.png', width: double.infinity, fit: BoxFit.contain),
              ),
            ),
          ),

        ],
      ),
    );
  }

  timerSplashScreen() async {
    contTimer = 0;
    const oneSec = Duration(seconds: 1);

    timer = Timer.periodic(
      oneSec,
      (Timer tempo) {
        if ( contTimer > 2 ) {
          timer.cancel();
          pushReplacement( context, HomePage() );
          //dispose();
        } 
        else {
          contTimer++;
          print('timer --> $contTimer');
        }
      },
    );
  }
  
}
