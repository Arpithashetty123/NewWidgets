import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
class ImageToGallery extends StatelessWidget {
  const ImageToGallery({Key? key}) : super(key: key);
  Future<void> _saveImageToGallery() async {
    const assetPath = "assets/images/vanessa-serpas-S4fYv5LQ4_A-unsplash.jpg";
    final byteData = await rootBundle.load(assetPath);
    final bytes = byteData.buffer.asUint8List();

    await ImageGallerySaver.saveImage(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Save to Gallery"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/vanessa-serpas-S4fYv5LQ4_A-unsplash.jpg",
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveImageToGallery,
              child: const Text("Click To Download"),
            ),
          ],
        ),
      ),
    );
  }
}
