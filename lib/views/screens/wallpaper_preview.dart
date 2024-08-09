import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class WallpaperPreview extends StatelessWidget {
  const WallpaperPreview({super.key, required this.imageUrl, required this.id});

  final String imageUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 60,
            child: Card(
              elevation: 5.0, // Add elevation for shadow
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: const Color(0XFFDCEDF6),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    color: mainTextColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Card(
              elevation: 5.0,
              color: const Color(0XFFDCEDF6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: (){ },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download_rounded),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
