import 'package:flutter/material.dart';
import 'package:flutter_application_1/Examples/Animations/flip_animation.dart';

import 'Examples/EducationApp/views/splash_page.dart';
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
          primarySwatch:Colors.deepPurple,
          ),
      home:  SplashPage());
  }
}

