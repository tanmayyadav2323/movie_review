import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/dahboard/widgets/genre_card.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_review/models/category_model.dart' as Cs;

import '../movie_detail/movie_detail_screen.dart';

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
  List<dynamic> movies = [];
  final TextEditingController textEditingController = TextEditingController();
  bool show = false;
  String _selectedOption = 'Release Date (Ascending)';

  @override
  void initState() {
    textEditingController.addListener(
      () {
        if (textEditingController.text.length == 0) {
          show = false;
        } else {
          getMovie(textEditingController.text);
          show = true;
        }
        setState(() {});
      },
    );
    getData();
  }

  getMovie(String name) async {
    movies = await movieService.searchMovie(context: context, name: name);
    setState(() {});
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
          : SingleChildScrollView(
              child: Column(
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
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: DropdownButton<String>(
                            icon: Icon(Icons.menu),
                            underline: SizedBox.shrink(),
                            dropdownColor: lightBlack,
                            items: <String>['Ascending Date', 'Descending Date']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (val) {
                              if (val == 'Ascending Date') {
                                movies.sort(
                                  (a, b) {
                                    DateTime datea = DateFormat("dd-MM-yyyy")
                                        .parse(a["releaseDate"]);
                                    DateTime dateb = DateFormat("dd-MM-yyyy")
                                        .parse(b["releaseDate"]);
                                    return dateb.compareTo(datea);
                                  },
                                );
                              } else {
                                movies.sort(
                                  (a, b) {
                                    DateTime datea = DateFormat("dd-MM-yyyy")
                                        .parse(a["releaseDate"]);
                                    DateTime dateb = DateFormat("dd-MM-yyyy")
                                        .parse(b["releaseDate"]);
                                    return datea.compareTo(dateb);
                                  },
                                );
                              }
                              setState(() {});
                            },
                          ),
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
                    Container(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: category.map((cas) {
                          return GenreCard(
                            category: cas,
                          );
                        }).toList(),
                      ),
                    ),
                  if (show)
                    Column(
                      children: movies.map((movie) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MovieDetailScreen.routename,
                              arguments: movie["_id"],
                            );
                          },
                          child: Container(
                            height: 16.h,
                            width: MediaQuery.of(context).size.width,
                            color: lightBlack,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 0),
                            margin: EdgeInsets.only(
                                top: 4.h, right: 4.w, left: 4.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                  child: Image.network(
                                    movie["photos"][0],
                                    height: 10.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 4.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Flexible(
                                          child: Text(
                                            movie["title"],
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Expanded(
                                          child: Text(
                                            movie["summary"],
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              overflow: TextOverflow.ellipsis,
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 1.h),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 2.h,
                                                color: Color(0xffF5C518),
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text((movie["rating"] ?? 0)
                                                  .toString())
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
    );
  }
}
