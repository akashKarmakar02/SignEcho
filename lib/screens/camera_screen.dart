import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late IOWebSocketChannel _channel;
  late Timer _timer;
  bool _isCapturing = false;
  Map<String, int>? _boxCoordinates;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.veryHigh,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    _initializeControllerFuture = _controller.initialize();
    _channel = IOWebSocketChannel.connect('ws://sign-echo-nexesgroup-3980cdcb.koyeb.app/predict');
    _channel.stream.listen((data) {
      var jsonData = jsonDecode(data);
      print("Received data: ${jsonData['prediction']}");
      setState(() {
        _boxCoordinates = Map<String, int>.from(jsonData['prediction']);
      });
    });
    _startSendingImages();
  }

  void _startSendingImages() async {
    await _initializeControllerFuture;
    _timer = Timer.periodic(const Duration(milliseconds: 20), (_) {
      _captureAndSendImage();
    });
  }

  void _captureAndSendImage() async {
    if (!_isCapturing) {
      _isCapturing = true;
      XFile? imageFile = await _controller.takePicture();
      Uint8List imageBytes = await imageFile.readAsBytes();
      _channel.sink.add(imageBytes);
      _isCapturing = false;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                if (_boxCoordinates != null)
                  Positioned(
                    left: 300, //_boxCoordinates!['x1']!.toDouble()
                    top: 200, //_boxCoordinates!['y1']!.toDouble()
                    child: Container(
                      width: 100, //(_boxCoordinates!['x2']! - _boxCoordinates!['x1']!).toDouble()
                      height: 100, //(_boxCoordinates!['y2']! - _boxCoordinates!['y1']!).toDouble()
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                    ),
                  ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
