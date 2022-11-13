// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, depend_on_referenced_packages

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:utfprtotem/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/utils/nav.dart';
import 'package:firebase_core/firebase_core.dart';


/*
 *
 * @author: Johny Oh - 2090333
 * Analise e Projeto de Sistemas - Turma de Terça-feira
 * 
 */


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlataform );

  //if(!firebase.apps.length)
  /*await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCea0cAEt5XWuin8ObpcT7ssB2t-D2tEGc",
      appId: "com.example.utfprtotem",
      messagingSenderId: "",
      projectId: "848322805731",
      databaseURL: "https://utfprtotem-default-rtdb.firebaseio.com",
    ),
  );*/

  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    
    return MultiProvider(
      providers: [
        Provider<Controller>(create: (_) => Controller()),
        //Provider<ConfigController>(create: (_) => ConfigController()),
      ],
      
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //theme: ThemeData.light(),
            home: SplashScreen(),
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

  late final DatabaseReference _databaseRef;
  late StreamSubscription<DatabaseEvent> _classSubscription; 

  

  @override
  void initState() {
    timerSplashScreen();
    
    //getClassFromFirebase();
    //getTeste();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  getClassFromFirebase() async {
    try{
      _databaseRef = FirebaseDatabase.instance.ref('teste');

      final snapShot = await _databaseRef.get();

      print('snapshot: ${snapShot.value}');
      //_classSubscription = 

    }
    catch( Error ){
      print('Error: ${Error}' );
    }
  }

  getTeste() async {
    final ref = FirebaseDatabase.instance.ref();
    
    final snapshot = await ref.child('totem').get();

    /*await ref.set({
      "name": "John",
      "age": 18,
      "address": {
        "line1": "100 Mountain View"
      }
    });*/

    await ref.set({
      "classificacoes": {
        "class1": {
          "nome": "CafeManha",
          "codClassificacao": 1
        },
        "class2": {
          "nome": "Almoco",
          "codClassificacao": 2
        },
      }
    });

    //final snapshot = await ref.get();
    if (snapshot.exists) {
        print('snapshot: ${snapshot.value}' );
    } else {
        print('No data available.');
    }
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
