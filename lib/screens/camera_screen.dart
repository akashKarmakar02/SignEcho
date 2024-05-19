import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import '../components/camera_painter.dart';

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
  Map<String, dynamic>? _boxCoordinates;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.veryHigh,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    _initializeControllerFuture = _controller.initialize();
    _channel = IOWebSocketChannel.connect(
        'ws://perfect-above-lamprey.ngrok-free.app/predict');
    _channel.stream.listen((data) {
      var jsonData = jsonDecode(data);
      print(
          "Received data: ${jsonData['prediction']} ${jsonData['prediction'] is Map<String, dynamic>}");
      setState(() {
        _boxCoordinates = Map<String, dynamic>.from(jsonData['prediction']);
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
                  CustomPaint(
                    painter: CameraPainter(_boxCoordinates!),
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
