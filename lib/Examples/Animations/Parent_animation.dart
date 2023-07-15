import 'package:flutter/material.dart';
class ParentDelayedAnimationPage extends StatefulWidget {
  const ParentDelayedAnimationPage({Key? key}) : super(key: key);
  @override
  State<ParentDelayedAnimationPage> createState() =>
      _ParentDelayedAnimationPageState();
}
class _ParentDelayedAnimationPageState extends State<ParentDelayedAnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> parentAnimation;
  late Animation<double> childAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    parentAnimation = Tween(begin: -0.25, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    childAnimation = Tween(begin: 20.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Transform(
                transform: Matrix4.translationValues(
                parentAnimation.value * width, 0, 0),
                child: Center(
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Container(
                        height: childAnimation.value * 2,
                        width: childAnimation.value*2,
                        decoration: const BoxDecoration(color: Colors.black),
                      );
                    },
                  ),
                )),
          ),
        );
      },
    );
  }
}
