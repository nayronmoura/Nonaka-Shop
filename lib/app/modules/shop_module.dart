import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nonaka_shop/app/screens/cart/screen/cart_screen.dart';
import 'package:nonaka_shop/app/screens/home/screen/home_screen.dart';

import '../screens/home/store/home_store.dart';

class ShopModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => HomeStore(
            apiService: i.get(),
          ),
        )
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (BuildContext context, _) => HomeScreen(
            store: Modular.get(),
            shopService: Modular.get(),
          ),
        ),
        ChildRoute(
          '/cart',
          child: (BuildContext context, _) => CartScreen(
            shopService: Modular.get(),
          ),
        )
      ];
}
