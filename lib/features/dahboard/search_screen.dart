import 'package:flutter/material.dart';
import 'package:movie_review/features/dahboard/widgets/genre_card.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: TextField(
              // controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Color(0XFFb4b4b4),
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: const Color(0XFFf5c518),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0XFF202020),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h),
                children: const [
                  GenreCard(
                      title: 'Action',
                      imageUrl: 'https://picsum.photos/500/300'),
                  GenreCard(
                      title: 'Horror',
                      imageUrl: 'https://picsum.photos/500/300'),
                  GenreCard(
                      title: 'efasd',
                      imageUrl: 'https://picsum.photos/500/300'),
                  GenreCard(
                      title: '4tgwrfd',
                      imageUrl: 'https://picsum.photos/500/300'),
                  GenreCard(
                      title: 'ytrdfes',
                      imageUrl: 'https://picsum.photos/500/300'),
                  GenreCard(
                      title: 'Actiefson',
                      imageUrl: 'https://picsum.photos/500/300')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
