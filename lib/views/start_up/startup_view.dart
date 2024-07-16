import 'package:get/get.dart';
import 'package:try_fit/core/constants/string_manager.dart';
import 'package:try_fit/views/start_up/startup_controller.dart';

import '../../core/imports/core_imports.dart';

class SplashScreen extends GetView<StartUpController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StartUpController(context: context));
    return Scaffold(
      backgroundColor: kcWhitecolor,
      body: Stack(
        children: <Widget>[
          // Background image
          Image.asset(
            AssetManager.backGroundImage, // Replace with your image URL
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: double.infinity,
          ),
          // Overlay with text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Text(
                  StringManager.startUpText.toUpperCase(),
                  style: getBoldStyle(
                    color: kcWhitecolor,fontSize: 60
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}