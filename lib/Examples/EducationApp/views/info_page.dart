import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/discription_page.dart';
import '../utils/buttoncontainer.dart';
import '../utils/videos_page.dart';

class InfoPage extends StatefulWidget {
  InfoPage({
    Key? key,
    required this.img,
    required this.name,
    required this.isVideoSelected,
  }) : super(key: key);

  final String img;
  final String name;
  bool isVideoSelected;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        actions: const [Icon(Icons.notifications)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: 400,
                color: Colors.grey.shade200,
                child: Stack(
                  children: [
                    Center(child: Image.asset(widget.img)),
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.deepPurple,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${widget.name} Complete Course",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Created By Udemy",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text("55 videos"),
              const SizedBox(height: 10),
              Container(
                width: 400,
                height: 100,
                color: Colors.grey.shade200,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isVideoSelected = true;
                          });
                        },
                        child: buttonContainer(
                          100,
                          "Videos",
                          widget.isVideoSelected,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isVideoSelected = false;
                          });
                        },
                        child: buttonContainer(
                          200,
                          "Description",
                          widget.isVideoSelected,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 500,
                child: widget.isVideoSelected ? VideoPage() : const DescriptionPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
