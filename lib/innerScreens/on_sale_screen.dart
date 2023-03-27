import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/OnSaleScreen';
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    final Color color = Utils(context).color;
    final size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: color,
          ),
        ),
        elevation: 4,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Products on sale",
          color: color,
          textSize: 20,
          isTitle: true,
        ),
      ),
      body:isEmpty ? Center(
        child: TextWidget(text: "No Products on Sale", color: color, textSize: 22,
        isTitle:true),
      ) : GridView.count(
        // crossAxisSpacing: 1,
        // mainAxisSpacing: 2,
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        childAspectRatio: size.width / (size.height * 0.45),
        children: List.generate(
          16,
          (index) {
            return const OnSaleWidget();
          },
        ),
      ),
    );
  }
}
