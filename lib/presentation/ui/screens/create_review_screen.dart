import 'package:crafty_bay/presentation/state_holders/create_product_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _reviewTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CreateProductReviewController _createProductReviewController =
      Get.find<CreateProductReviewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Reviews',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 52,
              ),
              TextFormField(
                controller: _reviewTEController,
                maxLines: 5,
                decoration: const InputDecoration(hintText: 'Write Review'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _createProductReviewController.createReview(
                          _reviewTEController.text.trim(),
                          _createProductReviewController
                              .productReviewModel.productReview!.id!
                              .toInt(),
                          _createProductReviewController
                              .productReviewModel.productReview!.rating!
                              .toInt(),
                          _createProductReviewController
                              .productReviewModel.productReview!.customerId!
                              .toInt(),
                          _createProductReviewController
                              .productReviewModel.productReview!.productId!
                              .toInt());
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
