import 'package:flutter/material.dart';
class AnimatingUiPage extends StatefulWidget {
  const AnimatingUiPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AnimatingUiPageState createState() => _AnimatingUiPageState();
}

class _AnimatingUiPageState extends State<AnimatingUiPage>
    with SingleTickerProviderStateMixin {
  late Animation fabButtonanim, infoAnimation,cardAnimation, delayedCardAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    cardAnimation = Tween(begin: 0.0, end: -0.055).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.10).animate(
        CurvedAnimation(
            curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: animationController));

    fabButtonanim = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: const Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    infoAnimation = Tween(begin: 0.0, end: 0.020).animate(CurvedAnimation(
        curve: const Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
  }
  @override
  Widget build(BuildContext context) {
   final devHeight=MediaQuery.of(context).size.height;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () {},
              ),
              title: const Text('Near by',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 20.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, delayedCardAnimation.value * devHeight, 0.0),
                            width: 260.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                                borderRadius: BorderRadius.circular(100.0)),
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, cardAnimation.value * devHeight, 0.0),
                            width: 280.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                               color: Colors.pink,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Container(
                          height: 400,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/vanessa-serpas-S4fYv5LQ4_A-unsplash.jpg",
                                  ))),
                        ),
                        Positioned(
                          top: 350.0,
                          left: 15.0,
                          child: Container(
                            transform: Matrix4.translationValues(0, infoAnimation.value*devHeight, 0),
                            width: 270.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Colors.black12,
                                      spreadRadius: 2.0)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      const Text(
                                        'Kayla',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Image.asset(
                                        'assets/images/giulia-bertelli-2OU30mdtseY-unsplash.jpg',
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      const SizedBox(width: 110.0),
                                      const Text(
                                        '5.8km',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 9.0),
                                  const Row(
                                    children: <Widget>[
                                      Text(
                                        'Fate is wonderful.',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  //For container we can give transform
                Transform(
                  transform: Matrix4.translationValues(0, fabButtonanim.value*devHeight, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FloatingActionButton(
                          elevation: 0.0,
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.close, color: Colors.black),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: IconButton(
                              icon: Image.asset(
                                  'assets/images/boxed-water-is-better-yaAGwbkbc-s-unsplash.jpg'),
                              color: Colors.lightBlueAccent[300],
                              onPressed: () {},
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          focusColor: Colors.grey.shade300,
                          onPressed: () {},
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                ),
              ],
            ),
          );
        });
  }
}
