import 'package:crafty_bay/presentation/state_holders/product_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  final String? category;
  final int? categoryId;

  const ProductListScreen({super.key, this.category, this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.categoryId != null) {
      Get.find<ProductController>()
          .getProductList(categoryId: widget.categoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? 'Products'),
      ),
      body: GetBuilder<ProductController>(builder: (productController) {
        return Visibility(
          visible: productController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: Visibility(
            visible:
                productController.productListModel.productList?.isNotEmpty ??
                    false,
            replacement: const Center(
              child: Text('No Product'),
            ),
            child: GridView.builder(
                itemCount:
                    productController.productListModel.productList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.80),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCardItem(
                      product: productController
                          .productListModel.productList![index],
                    ),
                  );
                }),
          ),
        );
      }),
    );
  }
}
