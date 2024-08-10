import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_wall/views/screens/search_screen.dart';
import 'package:open_wall/views/widgets/category_block.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  void _search(BuildContext context) {
    if (searchController.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => SearchScreen(
            query: searchController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a search query'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
                word1: 'Open', word2: 'Wall', showBackButton: false),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: primaryColor.withOpacity(0.4), width: 2),
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        cursorColor: primaryColor,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainTextColor,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: mainTextColor,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          _search(context);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _search(context);
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        color: mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const CategoryBlock(),
            const GridContainer(),
          ],
        ),
      ),
    );
  }
}
