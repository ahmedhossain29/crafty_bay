import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/wishList/wish_list_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishListController>().getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'WishList',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: GetBuilder<WishListController>(builder: (wishListController) {
          if (wishListController.inProgress == true) {
            return const CenterCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount:
                      wishListController.wishListModel.wishItemList?.length ??
                          0,
                  itemBuilder: (context, index) {
                    return WishListProductItem(
                      wishListItem:
                          wishListController.wishListModel.wishItemList![index],
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 8,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
