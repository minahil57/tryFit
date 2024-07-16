import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/models/product_model.dart';

class ProductDetailContainer extends StatelessWidget {
  final ProductModel product;
  const ProductDetailContainer({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return   Container(
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
    );
  }
}
