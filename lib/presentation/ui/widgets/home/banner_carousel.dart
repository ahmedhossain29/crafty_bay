import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/models/banner.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, this.height, required this.bannerList});

  final double? height;
  final List<BannerItem> bannerList;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  ValueNotifier<int> _CurrentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///tODO
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height ?? 180.0,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                _CurrentIndex.value = index;
              }),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  color: AppColors.primaryColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          //margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                  image: NetworkImage(banner.image ?? ''))),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                banner.title ?? "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                banner.shortDes ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _CurrentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.bannerList.length; i++)
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
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                ],
              );
            }),
      ],
    );
  }
}
