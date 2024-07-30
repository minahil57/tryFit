import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/views/tryOn_image_display/widgets/error.dart';
import 'package:try_fit/views/tryOn_image_display/widgets/image_display.dart';
import 'package:try_fit/views/tryOn_image_display/tryOn_image_display_controller.dart';

class ImageEditingScreen extends StatelessWidget {
  final String upperBody;
  final String lowerBody;
  final double height;
  final double width;

  ImageEditingScreen({
    super.key,
    required this.upperBody,
    required this.lowerBody,
    required this.height,
    required this.width,
  });

  final ImageEditingController controller = Get.put(ImageEditingController());

  @override
  Widget build(BuildContext context) {
    controller.fetchImage(upperBody, lowerBody, height, width);

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Virtual Try On',
          style: getRegularStyle(),
        ),
        backgroundColor: kcWhitecolor,
      ),
      body: Center(
        child: Obx(() {
          if (controller.imageFuture.value == null) {
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
          } else {
            return FutureBuilder<String?>(
              future: controller.imageFuture.value,
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
                  return ErrorDisplayWidget(
                    snapshot: snapshot,
                    upperBody: upperBody,
                    lowerBody: lowerBody,
                    height: height,
                    width: width,
                  );
                } else if (snapshot.hasData) {
                  return ImageDisplay(
                    snapshot: snapshot,
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No image found'),
                      ElevatedButton(
                        onPressed: () => controller.fetchImage(
                            upperBody, lowerBody, height, width),
                        child: const Text('Retry'),
                      ),
                    ],
                  );
                }
              },
            );
          }
        }),
      ),
    );
  }
}
