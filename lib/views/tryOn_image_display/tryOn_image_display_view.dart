import 'dart:io';

import 'package:flutter/material.dart';
import 'package:try_fit/services/tryOn_services.dart';

class ImageEditingScreen extends StatefulWidget {
  final String upperBody;
  final String lowerBody;
  const ImageEditingScreen(
      {super.key, required this.upperBody, required this.lowerBody});

  @override
  _ImageEditingScreenState createState() => _ImageEditingScreenState();
}

class _ImageEditingScreenState extends State<ImageEditingScreen> {
  final ApiService apiService = ApiService();
  Future<String?>? _imageFuture;
  int _retryCount = 0;
  final int _maxRetries = 3;

  @override
  void initState() {
    super.initState();

  }

  void _fetchImage() {
    setState(() {
      _imageFuture = apiService
          .editImage(widget.upperBody, widget.lowerBody)
          .then((imageUrl) {
        if (_retryCount < _maxRetries &&
            (imageUrl == null || !imageUrl.endsWith('.png'))) {
          _retryCount++;
          _fetchImage();
        } else {
          _retryCount = 0;
        }
        print(imageUrl);
        return imageUrl;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Editing API'),
      ),
      body: Center(
        child: FutureBuilder<String?>(
          future: apiService.editImage(widget.upperBody, widget.lowerBody),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: _fetchImage,
                    child: const Text('Retry'),
                  ),
                ],
              );
            } else if (snapshot.hasData) {
              return Image.network(
                snapshot.data!,

                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 50),
                        SizedBox(height: 10),
                        Text(
                          'Failed to load image',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },

              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No image found'),
                  ElevatedButton(
                    onPressed: _fetchImage,
                    child: const Text('Retry'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}