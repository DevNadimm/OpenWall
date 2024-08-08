import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.catName, required this.imagePath});

  final String imagePath;
  final String catName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              word1: 'Open',
              word2: 'Wall',
            ),
            Stack(
              children: [
                Image.asset(
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imagePath,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.black38,
                  child: Center(
                    child: Text(
                      catName,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const GridContainer(),
          ],
        ),
      ),
    );
  }
}
