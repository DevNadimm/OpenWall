import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_wall/views/constants/app_colors.dart';
import 'package:open_wall/models/model.dart';
import '../../controller/api_operation.dart';
import '../screens/wallpaper_preview.dart';

class GridContainer extends StatefulWidget {
  final String? query;

  const GridContainer({super.key, this.query});

  @override
  _GridContainerState createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  final ApiOperation _apiOperation = ApiOperation();
  List<Images> _imagesList = [];
  bool _isFetchingMore = false;
  int _currentPage = 1;
  Future<List<Images>>? _future;

  @override
  void initState() {
    super.initState();
    _future = _fetchImages();
  }

  Future<List<Images>> _fetchImages() async {
    try {
      if (widget.query != null) {
        return await _apiOperation.getImagesBySearch(query: widget.query!);
      } else {
        return await _apiOperation.getImagesList(pageNumber: _currentPage);
      }
    } catch (e) {
      throw Exception('Failed to load images: $e');
    }
  }

  void _fetchMoreImages() async {
    if (!_isFetchingMore) {
      _isFetchingMore = true;
      try {
        _currentPage++;
        if (widget.query != null) {
          final moreImages =
              await _apiOperation.getImagesBySearch(query: widget.query!);
          setState(() {
            _imagesList.addAll(moreImages);
          });
        } else {
          final moreImages =
              await _apiOperation.getImagesList(pageNumber: _currentPage);
          setState(() {
            _imagesList.addAll(moreImages);
          });
        }
      } catch (e) {
        print('Error fetching more images: $e');
      } finally {
        _isFetchingMore = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          if (snapshot.hasData) {
            final newImages = snapshot.data!;
            for (final image in newImages) {
              if (!_imagesList.contains(image)) {
                _imagesList.add(image);
              }
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!_isFetchingMore &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _fetchMoreImages();
                }
                return true;
              },
              child: GridView.builder(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.55,
                ),
                itemCount: _imagesList.length,
                itemBuilder: (context, index) {
                  final image = _imagesList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => WallpaperPreview(
                            imageOriginalUrl: image.imageOriginalUrl,
                            imagePortraitUrl: image.imagePortraitUrl,
                            imageId: image.imageId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors[index % colors.length],
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(image.imagePortraitUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong! ${snapshot.error}'),
            );
          }

          return const Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }
}
