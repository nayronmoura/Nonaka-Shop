import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonaka_shop/app/common/models/itens_model.dart';
import 'package:nonaka_shop/app/common/services/shop_service.dart';
import 'package:nonaka_shop/app/widgets/cart_itens/widget/cart_itens_widget.dart';

class CartScreen extends StatelessWidget {
  final ShopService shopService;

  const CartScreen({Key? key, required this.shopService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: GoogleFonts.inter(
            fontSize: height * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: StreamBuilder<Object>(
            stream: shopService.streamGetItens(),
            builder: (context, snapshot) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  ItensModel itensModel = shopService.itensList[index];
                  return CartItensWidget(
                    item: itensModel,
                    shopService: shopService,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: shopService.itensList.length,
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          try {
            shopService.buyItens();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Compra realizada com sucesso!'),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.toString()),
              ),
            );
          }
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: height * 0.05,
        ),
      ),
    );
  }
}
