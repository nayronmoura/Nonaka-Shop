import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nonaka_shop/app/widgets/cart/store/cart_store.dart';

class CartWIdget extends StatelessWidget {
  final CartStore store = CartStore();
  CartWIdget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.05,
      width: width * 0.1,
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: height * 0.05,
              color: const Color.fromARGB(255, 74, 72, 87),
            ),
            Observer(
              builder: (context) {
                return Visibility(
                  visible: store.hasItens,
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
                          store.itens.toString(),
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
    );
  }
}
