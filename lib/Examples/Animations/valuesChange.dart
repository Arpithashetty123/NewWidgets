import 'package:flutter/material.dart';
class ValueChangePage extends StatefulWidget {
  const ValueChangePage({Key? key}) : super(key: key);
  @override
  State<ValueChangePage> createState() => _ValueChangePageState();
}
class _ValueChangePageState extends State<ValueChangePage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = IntTween(begin: 10,end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
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
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return  Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Loading.....",style: TextStyle(fontSize: 30)),
                const SizedBox(height: 20,),
                Text(animation.value.toString(),style: const TextStyle(fontSize: 50))
              ],
            )
          )
        );
      },
    );
  }
}
