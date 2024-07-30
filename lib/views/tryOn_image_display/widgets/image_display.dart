import 'package:try_fit/core/constants/string_manager.dart';

import '../../../core/imports/core_imports.dart';
import '../../../core/imports/external_imports.dart';

class ImageDisplay extends StatelessWidget {
  final AsyncSnapshot<String?> snapshot;
  const ImageDisplay({super.key,required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20.h, right: 20.h),
      height: Get.height * 0.6,
      width: Get.width * 0.6,
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
                      style: TextStyle(color: kcRedColor, fontSize: 16),
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
              StringManager.imageGenerativeText,
              style: getRegularStyle(),
            ),
          )
        ],
      ),
    );
  }
}
