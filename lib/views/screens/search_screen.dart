import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';
import '../widgets/search_bar_container.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(word1: 'Open', word2: 'Wall',),
            SearchBarContainer(),
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
