import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonaka_shop/app/common/models/itens_model.dart';
import 'package:nonaka_shop/app/common/services/shop_service.dart';
import 'package:nonaka_shop/app/widgets/dialog/widget/dialog_widget.dart';

class ItensWidget extends StatelessWidget {
  final ItensModel itensModel;
  final ShopService shopService;

  const ItensWidget(
      {Key? key, required this.itensModel, required this.shopService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      color: const Color.fromARGB(255, 74, 72, 87),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${itensModel.id} - ${itensModel.name}",
            style: GoogleFonts.inter(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => DialogWidget(
                        itensModel: itensModel, shopService: shopService));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
