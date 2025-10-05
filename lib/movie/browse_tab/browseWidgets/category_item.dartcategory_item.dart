import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final dynamic categoriesNameList;
  final int index;

  CategoryItem({
    super.key,
    required this.categoriesNameList,
    required this.index,
  });

  final List<String> img = [
    'assets/images/action_image.png',
    'assets/images/adventure.png',
    'assets/images/animation.png',
    'assets/images/comedy.png',
    'assets/images/crime.png',
    'assets/images/documentary.png',
    'assets/images/drama.png',
    'assets/images/family.png',
    'assets/images/fantasy.png',
    'assets/images/history.png',
    'assets/images/horror.png',
    'assets/images/music.png',
    'assets/images/mystery.png',
    'assets/images/romance.png',
    'assets/images/science_fiction.png',
    'assets/images/tv.png',
    'assets/images/thriller.png',
    'assets/images/war.png',
    'assets/images/western.png',
  ];

  final String defaultImg = 'assets/images/default_backgroung_image.png';

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(widget.img[widget.index], errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset(widget.defaultImg,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity);
        }, fit: BoxFit.fill, width: double.infinity, height: double.infinity),
        Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 50,
          child: Text(
            widget.categoriesNameList[widget.index].name ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
