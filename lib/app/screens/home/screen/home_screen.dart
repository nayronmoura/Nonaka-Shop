import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonaka_shop/app/common/models/itens_model.dart';
import 'package:nonaka_shop/app/screens/home/store/home_store.dart';
import 'package:nonaka_shop/app/widgets/cart/store/cart_store.dart';
import 'package:nonaka_shop/app/widgets/cart/widget/cart_widget.dart';
import 'package:nonaka_shop/app/widgets/itens/widget/itens_widget.dart';

import '../../../common/services/shop_service.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore store;
  final ShopService shopService;

  const HomeScreen({Key? key, required this.store, required this.shopService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nonaka Shop',
          style: GoogleFonts.inter(
            fontSize: height * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          CartWIdget(
            shopService: shopService,
          )
        ],
      ),
      body: Observer(builder: (_) {
        if (store.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          margin: EdgeInsets.only(
            top: width * 0.1,
          ),
          child: ListView.separated(
            separatorBuilder: (_, index) => SizedBox(
              height: height * 0.02,
            ),
            itemBuilder: (_, index) {
              ItensModel itensModel = store.itensMenu[index];
              return ItensWidget(
                  itensModel: itensModel, shopService: shopService);
            },
            itemCount: store.itensMenu.length,
          ),
        );
      }),
      bottomNavigationBar: Container(
        height: height * 0.06,
        color: Colors.lightGreen,
        child: Center(
          child: Text(
            "Nonaka Company",
            style: GoogleFonts.inter(
              fontSize: height * 0.02,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
