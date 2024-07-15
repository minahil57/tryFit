import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/core/imports/external_imports.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          width: Get.width*0.38,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            image: DecorationImage(
              image: AssetImage(
                  AssetManager.dpImage), // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        // + icon
        const Positioned(
          left: 10,
          top: 10,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        // Heart shape container
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
