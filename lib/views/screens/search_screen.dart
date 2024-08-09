import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';
import '../widgets/search_bar_container.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              word1: 'Open',
              word2: 'Wall',
              showBackButton: true,
            ),
            SearchBarContainer(initialQuery: query),
            const SizedBox(
              height: 10,
            ),
            GridContainer(
              searchQuery: query,
            ),
          ],
        ),
      ),
    );
  }
}
