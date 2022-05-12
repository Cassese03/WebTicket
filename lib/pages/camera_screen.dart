import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

/*
class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller =
        new CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: new CameraPreview(controller),
    );
  }
}
*/
class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({this.cameras, Key key}) : super(key: key);
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  CameraController controller;
  XFile pictureFile;
  @override
// ignore: must_call_super
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
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
    return SafeArea(
      child: Material(
          child: Stack(
        children: [
          /*SafeArea(
      child: Column(children: [
        CameraPreview(controller),*/
          Container(
            child: CameraPreview(controller),
          ),
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
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {}),
                      InkWell(
                        onTap: () async {
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
                          });
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
sizedBox(
height: 4,
), // sizedBox
Text(
"Hold for video, tap for photo",
stvle: Textstulet
color: Colors.white,)
), // Container
), / Positioned
]
        /*ElevatedButton(
          onPressed: () async {
            pictureFile = await controller.takePicture();
            setState(() {});
          },
          child: const Text('Capture Image'),
        ),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child:*/

        /*
      ),*/
        //if (pictureFile != null) Image.file(File(pictureFile.path)),
      */
