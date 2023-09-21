import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_ui/home.dart';
import 'package:instagram_ui/new_post.dart';
import 'package:instagram_ui/profile.dart';
import 'package:instagram_ui/reels.dart';
import 'package:instagram_ui/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int current_index = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int newIndex) {
          setState(() {
            current_index = newIndex;
          });
        },
        children: [
          // Replace these with your different pages/widgets
          Home(),
          Search(),
          Post(),
          Reels(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        iconSize: 25,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white60,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.black54),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.black54),
        currentIndex: current_index,
        onTap: (int newIndex) {
          setState(() {
            current_index = newIndex;
          });
          _pageController.animateToPage(
            newIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
              label: '', icon: FaIcon(FontAwesomeIcons.home)),
          BottomNavigationBarItem(
              label: '', icon: FaIcon(FontAwesomeIcons.magnifyingGlass)),
          BottomNavigationBarItem(
              label: '', icon: FaIcon(FontAwesomeIcons.squarePlus)),
          BottomNavigationBarItem(
              label: '', icon: FaIcon(FontAwesomeIcons.clapperboard)),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/dp.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
