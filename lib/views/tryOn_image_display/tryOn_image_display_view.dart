import 'dart:io';

import 'package:flutter/material.dart';
import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/services/tryOn_services.dart';

class ImageEditingScreen extends StatefulWidget {
  final String upperBody;
  final String lowerBody;
  final double height;
  final double width;
  const ImageEditingScreen(
      {super.key, required this.upperBody, required this.lowerBody, required this.height, required this.width});

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
          .editImage(widget.upperBody, widget.lowerBody,widget.height,widget.width)
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
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title:  Text('Virtual Try On',style: getRegularStyle(),),
        backgroundColor: kcWhitecolor,
      ),
      body: Center(
        child: FutureBuilder<String?>(
          future: apiService.editImage(widget.upperBody, widget.lowerBody,widget.height,widget.width),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    verticalSpaceMedium,
                    Text(
                      'Generating try-on image...',
                      style: getRegularStyle(),
                    ),
                  ],
                ),
              );
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
              return Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h),
                height: Get.height * 0.6,
                width: Get.width*0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: kcLightGrey.withOpacity(0.5)),
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data!,
                      height: Get.height * 0.4,
                      width: Get.width,
                      fit: BoxFit.fill,
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
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'The try-on image was successfully generated, showcasing the selected product seamlessly integrated into a realistic visual.',
                        style: getRegularStyle(),
                      ),
                    )
                  ],
                ),
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
