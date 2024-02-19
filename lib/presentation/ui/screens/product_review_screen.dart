import 'package:crafty_bay/presentation/state_holders/review_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key, required this.productID});

  final int productID;

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewListController>().getReviewList(widget.productID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: GetBuilder<ReviewListController>(builder: (reviewListController) {
        if (reviewListController.inProgress == true) {
          return const CenterCircularProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount:
                      reviewListController.reviewListModel.reviewList?.length ??
                          0,
                  itemBuilder: (context, index) {
                    // final reviewList =
                    //     reviewListController.reviewListModel.reviewList;

                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(reviewListController
                            .reviewListModel.reviewList!.first.id
                            .toString()),
                        subtitle: Text(reviewListController
                            .reviewListModel.reviewList!.first.description
                            .toString()),
                      ),
                    );
                  }),
            ),
            Container(
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
                  const Text('Review (1000)'),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const CreateReviewScreen());
                    },
                    icon: const CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(Icons.add)),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
