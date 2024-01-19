import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, this.height});

  final double? height;
  @override
  State<ProductImageCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<ProductImageCarousel> {
  ValueNotifier<int> _CurrentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height ?? 220.0,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                _CurrentIndex.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _CurrentIndex,
              builder: (context, index, widget) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        height: 14,
                        width: 14,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: i == _CurrentIndex.value
                              ? AppColors.primaryColor
                              : Colors.white,
                          border: Border.all(
                            color: i == _CurrentIndex.value
                                ? AppColors.primaryColor
                                : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
