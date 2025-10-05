import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/Categories.dart';
import 'package:movies_app/movie/browse_tab/browseWidgets/category_item.dartcategory_item.dart';
import 'package:movies_app/movie/browse_tab/category_datails.dart';
import 'package:movies_app/my_theme.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.width * 0.1),
          child: Text(
            'Browse Category',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: FutureBuilder<Categories>(
            future: ApiManager.getNameOfCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.greyColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.3,
                      vertical: MediaQuery.of(context).size.height * 0.4),
                  child: Column(
                    children: [
                      Text(
                        'Something went wrong',
                        style: TextStyle(color: MyTheme.whiteColor),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // print(snapshot.error);
                          ApiManager.getNameOfCategory();
                          setState(() {});
                        },
                        child: Text('Try again'),
                      ),
                    ],
                  ),
                );
              }

              /// response => ok-error
              if (snapshot.data?.genres == []) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: MediaQuery.of(context).size.height * 0.4),
                  child: Column(
                    children: [
                      Text(
                        'Errorrr',
                        style: TextStyle(color: MyTheme.whiteColor),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(snapshot.error);
                          ApiManager.getNameOfCategory();
                          setState(() {});
                        },
                        child: Text('Try again'),
                      ),
                    ],
                  ),
                );
              }
              var categoriesList = snapshot.data?.genres ?? [];
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategortDetails(
                                      categoriesList: categoriesList,
                                      index: index,
                                    ),
                                settings: RouteSettings(
                                    arguments: CategortDetailsArgs(
                                        categoryId:
                                            categoriesList[index].id!))),
                          );
                        },
                        child: CategoryItem(
                            categoriesNameList: categoriesList, index: index));
                  },
                  itemCount: categoriesList.length,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
