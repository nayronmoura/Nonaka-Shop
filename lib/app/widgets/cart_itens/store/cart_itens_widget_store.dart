import 'package:mobx/mobx.dart';
import 'package:nonaka_shop/app/common/services/shop_service.dart';

part 'cart_itens_widget_store.g.dart';

class CartItensWidgetStore = _CartItensWidgetStore with _$CartItensWidgetStore;

abstract class _CartItensWidgetStore with Store {

  ShopService shopService;
  int id;

  _CartItensWidgetStore({required this.shopService, required this.id, required this.quantity});

  @observable
  int quantity = 0;

  @action
  void increment() {
    quantity++;
    shopService.editQuantity(id,quantity);
  }

  @action
  void decrement() {
    quantity--;
  }
}
