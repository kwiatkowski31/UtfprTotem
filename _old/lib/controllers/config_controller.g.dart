// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfigController on ConfigControllerBase, Store {
  late final _$temaClaroSelecionadoAtom =
      Atom(name: 'ConfigControllerBase.temaClaroSelecionado', context: context);

  @override
  bool get temaClaroSelecionado {
    _$temaClaroSelecionadoAtom.reportRead();
    return super.temaClaroSelecionado;
  }

  @override
  set temaClaroSelecionado(bool value) {
    _$temaClaroSelecionadoAtom.reportWrite(value, super.temaClaroSelecionado,
        () {
      super.temaClaroSelecionado = value;
    });
  }

  late final _$temaEscuroSelecionadoAtom = Atom(
      name: 'ConfigControllerBase.temaEscuroSelecionado', context: context);

  @override
  bool get temaEscuroSelecionado {
    _$temaEscuroSelecionadoAtom.reportRead();
    return super.temaEscuroSelecionado;
  }

  @override
  set temaEscuroSelecionado(bool value) {
    _$temaEscuroSelecionadoAtom.reportWrite(value, super.temaEscuroSelecionado,
        () {
      super.temaEscuroSelecionado = value;
    });
  }

  late final _$temaCustomSelecionadoAtom = Atom(
      name: 'ConfigControllerBase.temaCustomSelecionado', context: context);

  @override
  bool get temaCustomSelecionado {
    _$temaCustomSelecionadoAtom.reportRead();
    return super.temaCustomSelecionado;
  }

  @override
  set temaCustomSelecionado(bool value) {
    _$temaCustomSelecionadoAtom.reportWrite(value, super.temaCustomSelecionado,
        () {
      super.temaCustomSelecionado = value;
    });
  }

  late final _$tipoArmazenamentoAtom =
      Atom(name: 'ConfigControllerBase.tipoArmazenamento', context: context);

  @override
  int get tipoArmazenamento {
    _$tipoArmazenamentoAtom.reportRead();
    return super.tipoArmazenamento;
  }

  @override
  set tipoArmazenamento(int value) {
    _$tipoArmazenamentoAtom.reportWrite(value, super.tipoArmazenamento, () {
      super.tipoArmazenamento = value;
    });
  }

  late final _$tipoArmzLocalAtom =
      Atom(name: 'ConfigControllerBase.tipoArmzLocal', context: context);

  @override
  bool get tipoArmzLocal {
    _$tipoArmzLocalAtom.reportRead();
    return super.tipoArmzLocal;
  }

  @override
  set tipoArmzLocal(bool value) {
    _$tipoArmzLocalAtom.reportWrite(value, super.tipoArmzLocal, () {
      super.tipoArmzLocal = value;
    });
  }

  late final _$tipoArmzWebServiceAtom =
      Atom(name: 'ConfigControllerBase.tipoArmzWebService', context: context);

  @override
  bool get tipoArmzWebService {
    _$tipoArmzWebServiceAtom.reportRead();
    return super.tipoArmzWebService;
  }

  @override
  set tipoArmzWebService(bool value) {
    _$tipoArmzWebServiceAtom.reportWrite(value, super.tipoArmzWebService, () {
      super.tipoArmzWebService = value;
    });
  }

  late final _$ConfigControllerBaseActionController =
      ActionController(name: 'ConfigControllerBase', context: context);

  @override
  void setTemaClaro(dynamic value) {
    final _$actionInfo = _$ConfigControllerBaseActionController.startAction(
        name: 'ConfigControllerBase.setTemaClaro');
    try {
      return super.setTemaClaro(value);
    } finally {
      _$ConfigControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTemaEscuro(dynamic value) {
    final _$actionInfo = _$ConfigControllerBaseActionController.startAction(
        name: 'ConfigControllerBase.setTemaEscuro');
    try {
      return super.setTemaEscuro(value);
    } finally {
      _$ConfigControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTemaCustom(dynamic value) {
    final _$actionInfo = _$ConfigControllerBaseActionController.startAction(
        name: 'ConfigControllerBase.setTemaCustom');
    try {
      return super.setTemaCustom(value);
    } finally {
      _$ConfigControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArmazenamento(dynamic value) {
    final _$actionInfo = _$ConfigControllerBaseActionController.startAction(
        name: 'ConfigControllerBase.setArmazenamento');
    try {
      return super.setArmazenamento(value);
    } finally {
      _$ConfigControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArmzLocal(dynamic value) {
    final _$actionInfo = _$ConfigControllerBaseActionController.startAction(
        name: 'ConfigControllerBase.setArmzLocal');
    try {
      return super.setArmzLocal(value);
    } finally {
      _$ConfigControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArmzWebService(dynamic value) {
    final _$actionInfo = _$ConfigControllerBaseActionController.startAction(
        name: 'ConfigControllerBase.setArmzWebService');
    try {
      return super.setArmzWebService(value);
    } finally {
      _$ConfigControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
temaClaroSelecionado: ${temaClaroSelecionado},
temaEscuroSelecionado: ${temaEscuroSelecionado},
temaCustomSelecionado: ${temaCustomSelecionado},
tipoArmazenamento: ${tipoArmazenamento},
tipoArmzLocal: ${tipoArmzLocal},
tipoArmzWebService: ${tipoArmzWebService}
    ''';
  }
}
