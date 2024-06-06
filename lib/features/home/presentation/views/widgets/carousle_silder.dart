import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/core/component/error_widget.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/home/presentation/offer_cubit/home_cubit_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/component/custom_network_image.dart';
import '../../../../../core/function/push_screen.dart';
import '../../../../product_details/presentation/view/product_screen.dart';
import '../../../data/models/news_item.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/offer_model.dart';
// // Import your other necessary packages and widgets

// class CustomCarousleSlider extends StatefulWidget {
//   CustomCarousleSlider({
//     super.key,
//   });

//   @override
//   State<CustomCarousleSlider> createState() => _CustomCarousleSliderState();
// }

// class _CustomCarousleSliderState extends State<CustomCarousleSlider> {
//   int _current = 0;
//   final CarouselController _controller = CarouselController();

//   @override
//   Widget build(BuildContext context) {
//     List<ProductModel> productModels = [];
//     final List<Widget> imageSliders = productModels
//         .map((item) => InkWell(
//               onTap: () {
//                 // TODO
//               },
//               child: Container(
//                 margin: const EdgeInsets.all(5.0),
//                 child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(24.0)),
//                     child: Stack(
//                       children: <Widget>[
//                         CustomNetworkImage(
//                           imageUrl: item.img ?? '',
//                         ),
//                         // categrory
//                         Positioned(
//                           top: 10,
//                           left: 20,
//                           child: Container(
//                             padding: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Theme.of(context).primaryColor,
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Text(
//                               item.pcType ?? 'type',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 0.0,
//                           left: 0.0,
//                           right: 0.0,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: double.infinity,
//                                 decoration: const BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       Color.fromARGB(200, 0, 0, 0),
//                                       Color.fromARGB(0, 0, 0, 0)
//                                     ],
//                                     begin: Alignment.bottomCenter,
//                                     end: Alignment.topCenter,
//                                   ),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 10.0, horizontal: 20.0),
//                                 child: Text(
//                                   item.pcName ?? 'Name',
//                                   maxLines: 2,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyMedium
//                                       ?.copyWith(
//                                         color: Colors.white,
//                                       ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ))
//         .toList();
//     return BlocBuilder<HomeCubitCubit, HomeCubitState>(
//       builder: (context, state) {
//         if (state is GetSpacialOffertsLoading) {
//           print('loadiiiing');
//           return CarousleSilderLoading();
//         } else if (state is GetSpacialOfferSuccess) {
//           print('successsssess');
//           productModels = state.products;
//           return Column(children: [
//             CarouselSlider(
//               items: imageSliders,
//               carouselController: _controller,
//               options: CarouselOptions(
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 2.0,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _current = index;
//                     });
//                   }),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: productModels.asMap().entries.map((entry) {
//                 return GestureDetector(
//                   onTap: () => _controller.animateToPage(entry.key),
//                   child: Container(
//                     width: _current == entry.key ? 25.0 : 12,
//                     height: 12.0,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 8.0, horizontal: 4.0),
//                     decoration: BoxDecoration(
//                         borderRadius: _current == entry.key
//                             ? BorderRadius.circular(8)
//                             : null,
//                         shape: _current == entry.key
//                             ? BoxShape.rectangle
//                             : BoxShape.circle,
//                         color: (Theme.of(context).brightness == Brightness.dark
//                                 ? CustomColors.kGreenColor
//                                 : CustomColors.kWhiteColor)
//                             .withOpacity(_current == entry.key ? 0.9 : 0.4)),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ]);
//         } else if (state is GetSpacialOfferFailure) {
//           return CustomErrorWidget(errorMessage: state.error);
//         }
//         return Text(state.toString());
//       },
//     );
//   }
// }

// class CarousleSilderLoading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[600]!,
//       highlightColor: Colors.grey[300]!,
//       child: Column(
//         children: [
//           CarouselSlider(
//             items: List.generate(5, (index) => buildShimmerItem()),
//             options: CarouselOptions(
//               autoPlay: false,
//               enlargeCenterPage: true,
//               aspectRatio: 2.0,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(5, (index) {
//               return Container(
//                 width: 12.0,
//                 height: 12.0,
//                 margin:
//                     const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.grey[300],
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildShimmerItem() {
//     return Container(
//       margin: const EdgeInsets.all(5.0),
//       decoration: BoxDecoration(
//         color: Colors.grey[300],
//         borderRadius: BorderRadius.circular(24.0),
//       ),
//       width: double.infinity,
//       height: 200.0,
//     );
//   }
// }

// Import your other necessary packages and widgets

class CustomCarousleSlider extends StatefulWidget {
  CustomCarousleSlider({
    super.key,
  });

  @override
  State<CustomCarousleSlider> createState() => _CustomCarousleSliderState();
}

class _CustomCarousleSliderState extends State<CustomCarousleSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubitCubit, HomeCubitState>(
      builder: (context, state) {
        late Offermodel productModels;
        if (state is GetSpacialOffertsLoading) {
          print('loadiiiing');
          return CarousleSilderLoading();
        } else if (state is GetSpacialOfferSuccess) {
          print('successsssess');
          productModels = state.products;
        } else if (state is GetSpacialOfferFailure) {
          return CustomErrorWidget(errorMessage: state.error);
        }

        final List<Widget> imageSliders = productModels.offers!
            .map((item) => InkWell(
                  // onTap: () {
                  //   pushScreen(
                  //       // context: context,
                  //       // screen: ProductScreen(
                  //       //   product: item,
                  //       // ));
                  // },
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        child: Stack(
                          children: <Widget>[
                            CustomNetworkImage(
                              width: width * .9,
                              imageUrl: item.images?[0].url ?? '',
                            ),
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
                                  item.price ?? '0',
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
                                      item.name ?? 'Name',
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
            children: productModels.offers!.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: _current == entry.key ? 25.0 : 12,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: _current == entry.key
                          ? BorderRadius.circular(8)
                          : null,
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
      },
    );
  }
}

class CarousleSilderLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[200]!,
      child: Column(
        children: [
          CarouselSlider(
            items: List.generate(5, (index) => buildShimmerItem()),
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerItem() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(24.0),
      ),
      width: double.infinity,
      // height: 200.0,
    );
  }
}
