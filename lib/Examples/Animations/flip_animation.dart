import 'dart:math';
import 'package:flutter/material.dart';

class FlipAnimationPage extends StatefulWidget {
  const FlipAnimationPage({super.key});
  @override
  State<FlipAnimationPage> createState() => _FlipAnimationPageState();
}
class _FlipAnimationPageState extends State<FlipAnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation flipAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    super.initState();
    flipAnimation = Tween(begin: 0.0, end: 10.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear)));
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flip Animation"),
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Center(
            child: InkWell(
              onTap: () {
                animationController.repeat();
              },
              child: Container(
                height: 200,
                width: 200,
                color: const Color.fromARGB(255, 218, 197, 245),
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateX(2 * pi * flipAnimation.value),
                  alignment: Alignment.center,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 142, 103, 163),
                    child: const Center(
                        child: Text(
                      "This Flips",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
