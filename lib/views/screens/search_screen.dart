import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.query});

  final String query;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _query = widget.query;
    searchController.text = _query;
  }

  void _search(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (searchController.text.trim().isNotEmpty) {
      setState(() {
        _query = searchController.text.trim();
      });
    } else {
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.red,
        fontSize: 16.0,
        msg: 'Please enter a search query',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              word1: 'Open',
              word2: 'Wall',
              showBackButton: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: primaryColor.withOpacity(0.4), width: 2),
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        cursorColor: primaryColor,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainTextColor,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: mainTextColor,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          _search(context);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _search(context);
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        color: mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridContainer(
              key: ValueKey(_query),
              query: _query,
            ),
          ],
        ),
      ),
    );
  }
}
