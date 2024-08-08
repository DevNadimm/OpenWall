import 'package:flutter/material.dart';
import 'package:open_wall/views/constants/app_colors.dart';
import 'package:open_wall/views/widgets/category_block.dart';
import '../widgets/app_bar_rich_text.dart';
import '../widgets/grid_container.dart';
import '../widgets/search_bar_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: const Column(
        children: [
          SearchBarContainer(),
          CategoryBlock(),
          GridContainer(),
        ],
      ),
    );
  }
}