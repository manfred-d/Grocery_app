import 'package:flutter/material.dart';
// import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/categories_widget.dart';
// import 'package:grocery_app/widgets/text_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
// List of color
  final List<Color> gridColor = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.cyan,
    Colors.purpleAccent,
  ];

  // List details
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/categ/apple.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categ/Bananas.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categ/corn.png',
      'catText': 'Corn',
    },
    {
      'imgPath': 'assets/images/categ/orange.jpg',
      'catText': 'Veg',
    },
    {
      'imgPath': 'assets/images/categ/onion.jpg',
      'catText': 'Veg',
    },
    {
      'imgPath': 'assets/images/categ/green.jpeg',
      'catText': 'Veg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // final utils = Utils(context);
    // Color color = utils.color;

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: TextWidget(
      //     text: 'Categories',
      //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //     color: color,
      //     textSize: 23,
      //     isTitle: true,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(catInfo.length, (index) {
            return CategoriesWidget(
              imgPath: catInfo[index]['imgPath'],
              catText: catInfo[index]['catText'],              
              passedcolor: gridColor[index],
            );
          }),
        ),
      ),
    );
  }
}
