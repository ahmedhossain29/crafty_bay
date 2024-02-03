import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  List<Color> colors = [
    Colors.black,
    Colors.amber,
    Colors.grey,
    Colors.green,
    Colors.yellowAccent,
  ];

  List<String> sized = [
    'S',
    'L',
    'M',
    'XL',
    'XXL',
  ];

  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        return Visibility(
          visible: productDetailsController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarousel(
                        urls: [
                          productDetailsController.productDetails.img1 ?? '',
                          productDetailsController.productDetails.img2 ?? '',
                          productDetailsController.productDetails.img3 ?? '',
                          productDetailsController.productDetails.img4 ?? '',
                        ],
                      ),
                      productDetailsBody(
                          productDetailsController.productDetails),
                    ],
                  ),
                ),
              ),
              priceAndAddToCartSection,
            ],
          ),
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsData productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: noOfItems,
                  builder: (context, value, _) {
                    return ItemCount(
                      initialValue: value,
                      minValue: 0,
                      maxValue: 20,
                      decimalPlaces: 0,
                      step: 1,
                      color: AppColors.primaryColor,
                      onChanged: (v) {
                        setState(() {});
                        noOfItems.value = v.toInt();
                      },
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          reviewAndRatingRow(productDetails.product?.star ?? 0),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Color',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          ColorSelector(
              colors: productDetails.color
                      ?.split(',')
                      .map((e) => getColorFromString(e))
                      .toList() ??
                  [],
              onChange: (selectedColor) {
                _selectedColor = selectedColor.toString();
              }),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          SizeSelector(
              size: productDetails.size?.split(',') ?? [],
              onChange: (s) {
                _selectedSize = s;
              }),
          const SizedBox(
            height: 16,
          ),
          Text(
            productDetails.product!.shortDes ?? '',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            productDetails.des ?? '',
            style: const TextStyle(color: Colors.black45, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Row reviewAndRatingRow(int rating) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              rating.toStringAsPrecision(2),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Review',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Card(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_outline,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              Text(
                '\$1254',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedColor != null && _selectedSize != null) {
                  if (Get.find<AuthController>().isTokenNotNull) {
                  } else {
                    Get.to(() => const VerifyEmailScreen());
                  }
                } else {
                  Get.showSnackbar(const GetSnackBar(
                    title: 'Add to cart failed',
                    message: 'Please select color and size',
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              child: const Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }

  Color getColorFromString(String colorCode) {
    String code = colorCode.replaceAll('#', '');
    String hexCode = 'FF$code';
    return Color(int.parse('0x$hexCode'));
  }
}
