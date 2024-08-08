import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.word1, required this.word2});

  final String word1;
  final String word2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: word1,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: mainTextColor,
                ),
              ),
              TextSpan(
                text: word2,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
