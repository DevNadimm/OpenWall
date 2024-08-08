import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';

class ApiOperator {
  final String baseUrl = 'https://api.pexels.com/v1/';
  final String apiKey =
      'qWgEoAyVqlReasSo7qq1j1OEDyZfABBqWpot6kur1hrEu1EuNAyZNTW6';

  Future<List<Images>> getImagesList({required int? pageNumber}) async {
    String url = '${baseUrl}curated?per_page=80';
    if (pageNumber != null) {
      url += '&page=$pageNumber';
    }
    List<Images> imagesList = [];
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': apiKey,
      });
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = jsonDecode(response.body);
        for (final json in jsonData["photos"] as Iterable) {
          final image = Images.fromJson(json);
          imagesList.add(image);
        }
      }
    } catch (_) {}
    return imagesList;
  }

  Future<Images> getImagesById({required int id}) async {
    String url = '${baseUrl}photos/$id';

    Images image = Images.emptyConstructor();
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = jsonDecode(response.body);
        image = Images.fromJson(jsonData);
      }
    } catch (_) {}
    return image;
  }

  Future<List<Images>> getImagesBySearch({required String query}) async {
    String url = '$baseUrl/search/?query=$query&per_page=80';
    List<Images> imagesList = [];
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': apiKey,
      });

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = jsonDecode(response.body);
        for (final json in jsonData['photos'] as Iterable) {
          final image = Images.fromJson(json);
          imagesList.add(image);
        }
      }
    } catch (_) {}
    return imagesList;
  }

  // Future<void> downloadImage({
  //   required String imgUrl,
  //   required int id,
  //   required BuildContext context,
  // }) async {
  //   String url = imgUrl;
  //
  //   try {
  //     final response = await http.get(Uri.parse(url), headers: {
  //       'Authorization': apiKey,
  //     });
  //
  //     if (response.statusCode >= 200 && response.statusCode <= 299) {
  //       final bytes = response.bodyBytes;
  //       final directory = await getApplicationDocumentsDirectory();
  //       final filePath = '${directory.path}/image_$id.jpg';
  //
  //       final file = File(filePath);
  //       await file.writeAsBytes(bytes);
  //
  //       final snackBar = SnackBar(
  //         content: Row(
  //           children: [
  //             const Icon(Icons.file_download_done, color: Colors.green),
  //             const SizedBox(width: 10),
  //             Expanded(child: Text('Image downloaded: image_$id.jpg')),
  //           ],
  //         ),
  //         backgroundColor: Colors.black87,
  //         duration: const Duration(seconds: 2),
  //         action: SnackBarAction(
  //           label: 'Open',
  //           textColor: Colors.blueAccent,
  //           onPressed: () {
  //             OpenFile.open(filePath);
  //           },
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         margin: const EdgeInsets.all(10),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //       );
  //
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Failed to download image.'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error: $e'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }
}
