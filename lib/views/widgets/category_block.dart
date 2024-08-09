import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_wall/views/constants/app_colors.dart';
import 'package:open_wall/views/screens/category_screen.dart';

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({super.key});

  static const List<Map<String, String>> categoryBlockList = [
    {
      'name': 'Cars',
      'imgPath': 'assets/category_image/cars.jpg'
    },
    {
      'name': 'Mountains',
      'imgPath': 'assets/category_image/mountains.jpg'
    },
    {
      'name': 'Forests',
      'imgPath': 'assets/category_image/forests.jpg'
    },
    {
      'name': 'Cities',
      'imgPath': 'assets/category_image/cities.jpg'
    },
    {
      'name': 'Flowers',
      'imgPath': 'assets/category_image/flowers.jpg'
    },
    {
      'name': 'Bikes',
      'imgPath': 'assets/category_image/bikes.jpg'
    },
    {
      'name': 'Beaches',
      'imgPath': 'assets/category_image/beaches.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryBlockList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => CategoryScreen(
                      catName: categoryBlockList[index]['name']!,
                      imagePath: categoryBlockList[index]['imgPath']!,
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: 90,
                height: 50,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        color: primaryColor,
                        image: DecorationImage(
                          image: AssetImage(
                            categoryBlockList[index]['imgPath']!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.black26,
                      ),
                    ),
                    Center(
                      child: Text(
                        categoryBlockList[index]['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black26,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
