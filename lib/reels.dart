import 'package:flutter/material.dart';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _PostState();
}

class _PostState extends State<Reels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Reels"),
      ),
    );
  }
}
