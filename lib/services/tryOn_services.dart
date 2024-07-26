import 'dart:developer';
import 'dart:async';
import 'package:dio/dio.dart';

class ApiService {
  //final Dio _dio = Dio();

  Future<String?> editImage(String upperBody, String lowerBody,double height,double width) async {
    const String url = 'https://modelslab.com/api/v6/image_editing/fashion';
    final Map<String, dynamic> data = {
      "key": "vwGrHeGLRH9GUEtH4mDlod0JCh09eFZ9o5BQ3NVL2OcJk8FeJKe4ChkGVWuN",
      "prompt": "A realistic photo of a model wearing a beautiful t-shirt",
      "negative_prompt": "Low quality, unrealistic, bad cloth, warped cloth",
      "init_image": lowerBody,
      "cloth_image": upperBody,
      "cloth_type": "upper_body",
      "height": 512,
      "width": 384,
      "guidance_scale": 7.5,
      "num_inference_steps": 21,
      "seed": null,
      "temp": "no",
      "webhook": null,
      "track_id": null
    };

    try{
      Response response = await Dio().post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: data,
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        log(responseData.toString());


        if (responseData['fetch_result'] != null) {
          String fetchUrl = responseData['fetch_result'] as String;
          await _pollForResult(fetchUrl);

          return responseData['proxy_links'][0] as String;
        } else {
          print('Error: ${response.statusMessage}');
          return null;
        }
      }
    }catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  Future<String?> _pollForResult(String fetchUrl) async {
    const int maxAttempts = 15;

    const Duration delay = Duration(seconds: 5);

    for (int attempt = 0; attempt < maxAttempts; attempt++) {
      try {

        Response response = await Dio().get(fetchUrl);
        final responseData = response.data as Map<String, dynamic>;

        if (responseData['status'] == 'success' &&
            responseData['proxy_links'] != null &&
            responseData['proxy_links'] is List &&
            responseData['proxy_links'].isNotEmpty) {
          return responseData['proxy_links'][0] as String;
        }

        log('Status: ${responseData['status']}, retrying...');
      } catch (e) {
        print('Exception during polling: $e');
      }

      await Future.delayed(delay);
    }

    log('Error: Maximum attempts reached without success');
    return null;
  }
}