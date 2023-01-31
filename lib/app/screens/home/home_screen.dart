import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonaka_shop/app/widgets/cart/widget/cart_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          CartWIdget()
        ],
      ),
    );
  }
}
