// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_HomeStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$itensMenuAtom =
      Atom(name: '_HomeStoreBase.itensMenu', context: context);

  @override
  List<ItensModel> get itensMenu {
    _$itensMenuAtom.reportRead();
    return super.itensMenu;
  }

  @override
  set itensMenu(List<ItensModel> value) {
    _$itensMenuAtom.reportWrite(value, super.itensMenu, () {
      super.itensMenu = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItensMenu(List<ItensModel> value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setItensMenu');
    try {
      return super.setItensMenu(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
itensMenu: ${itensMenu}
    ''';
  }
}
