import 'dart:io';

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
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child: CameraPreview(controller),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            pictureFile = await controller.takePicture();
            setState(() {});
          },
          child: const Text('Capture Image'),
        ),
      ),
      if (pictureFile != null) Image.file(File(pictureFile.path)),
    ]);
  }
}
