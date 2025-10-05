import 'package:flutter/material.dart';
import 'package:movies_app/movie/search/movies_search_delegate.dart';
import 'package:movies_app/my_theme.dart';

class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.12,
              horizontal: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showSearch(
                      context: context, delegate: MoviesSearchDelegate());
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: MyTheme.searchColor,
                    shape: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: MyTheme.yellowColor)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'SEARCH FOR A MOVIE',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: MyTheme.whiteColor,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Image.asset('assets/images/icon_in_search-movies.png'),
            ],
          ),
        ),
      ),
    );
  }
}
