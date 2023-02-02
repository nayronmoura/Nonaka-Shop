import 'package:dio/dio.dart';
import 'package:nonaka_shop/app/common/services/api_service.dart';

import '../models/itens_model.dart';

class ShopService {
  APIService apiService;

  ShopService({required this.apiService});

  List<ItensModel> itensList = [];

  void addItens(ItensModel itens) {
    if (itensList.contains(itens)) {
      itensList.forEach((element) {
        if (element.id == itens.id) {
          element.quantitySelected += itens.quantitySelected;
        }
      });
    } else {
      itensList.add(itens);
    }
  }

  void removeItens(ItensModel itens) {
    itensList.remove(itens);
  }

  List<ItensModel> getItens() {
    return itensList;
  }

  Stream<List<ItensModel>> streamGetItens() async* {
    yield* Stream.periodic(const Duration(milliseconds: 300), (_) => itensList);
  }

  void buyItem(ItensModel item) async {
    await apiService.buyItem(item);
  }

  void buyItens() async {
    try{
    itensList.forEach((element) async {
      await apiService.buyItem(element);
      itensList.remove(element);
    });
    }on DioError catch(e){
      rethrow;
    }
  }

  void editQuantity(int id, int quantity) async {
    itensList.forEach((element) {
      if (element.id == id) {
        element.quantitySelected = quantity;
      }
    });
  }
}
