import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/movie/custom/bookmark_icon.dart';
import 'package:movies_app/movie/home_tab/detailsScreen/movie_details_screen.dart';
import 'package:movies_app/my_theme.dart';

class NewReleasesPart extends StatefulWidget {
  const NewReleasesPart({
    super.key,
    required this.releasesList,
    required this.snapshot,
  });

  final dynamic releasesList;
  final AsyncSnapshot snapshot;
  final bool check = false;

  @override
  State<NewReleasesPart> createState() => _NewReleasesPartState();
}

class _NewReleasesPartState extends State<NewReleasesPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: MyTheme.searchColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10),
            child: Text(
              'New Releases ',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            //todo: show releases information
            child: ListView.builder(
              itemCount: widget.releasesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      // todo:adjust the size of the images
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Padding(
                        //todo: space among every item in the new release
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
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
                                    movie_id: widget.releasesList[index].id,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "${ApiConstants.imagePath}${widget.releasesList[index].posterPath}",
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox(
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
                              BookMarkIcon(
                                movie: widget.releasesList[index],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
