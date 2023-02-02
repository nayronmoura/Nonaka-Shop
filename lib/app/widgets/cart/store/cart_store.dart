
import 'package:mobx/mobx.dart';

import '../../../common/services/shop_service.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {

  ShopService shopService;

  _CartStoreBase({required this.shopService}){
      shopService.streamGetItens().listen((event) {
        setItens(event.length);
      });
  }

  @observable
  int itens = 0;

  @action
  setItens(int value) => itens = value;

  @computed
  bool get hasItens => itens>0;
}