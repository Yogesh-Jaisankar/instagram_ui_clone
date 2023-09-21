import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram_ui/reels.dart';
import 'package:ionicons/ionicons.dart';
import 'package:instagram_ui/search.dart';

class Searching extends StatefulWidget {
  const Searching({super.key});

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  TextEditingController _searchController = TextEditingController();
  Timer? textTimer;
  int current_index = 0;

  final List<Map<String, dynamic>> gridMap = [
    {
      "images":
          "https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW92aWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW92aWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1616530940355-351fabd9524b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fG1vdmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1vdmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1512149177596-f817c7ef5d4c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1585951237313-1979e4df7385?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fG1vdmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1604975701397-6365ccbd028a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fG1vdmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "images":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    },
    {
      "images":
          "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "images":
          "https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "images":
          "https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "images":
          "https://images.unsplash.com/photo-1694618237263-814183091a49?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://plus.unsplash.com/premium_photo-1693166574231-a837494770cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
    },
    {
      "images":
          "https://images.unsplash.com/photo-1604434913269-933e81564539?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0MHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
    },
  ];

  List<String> textList = [
    'Search "Iphone"',
    'Search "Home Appliances"',
    'Search "Kitchen"',
    'Search "Sweet"',
    'Search "Cars"',
  ];

  @override
  void initState() {
    super.initState();
    textTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        current_index = ((current_index + 1) % textList.length) as int;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    textTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
          ),
          backgroundColor: Colors.black,
          title: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(12)),
            child: TextFormField(
              controller: _searchController,
              style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                  hintText: textList[current_index],
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 5, left: 25),
                  prefixIcon: Icon(
                    Ionicons.search,
                    color: Colors.white12,
                    size: 20,
                  )),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.black,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Suggestions("mehandi designs"),
                  Suggestions("virat kholi funny videos"),
                  Suggestions("adipurush"),
                  Suggestions("mehandi"),
                  Suggestions("cars"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 170,
                  crossAxisCount: 3,
                ),
                itemCount: gridMap.length,
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      child: Image.network(
                        "${gridMap.elementAt(index)['images']}",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget Suggestions(String sugg_txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 180,
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_outward,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      sugg_txt,
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
