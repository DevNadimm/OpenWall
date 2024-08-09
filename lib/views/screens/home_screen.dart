import 'package:flutter/material.dart';
import 'package:open_wall/views/widgets/category_block.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';
import '../widgets/search_bar_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(word1: 'Open', word2: 'Wall', showBackButton: false),
            SearchBarContainer(),
            const CategoryBlock(),
            const GridContainer(),
          ],
        ),
      ),
    );
  }
}
