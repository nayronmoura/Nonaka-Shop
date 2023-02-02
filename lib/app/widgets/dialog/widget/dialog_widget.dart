import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/models/itens_model.dart';
import '../../../common/services/shop_service.dart';
import '../store/dialog_store.dart';

class DialogWidget extends StatelessWidget {
  final ItensModel itensModel;
  final DialogStore store = DialogStore(apiService: Modular.get());
  final ShopService shopService;

  DialogWidget({Key? key, required this.itensModel, required this.shopService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      backgroundColor: const Color.fromARGB(255, 134, 194, 139),
      title: Observer(
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "By a Item ${itensModel.id}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: height * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: Text(
                        "Do you want to buy this item?",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: Text(
                        itensModel.name,
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: width * 0.25,
                          child: Text(
                            "Quantity:",
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextButton(
                          onPressed:store.count< itensModel.quantity? () {
                            store.increment();
                          }:null,
                          child: Text(
                            "+",
                            style: GoogleFonts.inter(
                                fontSize: height * 0.03,
                                color: const Color.fromARGB(255, 74, 72, 87),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          store.count.toString(),
                          style: GoogleFonts.inter(
                              fontSize: height * 0.03,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: store.count>0 ?  () {
                            store.decrement();
                          }:null,
                          child: Text(
                            "-",
                            style: GoogleFonts.inter(
                                fontSize: height * 0.03,
                                color: const Color.fromARGB(255, 74, 72, 87),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  width: width,
                  color: Colors.lightGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () async {
                          try {
                            shopService.buyItem(itensModel);
                          } on DioError catch (e) {
                            showSnackbar(context, e.message);
                          }
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Buy Now",
                          style: GoogleFonts.inter(
                              fontSize: height * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text("or", style: GoogleFonts.inter(
                          fontSize: height * 0.015,
                          color: const Color.fromARGB(255, 74, 72, 87),
                          fontWeight: FontWeight.w600),),
                      TextButton(
                        onPressed: () {
                          itensModel.quantitySelected = store.count;
                          shopService.addItens(itensModel);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Add to cart",
                          style: GoogleFonts.inter(
                              fontSize: height * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }

  showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }
}
