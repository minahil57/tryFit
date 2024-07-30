import 'package:get/get.dart';
import 'package:try_fit/views/tryOn_image_display/tryOn_image_display_controller.dart';

import '../../../core/imports/core_imports.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final AsyncSnapshot<String?> snapshot;
  final String upperBody;
  final String lowerBody;
  final double height;
  final double width;
  const ErrorDisplayWidget({super.key ,required this.snapshot, required this.upperBody, required this.lowerBody, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageEditingController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Error: ${snapshot.error}'),
        ElevatedButton(
          onPressed: () => controller.fetchImage(upperBody, lowerBody, height, width),
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
