import 'package:flutter/material.dart';
//ignore: must_be_immutable
class VideoPage extends StatelessWidget {
  VideoPage({
    super.key,
  });
  List<String> videoInfo = [
    "Introduction Flutter",
    "installing flutter on Windows",
    "SetUp Emulator on windows",
    "Creating our First App"
  ];
  bool isVideoSelected=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  size: 40,
                ),
                color: Colors.deepPurple,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 15, left: 5),
                child: Text(videoInfo[index]),
              ),
              titleTextStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black),
              subtitle: const Padding(
                padding: EdgeInsets.only(left: 5),
                child:  Text("20 min 50 sec"),
              ),
            );
          },
        ),
      
    );
  }
}
