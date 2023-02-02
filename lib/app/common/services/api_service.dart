import 'package:dio/dio.dart';

import '../models/itens_model.dart';

class APIService {
  String url =
      'https://us-central1-inventory-ts-firestore.cloudfunctions.net/api/';

  Future<List<ItensModel>> getItens() async {
    var response = await Dio().get("${url}show/222");
    return (response.data as List).map((e) => ItensModel.fromJson(e)).toList();
  }

  Future<void> buyItem(ItensModel itensModel) async {
    try {
      await Dio().post("show/222/buy_item/${itensModel.id}");
    } on DioError catch (e) {
      throw e.error;
    }
  }
}