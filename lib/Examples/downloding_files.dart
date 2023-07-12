import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
class DownloadFilePage extends StatelessWidget {
  const DownloadFilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Downloading Files"),
        centerTitle: true,
      ),
      body: const Center(child:  Text("Download a File")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context) {
        return const ShowDownload();
        },);
      },
      child: const Icon(Icons.download),),
    );
  }
}
class ShowDownload extends StatefulWidget {
  const ShowDownload({super.key});
  @override
  State<ShowDownload> createState() => _ShowDownloadState();
}
class _ShowDownloadState extends State<ShowDownload> {
  Dio dio=Dio();
  double progress=0.0;
  Future<void> startDownloading() async {
    String url="https://picsum.photos/200";
    String fileName="image.jpg";
    String path=  await _getFilePath(fileName);
     dio.download(url, path,onReceiveProgress: (recivedBytes, totalBytes) {
       setState(() {
         progress=recivedBytes/totalBytes;
       });
       if (kDebugMode) {
         print("Progress");
       }
     },
     deleteOnError: true
     ).then((_) {
       Navigator.pop(context);
     },);
  }
   Future<String>_getFilePath(String fileName) async {
    final dir=await getApplicationDocumentsDirectory();
    return "${dir.path}/$fileName";
   }
    @override
    void initState() {
    super.initState();
    startDownloading();
  }
  @override
  Widget build(BuildContext context) {
    String downloadingProgress=(progress*100).toInt().toString();
    return   AlertDialog(
  backgroundColor: Colors.black,
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    const CircularProgressIndicator.adaptive(),
    const SizedBox(height: 20,),
    Text("Downloading: $downloadingProgress% ",
    style: const TextStyle(color: Colors.white,fontSize: 25),),
  ]),
    );
}  

}
  
  

