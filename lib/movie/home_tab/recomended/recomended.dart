import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/movie/custom/bookmark_icon.dart';
import 'package:movies_app/movie/home_tab/detailsScreen/movie_details_screen.dart';
import 'package:movies_app/my_theme.dart';

class RecommendedPart extends StatefulWidget {
  const RecommendedPart(
      {super.key,
      required this.recommendedList,
      required this.snapshot,
      required this.titleName});

  final dynamic recommendedList;
  final AsyncSnapshot snapshot;
  final String titleName;

  @override
  State<RecommendedPart> createState() => _RecommendedPartState();
}

class _RecommendedPartState extends State<RecommendedPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.48,
      decoration: BoxDecoration(
        color: MyTheme.searchColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10),
            child: Text(
              widget.titleName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.recommendedList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          // color: Colors.white,
                          color: MyTheme.greyColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0.0, 2.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ]),
                      // color: MyTheme.greyColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      index: index,
                                      moviesList:
                                          widget.snapshot.data?.results ?? [],
                                    ),
                                    settings: RouteSettings(
                                      arguments: DetailsScreenArgs(
                                        movie_id:
                                            widget.recommendedList[index].id,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width: double.infinity,
                                  '${ApiConstants.imagePath}${widget.recommendedList[index].posterPath}',
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 100,
                                      child: Center(
                                        child: Icon(
                                          Icons.error,
                                          color: MyTheme.whiteColor,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            BookMarkIcon(
                              movie: widget.recommendedList[index],
                            )
                          ]),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: MyTheme.yellowColor,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                  '${widget.recommendedList[index].voteAverage}/10'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.recommendedList[index].title ?? ''),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.recommendedList[index].releaseDate ??
                              '2003'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
