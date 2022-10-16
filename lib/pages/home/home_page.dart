// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print

import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/controllers/config_controller.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/pages/cardapio/cardapio_do_mes_page.dart';
import 'package:utfprtotem/pages/fazer_pedido/classificacoes_produtos_page.dart';
import 'package:utfprtotem/utils/nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color cor_A = Color(0xfffcd5a4);
  Color? cor_V = Colors.green[200];
  Color? cor_G = Colors.grey[700];

  packageInfo() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      //String appName = packageInfo.appName;
      //String packageName = packageInfo.packageName;

      //globals.versao = packageInfo.version;
      //globals.buildVer = packageInfo.buildNumber;
    });
  }


  @override
  Widget build(BuildContext context) {
    final controller        = Provider.of<Controller>( context );
    final configController  = Provider.of<ConfigController>( context );

    return Scaffold(

      resizeToAvoidBottomInset: false,
      //appBar: _appBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
            ? _body( 100.h, 100.w, controller, configController )
            : _body( 100.w, 100.h, controller, configController );
        }
      )
      //_body(),
      //bottomNavigationBar: _bottomMenuItems()

    );
  }

  /*_appBar(){
    return AppBar(
      iconTheme: IconThemeData( color: cor_G, size: 100.h * 0.05 ),
      titleSpacing: 0,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }*/

  _body( height, width, controller, configController ){
    return Container(
      width: 100.h,
      height: 100.h,

      color: Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          GenericButton(
            height: 10.h, 
            width: 80.w, 
            fontSize: 0.03,
            background: Colors.white, 
            title: 'Cardapio do Mês', 
            fontColor: Colors.black,
            onPressed: () {
              print('Clicou em Cardapio do Mes!');
              push( context, CardapioDoMesPage() );
            }
          ),

          SizedBox( height: 5.h ),

          GenericButton(
            height: 10.h, 
            width: 80.w, 
            fontSize: 0.03,
            background: Colors.white, 
            title: 'Fazer meu Pedido', 
            fontColor: Colors.black,
            onPressed: () {
              print('Clicou em Fazer meu Pedido!');
              push( context, ClassificacoesProdutosPage() );
            }
          ),

        ],
      )
    );
  }


}