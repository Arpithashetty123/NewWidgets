import 'package:flutter/material.dart';
class AnimationPage extends StatefulWidget {
const AnimationPage({super.key});
  @override
  State<AnimationPage> createState() => _AnimationPageState();
}
class _AnimationPageState extends State<AnimationPage>with SingleTickerProviderStateMixin {
late Animation animation;
late AnimationController animationController;
  @override
  void initState() {
   animationController=AnimationController(vsync: this,duration:const Duration(seconds: 3));
    super.initState();
    //Tween is to give the input and output range of the animation
    animation=Tween(begin:-1.0,end:0.0).animate(
    CurvedAnimation(
    parent: animationController,
    curve: Curves.fastLinearToSlowEaseIn,));
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
     //final double height=MediaQuery.of(context).size.height;
    return AnimatedBuilder(
    animation: animationController,
       builder: (context, child) {
         return Scaffold(
          body: Transform(
            //animation.value it will range from 0.0 to 1.0
           transform: Matrix4.translationValues(animation.value*width, 0, 0),
          
            child: Container(
              margin: const EdgeInsets.only(left: 40,top: 40),
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.black
              ),
                child: 
                Transform(
                  transform:Matrix4.translationValues(animation.value*width, 0, 0) ,
                  child: const Center(
                    child: Text("Welcome",
                    style: TextStyle(fontSize: 20,color: Colors.white),
                    )),
                )
                  )),
         );
       },);
  }
}