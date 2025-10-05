import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/NewReleases.dart';
import 'package:movies_app/movie/home_tab/recomended/recomended.dart';
import 'package:movies_app/my_theme.dart';

class SimilarMoviesPart extends StatefulWidget {
  final int movieId;
  final dynamic list;

  const SimilarMoviesPart(
      {super.key, required this.movieId, required this.list});

  @override
  State<SimilarMoviesPart> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMoviesPart> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesResponse>(
        future: ApiManager.getSimilar(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.greyColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text('something went wrong',
                        style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () {
                      // print(snapshot.error);
                      ApiManager.getSimilar(widget.movieId);
                      setState(() {});
                    },
                    child: const Text(
                      'Try again',
                    ))
              ],
            );
          }

          /// response => success / fail
          if (snapshot.data?.page != 1) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  '${snapshot.error}',
                  style: TextStyle(color: MyTheme.whiteColor),
                )),
                ElevatedButton(
                    onPressed: () {
                      // print(snapshot.error);
                      ApiManager.getSimilar(widget.list);
                      setState(() {});
                    },
                    child: const Text('Try again'))
              ],
            );
          }
          // var similarMoviesList = snapshot.data?.results ?? [];

          return RecommendedPart(
              recommendedList: snapshot.data?.results,
              snapshot: snapshot,
              titleName: 'Similar');
        });
  }
}
