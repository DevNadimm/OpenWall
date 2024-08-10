import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class DownloadOperation {
  final String baseUrl = 'https://api.pexels.com/v1/';
  final String apiKey =
      'qWgEoAyVqlReasSo7qq1j1OEDyZfABBqWpot6kur1hrEu1EuNAyZNTW6';

  Future<void> downloadImage({
    required String imgUrl,
    required int id,
    required BuildContext context,
  }) async {
    String url = imgUrl;

    try {
      print('Attempting to download image from: $url');
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': apiKey,
      });

      print('Response status: ${response.statusCode}');
      print('Response body length: ${response.bodyBytes.length} bytes');

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final bytes = response.bodyBytes;
        final directory = await getExternalStorageDirectory();
        final appDirectory = Directory('${directory!.path}/appName');
        if (!await appDirectory.exists()) {
          await appDirectory.create(recursive: true);
        }
        final filePath = '${appDirectory.path}/image_$id.jpg';

        final file = File(filePath);
        await file.writeAsBytes(bytes);

        if (await file.exists()) {
          print('File saved at: $filePath');
          final snackBar = SnackBar(
            content: Row(
              children: [
                const Icon(Icons.file_download_done, color: Colors.green),
                const SizedBox(width: 10),
                Expanded(child: Text('Image downloaded: image_$id.jpg')),
              ],
            ),
            backgroundColor: Colors.black87,
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Open',
              textColor: Colors.blueAccent,
              onPressed: () {
                OpenFile.open(filePath);
              },
            ),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error: File not found after saving.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download image. Status code: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error during image download: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
