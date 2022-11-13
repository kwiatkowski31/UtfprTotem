// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$mesaAtom = Atom(name: 'ControllerBase.mesa', context: context);

  @override
  int get mesa {
    _$mesaAtom.reportRead();
    return super.mesa;
  }

  @override
  set mesa(int value) {
    _$mesaAtom.reportWrite(value, super.mesa, () {
      super.mesa = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  void setEmail(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setEmail');
    try {
      return super.setEmail(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alteraMesa(dynamic value) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.alteraMesa');
    try {
      return super.alteraMesa(value);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mesa: ${mesa}
    ''';
  }
}
