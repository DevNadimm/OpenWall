import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class WallpaperOperation {
  final String apiKey =
      'qWgEoAyVqlReasSo7qq1j1OEDyZfABBqWpot6kur1hrEu1EuNAyZNTW6';

  Future<void> setWallpaper({
    required String imgUrl,
    required Function onSuccess,
    required Function(String) onError,
    bool homeScreen = true,
    bool lockScreen = false,
    required BuildContext context,
  }) async {
    try {
      final filePath = await _downloadImage(imgUrl);

      if (filePath != null) {
        await _applyWallpaper(filePath, homeScreen, lockScreen);
        onSuccess();
      } else {
        onError('Error: File not found after saving.');
      }
    } catch (e) {
      onError('Error occurred while setting wallpaper: $e');
    }
  }

  Future<String?> _downloadImage(String imgUrl) async {
    try {
      final response = await http.get(Uri.parse(imgUrl), headers: {
        'Authorization': apiKey,
      });

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final bytes = response.bodyBytes;
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/temp_wallpaper.jpg';
        final file = File(filePath);
        await file.writeAsBytes(bytes);

        if (await file.exists()) {
          return filePath;
        }
      }
    } catch (e) {
      print('Error during image download: $e');
    }
    return null;
  }

  Future<void> _applyWallpaper(
      String filePath, bool homeScreen, bool lockScreen) async {
    try {
      if (homeScreen) {
        await WallpaperManager.setWallpaperFromFile(
            filePath, WallpaperManager.HOME_SCREEN);
      }
      if (lockScreen) {
        await WallpaperManager.setWallpaperFromFile(
            filePath, WallpaperManager.LOCK_SCREEN);
      }
    } catch (e) {
      print('Error during wallpaper application: $e');
    }
  }
}
