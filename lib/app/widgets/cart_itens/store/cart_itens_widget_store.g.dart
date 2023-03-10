// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_itens_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartItensWidgetStore on _CartItensWidgetStore, Store {
  late final _$quantityAtom =
      Atom(name: '_CartItensWidgetStore.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$_CartItensWidgetStoreActionController =
      ActionController(name: '_CartItensWidgetStore', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CartItensWidgetStoreActionController.startAction(
        name: '_CartItensWidgetStore.increment');
    try {
      return super.increment();
    } finally {
      _$_CartItensWidgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CartItensWidgetStoreActionController.startAction(
        name: '_CartItensWidgetStore.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CartItensWidgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity}
    ''';
  }
}
