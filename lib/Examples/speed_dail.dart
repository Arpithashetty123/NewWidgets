import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
          centerTitle: true,
        ),
        body: Center(
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.purple.shade300,
            child: CircleAvatar(
                radius: 28, backgroundColor: Colors.purple.shade200),
          ),
        ),
        floatingActionButton: SpeedDial(
          curve: Curves.bounceInOut,
          overlayColor: Colors.purple.shade100,
          animatedIcon: AnimatedIcons.close_menu,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.mic),
                label: "Mic",
                backgroundColor: Colors.purple.shade300),
            SpeedDialChild(
                child: const Icon(Icons.person),
                label: "Person",
                backgroundColor: Colors.purple.shade300),
            SpeedDialChild(
                child: const Icon(Icons.browse_gallery),
                label: "browse",
                backgroundColor: Colors.purple.shade300)
          ],
        ));
  }
}
