import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';
import '../widgets/search_bar_container.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(word1: 'Open', word2: 'Wall',),
            SearchBarContainer(),
            SizedBox(
              height: 10,
            ),
            GridContainer(),
          ],
        ),
      ),
    );
  }
}
