import 'package:flutter/material.dart';
class MixedAnimationPage extends StatefulWidget {
  const MixedAnimationPage({Key? key}) : super(key: key);
  @override
  State<MixedAnimationPage> createState() => _MixedAnimationPageState();
}
class _MixedAnimationPageState extends State<MixedAnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation animation;//This is for postion
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    ///change the shape
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: -0.10).animate(
      CurvedAnimation(
          parent: animationController, curve: Curves.easeInOut),
    );
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
           child: Stack(
            children: [
              Center(
                child: Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Buy")),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Order"))
                      ]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                   animationController.forward();
                  },
                  onDoubleTap: () => animationController.reverse(),
                  child: Transform(
                     transform: Matrix4.translationValues(
                     0, animation.value *width, 0),
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                       child: Image.asset("assets/images/vanessa-serpas-S4fYv5LQ4_A-unsplash.jpg",
                         height: 500,
                         width: 300,),
                     ),
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
