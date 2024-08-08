import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppBarRichText extends StatelessWidget {
  const AppBarRichText({super.key, required this.word1, required this.word2});

  final String word1;
  final String word2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
    );
  }
}
