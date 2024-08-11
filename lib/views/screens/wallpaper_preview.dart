import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                    color: Colors.black,
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
        return Container(
          decoration: const BoxDecoration(
            color: Color(0XFFDCEDF6),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Set Wallpaper',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home_outlined,
                    color: mainTextColor,
                  ),
                  title: const Text(
                    'Home Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: mainTextColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _setWallpaper(context, homeScreen: true, lockScreen: false);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.lock_outline_rounded,
                    color: mainTextColor,
                  ),
                  title: const Text(
                    'Lock Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: mainTextColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _setWallpaper(context, homeScreen: false, lockScreen: true);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.mobile_friendly_rounded,
                    color: mainTextColor,
                  ),
                  title: const Text(
                    'Both Screens',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: mainTextColor,
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
        _showToast('Wallpaper set successfully', Colors.green);
      },
      onError: (message) {
        _showToast(message, Colors.red);
      },
    );
  }

  void _showToast(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: color,
      fontSize: 16.0,
    );
  }
}
