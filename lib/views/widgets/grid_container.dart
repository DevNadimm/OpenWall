import 'package:flutter/material.dart';
import 'package:open_wall/views/constants/app_colors.dart';
import 'package:open_wall/models/model.dart';
import '../../controller/api_operation.dart';

class GridContainer extends StatefulWidget {
  const GridContainer({super.key});

  @override
  _GridContainerState createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  final ApiOperation _apiOperation = ApiOperation();
  final List<Images> _imagesList = [];
  bool _isLoading = true;
  bool _isFetchingMore = false;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    setState(() {
      _isLoading = true;
    });
    final images = await _apiOperation.getImagesList(pageNumber: _currentPage);
    setState(() {
      _imagesList.addAll(images);
      _isLoading = false;
    });
  }

  Future<void> _fetchMoreImages() async {
    if (_isFetchingMore) return;
    setState(() {
      _isFetchingMore = true;
      _currentPage++;
    });
    final images = await _apiOperation.getImagesList(pageNumber: _currentPage);
    setState(() {
      _imagesList.addAll(images);
      _isFetchingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _imagesList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!_isFetchingMore &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
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
            childAspectRatio: 0.6,
          ),
          itemCount: _imagesList.length,
          itemBuilder: (context, index) {
            final image = _imagesList[index];
            return Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(image.imagePortraitUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
