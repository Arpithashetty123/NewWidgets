import 'package:flutter/material.dart';
import 'package:flutter_application_1/Examples/EducationApp/views/main_page.dart';
import '../utils/splash_continer.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({super.key,});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          customContainer(
            MediaQuery.of(context).size.height / 1.6,
            BorderRadius.circular(0),
            Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            width: width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
              color: Color.fromARGB(255, 101, 76, 183),
            ),
            child: Center(
                child: Image.asset(
                  "assets/images/books.png",
                  scale: 0.95,
                ),
              ),
            ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: customContainer(
              MediaQuery.of(context).size.height / 2.6667,
              BorderRadius.zero,
              const Color.fromARGB(255, 101, 76, 183),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.666,
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Text(
                    "Learning is Everything",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Learning with pleasure and showing a lot of interest",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(250, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return  MainPage();
                          },
                        ),
                      );
                    },
                    child: const Text("Get Start"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
