import '../../../core/imports/core_imports.dart';

class ProductDescriptionContainer extends StatelessWidget {
  const ProductDescriptionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: kcWhitecolor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "RAINY CASUAL CLOTHES",
            style: getBoldStyle(fontSize: 16),
          ),
          verticalSpaceSmall,
          Text(
            "RAIN CASUAL WEAR MENS SHIRTS - BUY RAIN CASUAL WEAR MENS SHIRTS. DESIGNED BY OUR BEST DESIGNERS!",
            style: getRegularStyle(),
          ),
          verticalSpaceSmall,
          const Divider(),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fabric",
                style: getBoldStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "Cotton",
                style: getBoldStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Country Origin",
                style: getBoldStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "Pakistan",
                style: getBoldStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
