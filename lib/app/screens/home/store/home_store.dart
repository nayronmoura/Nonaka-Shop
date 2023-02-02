import 'package:mobx/mobx.dart';
import 'package:nonaka_shop/app/common/models/itens_model.dart';

import '../../../common/services/api_service.dart';

part 'home_store.g.dart';


class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  APIService apiService;
  _HomeStoreBase({required this.apiService}){
    setLoading(true);
    apiService.getItens().then((value) {
      setItensMenu(value);
      setLoading(false);
    });
  }


  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  List<ItensModel> itensMenu = [];


  @action
  void setItensMenu(List<ItensModel> value) => itensMenu = value;



}