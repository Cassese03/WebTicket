import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_view.dart';

// ignore: must_be_immutable
class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  String token;
  String contatto;
  CameraPage({this.cameras, Key key, this.token, this.contatto})
      : super(key: key);
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  CameraController controller;
  XFile pictureFile;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                path: image.path,
                token: widget.token,
                contatto: widget.contatto)));
  }

  @override
// ignore: must_call_super
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.veryHigh,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return SafeArea(
      child: Material(
          child: Stack(
        children: [
          Transform.scale(
            scale: controller.value.aspectRatio / deviceRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),
          /*
          Center(
            child: CameraPreview(controller),
          ),*/
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            pickImage();
                          }),
                      InkWell(
                        onTap: () async {
                          /*
                          pictureFile = await controller.takePicture();
                          setState(() {
                            if (pictureFile != null) {
                              // Image.file(File(pictureFile.path));
                              File imageFile = new File(pictureFile.path);
                              List<int> imageBytes =
                                  imageFile.readAsBytesSync();
                              print(imageBytes);
                              String base64Image = base64Encode(imageBytes);
                              print(base64Image);
                            }
                            //print(pictureFile.path.toString());
                          }
                          );*/
                          pictureFile = await controller.takePicture();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => CameraViewPage(
                                      path: pictureFile.path,
                                      token: widget.token,
                                      contatto: widget.contatto)));
                        },
                        child: Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {}), // IconButton
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
/*
final size = MediaQuery.of(context).size;
final deviceRatio = size.width / size.height;
return Transform.scale(
  scale: controller.value.aspectRatio / deviceRatio,
  child: Center(
    child: AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    ),
  ),
);
*/ 
