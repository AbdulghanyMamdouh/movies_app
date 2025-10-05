import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/movie/home_tab/detailsScreen/movie_details_screen.dart';
import 'package:movies_app/my_theme.dart';

class PopularSlider extends StatefulWidget {
  const PopularSlider({
    super.key,
    required this.moviesList,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  final dynamic moviesList;

  @override
  State<PopularSlider> createState() => _PopularSliderState();
}

class _PopularSliderState extends State<PopularSlider> {
  bool autoPlay = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: widget.moviesList.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: !autoPlay,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            child: Stack(alignment: Alignment.center, children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.network(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                              '${ApiConstants.imagePath}${widget.moviesList[itemIndex].posterPath}',
                              errorBuilder: (context, error, stackTrace) {
                            return Container(
                                height: 100,
                                child: Center(
                                    child: Icon(
                                  Icons.error,
                                  color: MyTheme.whiteColor,
                                )));
                          }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 130, top: 10),
                      child: Text(
                        widget.moviesList[itemIndex].title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 130, top: 10),
                      child: Text(
                        '${widget.moviesList[itemIndex].releaseDate}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                // movie_id: widget.movie_id,
                                index: itemIndex,
                                moviesList: widget.snapshot.data?.results ?? [],
                              ),
                          settings: RouteSettings(
                              arguments: DetailsScreenArgs(
                            movie_id: widget.moviesList[itemIndex].id,
                          ))),
                    );
                  },
                  child: Image.network(
                      '${ApiConstants.imagePath}${widget.moviesList[itemIndex].backdropPath}',
                      height: 180,
                      width: 120,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                    return Container(
                        height: 100,
                        child: Center(
                            child: Icon(
                          Icons.error,
                          color: MyTheme.whiteColor,
                        )));
                  }),
                ),
              ]),
              IconButton(
                  onPressed: () {
                    autoPlay = !autoPlay;
                    setState(() {});
                    print('autoplay');
                  },
                  icon: Icon(
                    Icons.play_circle_fill_rounded,
                    color: MyTheme.whiteColor,
                    size: 70,
                  ))
            ]),
          );
        },
      ),
    );
  }
}
