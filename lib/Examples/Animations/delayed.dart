import 'package:flutter/material.dart';

class DelayedAnimationPage extends StatefulWidget {
  const DelayedAnimationPage({Key? key}) : super(key: key);

  @override
  State<DelayedAnimationPage> createState() => _DelayedAnimationPageState();
}

class _DelayedAnimationPageState extends State<DelayedAnimationPage> with SingleTickerProviderStateMixin {
  late Animation<double> animation,delayedAnimation,moreDelayedAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
     delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
  CurvedAnimation(
    parent: animationController,
    curve: Interval(0.3, 1.0, curve: Curves.fastLinearToSlowEaseIn),
  ),
);

moreDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
  CurvedAnimation(
    parent: animationController,
    curve: Interval(0.8, 1.0, curve: Curves.fastLinearToSlowEaseIn),
  ),
);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset( 0.0,-animation.value * width,),
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(height: 30),
                Transform.translate(
               offset: Offset( 0.0,-delayedAnimation.value * width,),
                  child: Text(
                    "Enter your name",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(height: 30),
                Transform.translate(
             offset: Offset( 0.0,-moreDelayedAnimation.value * width,),
                  child: Text(
                    "Click to continue",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
