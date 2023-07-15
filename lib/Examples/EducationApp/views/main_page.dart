import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/appbar.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({
    super.key,
  });
  List<String> catName = [
    "categories",
    "Classes",
    "Free Course",
    "Book Store",
    "Live Store",
    "LeaderBoard"
  ];
  List<Color> catcolors = [
    Colors.pinkAccent,
    Colors.blue,
    Colors.green,
    Colors.brown,
    Colors.purple,
    Colors.orange
  ];
  List<Icon> catIcons = [
    const Icon(Icons.category, color: Colors.white),
    const Icon(Icons.video_library, color: Colors.white),
    const Icon(Icons.assessment, color: Colors.white),
    const Icon(Icons.store, color: Colors.white),
    const Icon(Icons.play_circle_fill, color: Colors.white),
    const Icon(Icons.emoji_events, color: Colors.white)
  ];
  List<String> courseImage = [
    "assets/images/C#.png",
    "assets/images/Flutter.png",
    "assets/images/Python.png",
    "assets/images/React Native.png",
    "assets/images/Python.png",
    "assets/images/React Native.png",
  ];
  List<String> courseName = [
    "C++",
    "    Flutter",
    "Python",
    "React Native",
    "Python",
    "React Native",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            const AppBarWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: catIcons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catcolors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(catName[index])
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Courses",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            color: Colors.purple,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: courseImage.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 300,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                courseImage[index],
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                courseName[index],
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "55 Videos",
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 15),
                              )
                            ],
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //  bottomNavigationBar: BottomNavigationBar(items: [

      //  ])

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //   BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,),label: "Home"),
      //    BottomNavigationBarItem(icon: Icon(Icons.bookmark_add,),label: "Courses"),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "WishList"),
      //      BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),

      // ]),
    );
  }
}
