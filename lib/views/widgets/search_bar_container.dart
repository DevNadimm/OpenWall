import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_wall/views/constants/app_colors.dart';
import 'package:open_wall/views/screens/search_screen.dart';

class SearchBarContainer extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor.withOpacity(0.4), width: 2),
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
              ),
            ),
            IconButton(
              onPressed: () {
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
              },
              icon: const Icon(
                Icons.search_rounded,
                color: mainTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}