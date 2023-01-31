
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {



  _CartStoreBase(){

  }
  @observable
  int itens = 0;

  @action
  setItens(int value) => itens = value;

  @computed
  bool get hasItens => itens>0;
}