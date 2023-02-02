import 'package:flutter_modular/flutter_modular.dart';
import 'package:nonaka_shop/app/common/services/api_service.dart';

import 'common/services/shop_service.dart';
import 'modules/shop_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => APIService()),
    Bind.singleton((i) => ShopService(apiService: i.get()))
  ];

  @override
  final List<ModuleRoute> routes = [
    ModuleRoute('/', module: ShopModule()),

  ];
}