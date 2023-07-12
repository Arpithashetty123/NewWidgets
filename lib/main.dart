import 'package:flutter/material.dart';
import 'package:flutter_application_1/Examples/pie_menu.dart';

import 'Examples/Animations/Parent_animation.dart';
import 'Examples/Animations/Transformations.dart';
import 'Examples/Animations/basics.dart';
import 'Examples/Animations/delayed.dart';
import 'Examples/Animations/valuesChange.dart';
import 'Examples/speed_dail.dart';
import 'Examples/spin_kit.dart';
void main() {
  runApp(const MyApp());
}
// Future<void> main() async {
//   await JustAudioBackground.init(
//     androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
//     androidNotificationChannelName:'Audio Playback' ,
//     androidNotificationOngoing:true ,
//   );
//   runApp(const MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          ),
      home: const ValueChangePage());
  }
}

// 