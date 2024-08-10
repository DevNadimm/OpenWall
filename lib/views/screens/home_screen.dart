import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_wall/views/screens/search_screen.dart';
import 'package:open_wall/views/widgets/category_block.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/grid_container.dart';

class HomeScreen extends StatefulWidget {
  final RouteObserver<ModalRoute<void>> routeObserver;

  const HomeScreen({super.key, required this.routeObserver});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  void _search(BuildContext context) {
    if (searchController.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => SearchScreen(
            query: searchController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a search query'),
        ),
      );
    }
  }

  @override
  void didPopNext() {
    super.didPopNext();
    searchController.clear();
    searchFocusNode.unfocus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    widget.routeObserver.unsubscribe(this);
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
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
              showBackButton: false,
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
                        focusNode: searchFocusNode,
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
            const CategoryBlock(),
            const GridContainer(),
          ],
        ),
      ),
    );
  }
}
