import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "__curly_devil__",
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              AntIcons.downOutlined,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.video,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  print("Messages");
                },
              )),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.penToSquare,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  print("Bottom Modal Sheet");
                },
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.search,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Messages",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Requests",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            buildChatItem(
                "https.yogesh.io", "3+ new messages", "assets/images/dp.jpg"),
            buildChatItem(
                "_curly.devil05", "Yoo wassup?", "assets/images/p1.jpg"),
            buildChatItem(
                "Stephen_writ 💜", "sent 8h ago", "assets/images/p2.jpg"),
            buildChatItem("John_Evem__", "sent 1h ago", "assets/images/p3.jpg"),
            buildChatItem(
                "Jerry Adam", "sent 32mins ago", "assets/images/p4.jpg"),
            buildChatItem("Pele_009", "sent 3h ago", "assets/images/p5.jpg"),
          ],
        ),
      ),
    );
  }

  Widget buildChatItem(String username, String subtitle, String image_path) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            image_path,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        username,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(100)),
          )
        ],
      ),
      trailing: Icon(
        Icons.camera_alt_outlined,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
