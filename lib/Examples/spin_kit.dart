import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SpinKitPage extends StatelessWidget {
const SpinKitPage({super.key});
  @override
  Widget build(BuildContext context) {
   double size =60;
    return Scaffold(
    body:GridView.count(
       crossAxisSpacing: 5,
       mainAxisSpacing: 10,
       crossAxisCount: 3,
        children:   [
          SpinKitChasingDots(
            size: size,
            color: const Color.fromARGB(255, 10, 10, 198),
          ),
          SpinKitCircle(
            size: size,
            color: Colors.black,
          ),
          SpinKitDancingSquare(
            size: size,
            color: Colors.purple),
          SpinKitDoubleBounce(
            size: size,
            color: Colors.pink,
          ),
          SpinKitFadingGrid(
            size: size,
            color: const Color.fromARGB(255, 0, 102, 255),
          ),
          SpinKitWanderingCubes(
            color: Colors.teal,
            size: size,
          ),
          SpinKitHourGlass(
            size: size,
            color: Colors.red
            ),
          SpinKitDualRing(
            size: size,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}