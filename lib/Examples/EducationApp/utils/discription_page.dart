import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class DescriptionPage extends StatelessWidget { 
  const DescriptionPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String text = loremIpsum(words: 60);
    return Scaffold(
      body:Column(
        children: [
          Text(
            text,
            style: GoogleFonts.tiroTamil(fontSize: 18),    
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Course Duration",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(Icons.access_alarms_sharp,color: Color.fromRGBO(103, 58, 183, 1)),
              const Text("26 Hourse")
            ],
          ),
          RatingBar.builder(itemBuilder: (context, index) {
            return const Icon(Icons.star,color: Colors.amber,);
          }, onRatingUpdate: (value) {
            
          },)
        ],
      ),
    );
  }
}
