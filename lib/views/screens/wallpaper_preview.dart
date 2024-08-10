import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_wall/controller/wallpaper_operation.dart';
import '../constants/app_colors.dart';

class WallpaperPreview extends StatelessWidget {
  final WallpaperOperation wallpaperOperation = WallpaperOperation();

  WallpaperPreview({super.key, required this.imageUrl, required this.imageId});

  final String imageUrl;
  final int imageId;

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
              elevation: 5.0,
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
                onTap: () {
                  _showWallpaperOptions(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wallpaper),
                      SizedBox(width: 4),
                      Text(
                        'Set Wallpaper',
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
          ),
        ],
      ),
    );
  }

  void _showWallpaperOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            color: backgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Set Wallpaper',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: mainTextColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: Text(
                    'Home Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: mainTextColor.withOpacity(0.9),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _setWallpaper(context, homeScreen: true, lockScreen: false);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock_outline_rounded),
                  title: Text(
                    'Lock Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: mainTextColor.withOpacity(0.9),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _setWallpaper(context, homeScreen: false, lockScreen: true);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.mobile_friendly_rounded),
                  title: Text(
                    'Both Screens',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: mainTextColor.withOpacity(0.9),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _setWallpaper(context, homeScreen: true, lockScreen: true);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _setWallpaper(BuildContext context,
      {required bool homeScreen, required bool lockScreen}) {
    wallpaperOperation.setWallpaper(
      imgUrl: imageUrl,
      context: context,
      homeScreen: homeScreen,
      lockScreen: lockScreen,
      onSuccess: () {
        _showSnackBar(context, 'Wallpaper set successfully', Colors.green);
      },
      onError: (message) {
        _showSnackBar(context, message, Colors.red);
      },
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    if (context.mounted) {
      final snackBar = SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.wallpaper,
              color: color,
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
