import 'package:crafty_bay/presentation/state_holders/wish_list_item.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class WishListProductItem extends StatefulWidget {
  const WishListProductItem({super.key, required this.wishListItem});

  final WishListItem wishListItem;

  @override
  State<WishListProductItem> createState() => _WishListProductItemState();
}

class _WishListProductItemState extends State<WishListProductItem> {
  // late ValueNotifier<int> noOfItems = ValueNotifier(widget.wishListItem.);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.network(
            widget.wishListItem.product?.image ?? '',
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.wishListItem.product?.title ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Stock:  ${widget.wishListItem.product?.stock ?? ''}',
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.wishListItem.product?.price ?? ''}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                    // ValueListenableBuilder(
                    //     valueListenable: noOfItems,
                    //     builder: (context, value, _) {
                    //       return ItemCount(
                    //         initialValue: value,
                    //         minValue: 1,
                    //         maxValue: 20,
                    //         decimalPlaces: 0,
                    //         step: 1,
                    //         color: AppColors.primaryColor,
                    //         onChanged: (v) {
                    //           noOfItems.value = v.toInt();
                    //           Get.find<CartListController>().updateQuantity(
                    //               widget.cartItem.id!, noOfItems.value);
                    //         },
                    //       );
                    //     }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
