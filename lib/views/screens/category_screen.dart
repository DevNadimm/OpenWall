import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/app_bar_rich_text.dart';
import '../widgets/grid_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRichText(
          word1: 'Open',
          word2: 'Wall',
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                'https://images.pexels.com/photos/672451/pexels-photo-672451.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black38,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Mountains",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )
                  ],
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
    );
  }
}
