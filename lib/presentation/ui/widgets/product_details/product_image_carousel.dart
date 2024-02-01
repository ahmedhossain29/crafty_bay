import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, this.height, required this.urls});

  final double? height;
  final List<String> urls;
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
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.fill),
                  ),
                );
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
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.urls.length; i++)
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
