import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;
//flutter pub run build_runner build

//flutter pub run build_runner watch ~> Monitora e atualiza os Controllers (Obs: Executo ele sempre que abrir o projeto)

abstract class ControllerBase with Store{

  @observable
  int mesa = 0;

  @action
  void setEmail(valor) => mesa = valor;


  @action
  alteraMesa( value ){
    mesa = value;
  }

}

/*@observable
  int contador = 0;

  @action
  incrementar(){
    contador++;
  }*/