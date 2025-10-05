import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/movie/custom/detailsMoviePart.dart';
import 'package:movies_app/movie/custom/similar_part.dart';
import 'package:movies_app/my_theme.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.moviesList,
    required this.index,
  });

  final dynamic moviesList;
  final int index;

  @override
  Widget build(BuildContext context) {
    DetailsScreenArgs args =
        ModalRoute.of(context)?.settings.arguments as DetailsScreenArgs;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: MyTheme.blackGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        title: Text(
          '${moviesList[index].title}',
          // moviesList[index].title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                    '${ApiConstants.imagePath}${moviesList[index].posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                      height: 100,
                      child: Center(
                          child: Icon(
                        Icons.error,
                        color: MyTheme.whiteColor,
                      )));
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  moviesList[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.whiteColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 12, bottom: 16),
                child: Text(
                  moviesList[index].releaseDate,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.whiteColor),
                ),
              ),
              DetailsMoviePart(index: index, moviesList: moviesList),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: SimilarMoviesPart(
                  list: moviesList,
                  movieId: args.movie_id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsScreenArgs {
  int movie_id;

  DetailsScreenArgs({
    required this.movie_id,
  });
}
