import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/NewReleases.dart';
import 'package:movies_app/movie/custom/movie_item.dart';
import 'package:movies_app/my_theme.dart';

class MoviesSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.35,
              horizontal: MediaQuery.of(context).size.width * 0.35),
          child: Column(
            children: [
              Image.asset('assets/images/icon_in_search-movies.png'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'No movies found',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      );
    }
    return FutureBuilder<MoviesResponse>(
        future: ApiManager.searchMovie(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryLight,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong in news'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try again'),
                ),
              ],
            );
          }

          if (snapshot.data?.page != 1) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try again'),
                ),
              ],
            );
          }
          return buildSuggestions(context);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.35,
            horizontal: MediaQuery.of(context).size.width * 0.35,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/icon_in_search-movies.png',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'No movies found',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      );
    }
    return FutureBuilder<MoviesResponse>(
      future: ApiManager.searchMovie(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryLight,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'Something went wrong in news',
                style: TextStyle(color: Colors.black),
              ),
              ElevatedButton(
                  onPressed: () {
                    // ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    // setState(() {});
                  },
                  child: Text('Try again'))
            ],
          );
        }
        if (snapshot.data?.page != 1) {
          return Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    // setState(() {});
                  },
                  child: Text('Try again'))
            ],
          );
        }
        var movieList = snapshot.data?.results ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                MovieItem(
                  // categoryid: movieList[index].id!,
                  moviesList: snapshot.data?.results ?? [],
                  itemIndex: index,
// BookMarkIcon.check = false,
// check: false,
                ),
              ],
            );
          },
          itemCount: movieList.length,
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context).copyWith(
        textTheme:
            TextTheme(titleSmall: Theme.of(context).textTheme.titleSmall),
        scaffoldBackgroundColor: MyTheme.primaryLight,
        appBarTheme: AppBarTheme(
            backgroundColor: MyTheme.searchColor,
            shape: OutlineInputBorder(borderRadius: BorderRadius.zero)));
  }
}
