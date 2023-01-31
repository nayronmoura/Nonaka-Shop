import 'package:flutter_modular/flutter_modular.dart';

import 'modules/shop_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModuleRoute> routes = [
    ModuleRoute('/', module: ShopModule()),
  ];
}