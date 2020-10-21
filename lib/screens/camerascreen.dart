import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class Camera extends StatefulWidget {
  static final String screenId = "camera";
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File imageFile;
  var picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
        actions: [
          IconButton(icon: Icon(Icons.share),
          onPressed: (){
            getByteFromFile();
          },)
        ],
      ),
      body: imageFile == null ? Center(child: Text("No image selected"),) : Image.file(imageFile),
      floatingActionButton: FloatingActionButton(onPressed: (){
        chooseImage();
      },
        child: Icon(Icons.camera),
      ),
    );
  }

  chooseImage(){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(children: [
              GestureDetector(
                child: Text("Take a photo", style: TextStyle(fontSize: 20, fontFamily: "Nunito")),
                onTap: (){
                  getImageFromCamera();
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                child: Text("Take from Gallery", style: TextStyle(fontSize: 20, fontFamily: "Nunito")),
                onTap: (){
                  getImageFromGallery();
                },
              )
            ],),)
        );
      }
    );
  }

  Future<void> getImageFromCamera() async {
    var pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if(pickedFile != null){
        imageFile = File(pickedFile.path);
      }else{
        print("No Image selected");
      }
    });
    Navigator.pop(context);
  }


  Future<void> getImageFromGallery() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile != null){
        imageFile = File(pickedFile.path);
      }else{
        print("No Image selected");
      }
    });
    Navigator.pop(context);
  }

  Future<ByteData> getByteFromFile() async {
    final ByteData bytes = await rootBundle.load(imageFile.path);
    await Share.file(
      'Shared Image Via :', 
      path.basename(imageFile.path), 
      bytes.buffer.asUint8List(), 
      'image/png', 
      text: 'Send Image'
    );
  }
}