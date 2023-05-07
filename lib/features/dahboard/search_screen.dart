import 'package:flutter/material.dart';
import 'package:movie_review/features/dahboard/widgets/genre_card.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_review/models/category_model.dart' as Cs;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  final MovieService movieService = MovieService();
  bool loading = true;
  late List<Cs.Category> category;
  final TextEditingController textEditingController = TextEditingController();
  bool show = false;

  @override
  void initState() {
    textEditingController.addListener(
      () {
        if (textEditingController.text.length == 0) {
          show = false;
        } else {
          show = true;
        }
        setState(() {});
      },
    );
    getData();
  }

  getData() async {
    category = await movieService.getCategoryMovies(context: context);
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: TextField(
                    controller: textEditingController,
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
                if (show == false)
                  Expanded(
                    child: Container(
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: category.map((cas) {
                          return GenreCard(
                            category: cas,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
