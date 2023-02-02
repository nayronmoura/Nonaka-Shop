import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonaka_shop/app/common/models/itens_model.dart';
import 'package:nonaka_shop/app/common/services/shop_service.dart';
import 'package:nonaka_shop/app/widgets/cart_itens/store/cart_itens_widget_store.dart';

class CartItensWidget extends StatefulWidget {
  final ItensModel item;
  final ShopService shopService;

  const CartItensWidget(
      {Key? key, required this.item, required this.shopService})
      : super(key: key);

  @override
  State<CartItensWidget> createState() => _CartItensWidgetState();
}

class _CartItensWidgetState extends State<CartItensWidget> {
  late final CartItensWidgetStore store;

  @override
  void initState() {
    super.initState();
    store = CartItensWidgetStore(
        shopService: widget.shopService,
        id: widget.item.id,
        quantity: widget.item.quantitySelected ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      color: const Color.fromARGB(255, 74, 72, 87),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              widget.item.name,
              style: GoogleFonts.inter(
                fontSize: height * 0.02,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Observer(builder: (context) {
            return Row(
              children: [
                GestureDetector(
                  onTap: store.quantity < widget.item.quantity
                      ? () {
                          store.increment();
                        }
                      : null,
                  child: Text(
                    "+",
                    style: GoogleFonts.inter(
                        fontSize: height * 0.02,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ),
                  child: Text(
                    store.quantity.toString(),
                    style: GoogleFonts.inter(
                        fontSize: height * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: store.quantity > 0
                      ? () {
                          store.decrement();
                        }
                      : null,
                  child: Text(
                    "-",
                    style: GoogleFonts.inter(
                        fontSize: height * 0.02,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
