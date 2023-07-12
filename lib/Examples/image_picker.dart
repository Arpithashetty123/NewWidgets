import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);
  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _image;
  Future getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) {
        return;
      }
      final imagepermanent = await saveFiles(pickedImage.path);
      setState(() {
        _image = imagepermanent;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(
          "Failed to load image:$e",
        );
      }
    }
  }

  Future<File> saveFiles(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pick an image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(
                    _image!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  )
                : Image.asset("assets/images/Rectangle 38.png",
                    width: 300, height: 300, fit: BoxFit.contain),
            const SizedBox(height: 20),
            customButton(
              text: "Select from gallery",
              icon: Icons.photo_library,
              onClick: () {
                getImage(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 20),
            customButton(
              text: "Click from camera",
              icon: Icons.camera_alt,
              onClick: () {
                getImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton({
    required String text,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
    );
  }
}
