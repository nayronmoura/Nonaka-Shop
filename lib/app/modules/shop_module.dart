import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nonaka_shop/app/screens/home/home_screen.dart';

class ShopModule extends Module {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (BuildContext context, _) => const HomeScreen())
  ];

}