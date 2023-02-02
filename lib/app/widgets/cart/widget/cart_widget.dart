import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nonaka_shop/app/widgets/cart/store/cart_store.dart';

import '../../../common/services/shop_service.dart';

class CartWIdget extends StatefulWidget {
  final ShopService shopService;
  CartWIdget({Key? key, required this.shopService}) : super(key: key);

  @override
  State<CartWIdget> createState() => _CartWIdgetState();
}

class _CartWIdgetState extends State<CartWIdget> {
  late final CartStore cartStore;

  @override
  void initState() {
    super.initState();
    cartStore = CartStore(shopService: widget.shopService);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        height: height * 0.05,
        width: width * 0.1,
        child: GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/cart');
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: height * 0.05,
                color: Colors.white,
              ),
              Observer(
                builder: (context) {
                  return Visibility(
                    visible: true,
                    child: Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: height * 0.02,
                        width: height * 0.02,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 74, 72, 87),
                          borderRadius: BorderRadius.circular(width * 0.04),
                        ),
                        child: Center(
                          child: Text(
                            cartStore.itens.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.03,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
