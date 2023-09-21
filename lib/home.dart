import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:ionicons/ionicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              centerTitle: false,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Instagram",
                      style: TextStyle(
                          fontFamily: "Billabong",
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                  Icon(
                    AntIcons.downOutlined,
                    color: Colors.white,
                    size: 15,
                  )
                ],
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        print("Messages");
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.facebookMessenger,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              print("Messages");
                            },
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text(
                              "8",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ])),
              ],
              elevation: 10.0,
              automaticallyImplyLeading: false,
              expandedHeight: 50,
              floating: true,
              snap: true,
            )
          ];
        },
        // list of images for scrolling
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Column(
                      children: [
                        Stack(children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/dp.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 1,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                    child: FaIcon(
                                  FontAwesomeIcons.add,
                                  color: Colors.white,
                                  size: 15,
                                )),
                              ))
                        ]),
                        Text(
                          "Your story",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                    Stories("assets/images/p1.jpg", "https.yogesh.io"),
                    SizedBox(width: 5),
                    Stories("assets/images/p2.jpg", "_john_doe"),
                    SizedBox(width: 5),
                    Stories("assets/images/p3.jpg", "insta_365"),
                    SizedBox(width: 5),
                    Stories("assets/images/p4.jpg", "curly.devil06"),
                    SizedBox(width: 5),
                    Stories("assets/images/p5.jpg", "__popsicle__"),
                  ],
                ),
              ),
              Posts(
                0,
                "assets/images/p1.jpg",
                "John Doe",
                "assets/images/p1.jpg",
                "assets/images/p3.jpg",
                "Maddy",
                "89",
                "assets/images/p1.jpg",
                "hours",
                "5",
              ),
              Posts(
                1,
                "assets/images/p2.jpg",
                "John Doe",
                "assets/images/p2.jpg",
                "assets/images/p2.jpg",
                "Claire",
                "600",
                "assets/images/p1.jpg",
                "minutes",
                "60",
              ),
              Posts(
                2,
                "assets/images/p3.jpg",
                "John Doe",
                "assets/images/p3.jpg",
                "assets/images/p5.jpg",
                "Mclen",
                "1,200",
                "assets/images/p1.jpg",
                "minutes",
                "12",
              ),
              Posts(
                3,
                "assets/images/p4.jpg",
                "John Doe",
                "assets/images/p4.jpg",
                "assets/images/p1.jpg",
                "Kennedy",
                "1M",
                "assets/images/p2.jpg",
                "hour",
                "1",
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget Stories(String imagePath, String u_name) {
    return Column(
      children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.pink,
                    Colors.purple,
                    Colors.orange,
                  ],
                ),
                borderRadius: BorderRadius.circular(100)),
          ),
          Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]),
        Text(
          u_name,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  bool isPostLiked = false;
  bool isBottomSheetOpen = false;
  List<bool> postLikeStatus =
      List.generate(4, (_) => false); // Assuming you have 4 posts
  List<bool> postBookmarkStatus = List.generate(4, (_) => false);

  Widget Posts(
      int postIndex,
      String dp_url,
      String u_name,
      String post_url,
      String liked_dp_url,
      String liked_by,
      String likes,
      String Comment_dp_url,
      String h_m,
      String time) {
    bool isBookmarked = postBookmarkStatus[postIndex];
    return Container(
      height: 600,
      width: double.infinity,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        dp_url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    u_name,
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  // subtitle: Text(
                  //   "Phoenix Market City (Chennai)",
                  //   textScaleFactor: 0.9,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  trailing: FaIcon(
                    FontAwesomeIcons.ellipsisVertical,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )),
          Container(
            height: 360,
            width: double.infinity,
            color: Colors.grey,
            child: Image.asset(
              post_url,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black,
            height: 60,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      // Toggle like status for the specific post
                      setState(() {
                        postLikeStatus[postIndex] = !postLikeStatus[postIndex];
                      });
                    },
                    child: Icon(
                      // Update the heart icon based on like status for the specific post
                      postLikeStatus[postIndex]
                          ? Ionicons.heart
                          : Ionicons.heart_outline,
                      size: 30,
                      color:
                          postLikeStatus[postIndex] ? Colors.red : Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Ionicons.chatbubbles_outline,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Ionicons.paper_plane_outline,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      // Toggle bookmark status for the specific post
                      setState(() {
                        postBookmarkStatus[postIndex] = !isBookmarked;

                        // Open the bottom modal sheet if the bookmark icon is filled
                        if (isBookmarked) {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(26),
                                        topLeft: Radius.circular(26))),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        height: 25,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Collections",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              "New Collection",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    CollectionItems(
                                        "assets/images/p1.jpg", "Reels"),
                                    CollectionItems(
                                        "assets/images/p3.jpg", "Outfits"),
                                    CollectionItems(
                                        "assets/images/p2.jpg", "Songs"),
                                    CollectionItems(
                                        "assets/images/p4.jpg", "Funny"),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      });
                    },
                    child: _buildGradientMask(
                      isBookmarked, // Pass the filled status to apply the gradient
                      Icon(
                        // Update the bookmark icon based on bookmark status for the specific post
                        Ionicons.bookmark,
                        size: 25,
                        color:
                            isBookmarked ? Colors.white : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        liked_dp_url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    color: Colors.black,
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: 'Liked by ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: liked_by,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: likes,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' others.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 50,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        Comment_dp_url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Add Comments...",
                    style: TextStyle(color: Colors.grey.shade300),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "$time ",
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 10),
                    ),
                    TextSpan(
                      text: "$h_m ",
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 10),
                    ),
                    TextSpan(
                      text: "ago.",
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CollectionItems(String col_img_url, String col_cat) {
    return Container(
        height: 60,
        width: double.infinity,
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                col_img_url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            col_cat,
            textScaleFactor: 1.2,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          subtitle: Text(
            "Private",
            textScaleFactor: 0.9,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Ionicons.add_circle_outline,
            color: Colors.grey.shade300,
            size: 30,
          ),
        ));
  }

  Widget _buildGradientMask(bool isFilled, Widget child) {
    if (isFilled) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pink,
              Colors.purple,
              Colors.orange,
            ], // Customize your gradient colors
            stops: [0.0, 1.0, 1.0],
          ).createShader(bounds);
        },
        child: child,
      );
    } else {
      return child;
    }
  }
}
