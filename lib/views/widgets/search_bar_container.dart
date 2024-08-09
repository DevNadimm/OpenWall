import 'package:flutter/material.dart';
import 'package:open_wall/views/constants/app_colors.dart';

class SearchBarContainer extends StatelessWidget {
  SearchBarContainer({super.key});

  TextEditingController searchController = TextEditingController();

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
              onPressed: () {},
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