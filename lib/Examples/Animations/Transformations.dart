import 'package:flutter/material.dart';
class TransformationPage extends StatefulWidget {
  const TransformationPage({Key? key}) : super(key: key);
  @override
  State<TransformationPage> createState() => _TransformationPageState();
}
class _TransformationPageState extends State<TransformationPage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation transformationAni;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 5.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutQuart),
    );
    transformationAni=BorderRadiusTween(
      begin: BorderRadius.circular(200.0),
      end: BorderRadius.circular(0.0)
    ).animate(
    CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Container(
              width: animation.value,
                height: animation.value,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 135, 49, 161),
                  borderRadius: transformationAni.value
                ),
            ),
          )
        );
      },
    );
  }
}
