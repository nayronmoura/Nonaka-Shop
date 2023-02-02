
import 'package:mobx/mobx.dart';
import 'package:nonaka_shop/app/common/services/api_service.dart';

part 'dialog_store.g.dart';

class DialogStore = _DialogStore with _$DialogStore;

abstract class _DialogStore with Store {

  APIService apiService;

  _DialogStore({required this.apiService});

  @observable
  int count = 1;

  @action
  void increment() {
    count++;
  }

  @action
  void decrement() {
    count--;
  }
}