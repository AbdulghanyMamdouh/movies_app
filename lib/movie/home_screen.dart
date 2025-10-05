import 'package:flutter/material.dart';
import 'package:movies_app/movie/search/movies_search_delegate.dart';
import 'package:movies_app/my_theme.dart';
// import 'package:movies/movie/search/movies_search_delegate.dart';
// import 'package:movies/my_theme.dart';
import 'browse_tab/browse_tab.dart';
import 'home_tab/home_tab.dart';
import 'search/search_tab.dart';
import 'watch_list_tab/watchList_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryLight,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyTheme.greyColor),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            const BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home_icon.png'),
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  showSearch(
                      context: context, delegate: MoviesSearchDelegate());
                },
                child: const ImageIcon(
                  AssetImage('assets/images/search_icon.png'),
                ),
              ),
              label: 'SEARCH',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/material_movie_icon.png'),
              ),
              label: 'BROWSE',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/ionic_md_bookmarks_icon.png'),
              ),
              label: 'WATCHLIST',
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];
}
