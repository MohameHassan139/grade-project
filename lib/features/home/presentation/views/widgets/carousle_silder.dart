import 'package:ar_shopping/constants/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/news_item.dart';

class CustomCarousleSlider extends StatefulWidget {
  List<NewsItem> news;
  CustomCarousleSlider({super.key, required this.news});

  @override
  State<CustomCarousleSlider> createState() => _CustomCarousleSliderState();
}

class _CustomCarousleSliderState extends State<CustomCarousleSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = news
        .map((item) => InkWell(
              onTap: () {
                // TODO
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.imgUrl,
                            fit: BoxFit.cover, width: 1000.0),
                        // categrory
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              item.category,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  item.title,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: news.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 25.0 : 12,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  borderRadius:
                      _current == entry.key ? BorderRadius.circular(8) : null,
                  shape: _current == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? CustomColors.kGreenColor
                          : CustomColors.kWhiteColor)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
