import '../models/itens_model.dart';

class ShopService{
  List<ItensModel> itensList = [];

  void addItens(ItensModel itens){
    itensList.add(itens);
  }

  void removeItens(ItensModel itens){
    itensList.remove(itens);
  }

  List<ItensModel> getItens(){
    return itensList;
  }

  Stream<List<ItensModel>> streamGetItens{
    return Stream.value(itensList);
}

}