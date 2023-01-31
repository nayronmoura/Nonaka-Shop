// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStoreBase, Store {
  Computed<bool>? _$hasItensComputed;

  @override
  bool get hasItens => (_$hasItensComputed ??=
          Computed<bool>(() => super.hasItens, name: '_CartStoreBase.hasItens'))
      .value;

  late final _$itensAtom = Atom(name: '_CartStoreBase.itens', context: context);

  @override
  int get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(int value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  late final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase', context: context);

  @override
  dynamic setItens(int value) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.setItens');
    try {
      return super.setItens(value);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itens: ${itens},
hasItens: ${hasItens}
    ''';
  }
}
