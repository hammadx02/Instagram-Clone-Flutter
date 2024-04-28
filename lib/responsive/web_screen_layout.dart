import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController; // for page animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating page
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: primaryColor,
          height: 32,
        ),
        actions: [
          GestureDetector(
            onTap: () => navigationTapped(0),
            child: Image.asset(
              'assets/Home.png',
              color: _page == 0 ? primaryColor : secondaryColor,
              scale: 3.5,
            ),
          ),
          GestureDetector(
            onTap: () => navigationTapped(1),
            child: Image.asset(
              'assets/Search.png',
              color: _page == 1 ? primaryColor : secondaryColor,
              scale: 3.5,
            ),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Image.asset(
          //     'assets/Messenger.png',
          //     color: primaryColor,
          //     scale: 3.5,
          //   ),
          // ),
          GestureDetector(
            onTap: () => navigationTapped(3),
            child: Image.asset(
              'assets/Like.png',
              color: _page == 3 ? primaryColor : secondaryColor,
              scale: 3.5,
            ),
          ),
          GestureDetector(
            onTap: () => navigationTapped(2),
            child: Image.asset(
              'assets/Add.png',
              color: _page == 2 ? primaryColor : secondaryColor,
              scale: 3.5,
            ),
          ),
          GestureDetector(
            onTap: () => navigationTapped(4),
            child: Image.asset(
              'assets/User.png',
              color: _page == 4 ? primaryColor : secondaryColor,
              scale: 3.5,
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
    );
  }
}
