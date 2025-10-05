import 'package:flutter/material.dart';
import 'package:movies_app/firebase/firebase_utils.dart';
import 'package:movies_app/model/NewReleases.dart';
import 'package:movies_app/my_theme.dart';

class BookMarkIcon extends StatefulWidget {
  final Movie movie;
  final bool check;

  BookMarkIcon({
    required this.movie,
    this.check = false,
  });

  @override
  State<BookMarkIcon> createState() => _BookMarkIconState();
}

class _BookMarkIconState extends State<BookMarkIcon> {
  late bool _isCheck;

  @override
  void initState() {
    super.initState();
    _isCheck = widget.check;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isCheck == false
          ? InkWell(
              onTap: _addToWatchList,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Icon awesome-bookmark-grey.png',
                  ),
                  Icon(
                    Icons.add,
                    color: MyTheme.whiteColor,
                  )
                ],
              ),
            )
          : InkWell(
              onTap: _removeFromWatchList,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Icon awesome-bookmark.png',
                  ),
                  Icon(
                    Icons.check,
                    color: MyTheme.whiteColor,
                  )
                ],
              ),
            ),
    );
  }

  void _addToWatchList() {
    FirebaseUtils.addMovieToFireStore(widget.movie).timeout(
      Duration(milliseconds: 500),
      onTimeout: () {
        print('Movie added successfully');
      },
    );
    setState(() {
      _isCheck = true;
    });
  }

  void _removeFromWatchList() {
    FirebaseUtils.deleteMovieFromFireStore(widget.movie, widget.movie.id!);
    setState(() {
      _isCheck = false;
    });
  }

  @override
  void dispose() {
    // Dispose any resources here
    super.dispose();
  }
}
