import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/firebase/firebase_utils.dart';
import 'package:movies_app/model/NewReleases.dart';
import 'package:movies_app/movie/custom/bookmark_icon.dart';
import 'package:movies_app/movie/home_tab/detailsScreen/movie_details_screen.dart';
import 'package:movies_app/my_theme.dart';

class WatchListTab extends StatefulWidget {
  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  late List<Movie> moviesList = [];

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    getMovies();

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        children: [
          Center(
            child: Text(
              'Watch list',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                return buildListItem(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    final movie = moviesList[index];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              navigateToMovieDetails(context, movie.id!, index);
            },
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          '${ApiConstants.imagePath}${movie.posterPath}',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return buildErrorWidget();
                          },
                        ),
                      ),
                    ),
                    BookMarkIcon(movie: movie, check: true),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.whiteColor),
                      ),
                      SizedBox(height: 15),
                      Text(
                        movie.releaseDate ?? '',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: MyTheme.whiteColor),
        ],
      ),
    );
  }

  Widget buildErrorWidget() {
    return Container(
      height: 100,
      child: Center(
        child: Icon(
          Icons.error,
          color: MyTheme.whiteColor,
        ),
      ),
    );
  }

  void navigateToMovieDetails(BuildContext context, int movieId, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          index: index,
          moviesList: moviesList,
        ),
        settings: RouteSettings(
          arguments: DetailsScreenArgs(
            movie_id: movieId,
          ),
        ),
      ),
    );
  }

  void getMovies() async {
    final list = await FirebaseUtils.getAllMoviesFromFireStore();
    setState(() {
      moviesList = list;
    });
  }
}
