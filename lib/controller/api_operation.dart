import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class ApiOperation {
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
}
