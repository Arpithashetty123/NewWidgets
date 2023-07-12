import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_menu/pie_menu.dart';
class PieMenuPage extends StatelessWidget {
  const PieMenuPage({super.key});
  static const double spacing = 20;
  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      theme: const PieTheme(delayDuration: Duration.zero),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(spacing),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: PieMenu(
                          theme: PieTheme.of(context).copyWith(
                            buttonTheme: PieButtonTheme(
                                backgroundColor: Colors.grey.shade500,
                                iconColor: Colors.white),
                            buttonThemeHovered: PieButtonTheme(
                                backgroundColor: Colors.lightBlue.shade50,
                                iconColor: Colors.white),
                            brightness: Brightness.dark,
                          ),
                          actions: [
                            PieAction(
                              tooltip: 'Play',
                              onSelect: () {},
                              child: const Icon(Icons.place),
                              padding: const EdgeInsets.only(left: 4),
                            ),
                            PieAction(
                                tooltip: 'Download',
                                onSelect: () {},
                                child: const Icon(Icons.share)),
                            PieAction(
                              tooltip: 'Share',
                              onSelect: () {},
                              child: const Icon(Icons.download),
                            ),
                          ],
                          child: _buildCard(
                            color: const Color.fromARGB(255, 82, 93, 95),
                            iconData: Icons.verified,
                          ),
                        ),
                      ),
                      const SizedBox(height: spacing),
                      Expanded(
                        child: PieMenu(
                          theme: PieTheme.of(context).copyWith(
                            buttonTheme:  PieButtonTheme(
                              backgroundColor: Colors.purple.shade300,
                              iconColor: Colors.white,
                            ),
                            buttonThemeHovered: const PieButtonTheme(
                              backgroundColor: Colors.purple,
                              iconColor: Colors.black,
                            ),
                            brightness: Brightness.dark,
                          ),
                          actions: [
                            PieAction.builder(
                              tooltip: 'how',
                              onSelect: () {},
                              builder: (hovered) {
                                return _buildTextButton('1', hovered);
                              },
                            ),
                            PieAction.builder(
                              tooltip: 'cool',
                              onSelect: () {},
                              builder: (hovered) {
                                return _buildTextButton('2', hovered);
                              },
                            ),
                            PieAction.builder(
                              tooltip: 'is',
                              onSelect: () {},
                              builder: (hovered) {
                                return _buildTextButton('3', hovered);
                              },
                            ),
                           PieAction.builder(tooltip: "this", onSelect: () {
                             
                           }, builder: (hovered) {
                             return _buildTextButton("4", hovered);
                           },),
                          ],
                          child: _buildCard(
                            color: Colors.purple.shade200,
                            iconData: Icons.monochrome_photos,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: spacing),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: PieMenu(
                          theme: PieTheme.of(context).copyWith(
                            tooltipStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            pointerColor: Colors.blue.shade300,
                           
                            buttonThemeHovered: const PieButtonTheme(
                              backgroundColor: Colors.white,
                              iconColor: Colors.black,
                            ),
                            buttonSize: 50,
                            brightness: Brightness.dark
                          ),
                          actions: [
                            
                            PieAction(
                               buttonTheme: const PieButtonTheme(
                                backgroundColor: Color.fromARGB(255, 210, 173, 242),
                                iconColor: Colors.white,
                              ),
                              tooltip: 'Like the package',
                              onSelect: () {
                                // launchUrlExternally(
                                //     'https://pub.dev/packages/pie_menu');
                              },
                              child:
                                  const Icon(Icons.thumb_up),
                            ),
                            PieAction(
                              tooltip: "Import app",

                              /// Custom background color
                              buttonTheme: const PieButtonTheme(
                                backgroundColor: Color.fromARGB(255, 210, 173, 242),
                                iconColor: Colors.white,
                              ),
                              onSelect: () {
                                // launchUrlExternally(
                                //     'https://pub.dev/packages/pie_menu');
                              },
                              child: const Icon(Icons.download),
                            ),
                            PieAction(
                              tooltip: "Share with other users",
                              buttonTheme: const PieButtonTheme(
                                backgroundColor:Color.fromARGB(255, 210, 173, 242),
                               iconColor: Colors.white
                              ),
                              onSelect: () {
                                // launchUrlExternally(
                                //     'https://pub.dev/packages/pie_menu');
                              },
                              child: const Icon(Icons.share),
                            ),
                          ],
                          child: _buildCard(
                            color: Colors.blueAccent.shade700,
                            iconData:Icons.air_sharp
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCard({
    Color? color,
    required IconData iconData,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: FaIcon(
          iconData,
          color: Colors.white,
          size: 64,
        ),
      ),
    );
  }

  Widget _buildTextButton(String text, bool hovered) {
    return Text(
      text,
      style: TextStyle(
       color: hovered? Colors.black :Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
