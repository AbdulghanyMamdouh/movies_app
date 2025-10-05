import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/my_theme.dart';

class DetailsMoviePart extends StatefulWidget {
  DetailsMoviePart({required this.moviesList, required this.index});

  final List<dynamic> moviesList;
  final int index;

  @override
  State<DetailsMoviePart> createState() => _DetailsMoviePartState();
}

class _DetailsMoviePartState extends State<DetailsMoviePart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: MyTheme.searchColor,
        child: Row(
          children: [
            Image.network(
              filterQuality: FilterQuality.high,
              '${ApiConstants.imagePath}${widget.moviesList[widget.index].backdropPath}',
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.error,
                    color: MyTheme.whiteColor,
                  ),
                );
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      '${widget.moviesList[widget.index].overview}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MyTheme.whiteColor),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '${widget.moviesList[widget.index].voteAverage}/10',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: MyTheme.whiteColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
