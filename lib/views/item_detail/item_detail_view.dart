import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/models/product_model.dart';

class ItemDetailView extends StatelessWidget {
  final ProductModel product;
  const ItemDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: Get.height * 0.7,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    product.image, // replace with your image asset
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: SweepGradient(
                  center: Alignment.topLeft,
                  colors: [
                    kcBackgroundColor,
                    Colors.white,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                children: [
                  verticalSpaceSmall, // small line indicating the scrollable content
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: const BoxDecoration(
                          color: kcWhitecolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: kcWhitecolor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(
                                      color: kcBlackColor,
                                    ),
                                  ),
                                  child: Text(
                                    "+ ADD GIFT BOXING",
                                    style: getRegularStyle(),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        "COLOR",
                                        style: getRegularStyle(),
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: Colors.orange,
                                            radius: 15),
                                        horizontalSpaceSmall,
                                        CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 15),
                                        horizontalSpaceSmall,
                                        CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            radius: 15),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            verticalSpaceSmall,
                            Text(
                              "Price",
                              style: getRegularStyle(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ ${product.price}",
                                  style: getBoldStyle(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "SIZE",
                                      style: getMediumStyle(),
                                    ),
                                    horizontalSpaceMedium,
                                    Text(
                                      "S",
                                      style: getRegularStyle(),
                                    ),
                                    horizontalSpaceSmall,
                                    Text(
                                      "M",
                                      style: getRegularStyle(),
                                    ),
                                    horizontalSpaceSmall,
                                    Text(
                                      "L",
                                      style: getRegularStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                            Divider(),
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
                      ),
                      verticalSpaceSmall,
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add to cart action here
                          },
                          child: const Text("Try On"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: kcWhitecolor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 140, vertical: 15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
