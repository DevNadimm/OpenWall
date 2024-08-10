import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.word1,
    required this.word2,
    this.showBackButton = false,
  });

  final String word1;
  final String word2;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 50,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
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
          if (showBackButton)
            Positioned(
              left: 0,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  CupertinoIcons.back,
                  color: mainTextColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
