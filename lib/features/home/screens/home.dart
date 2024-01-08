import 'package:ar_shopping/features/home/models/product.dart';
import 'package:ar_shopping/features/home/widgets/cart_appbar_action.dart';
import 'package:ar_shopping/features/home/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../core/component/custom_body_bacground.dart';

import '../models/news_item.dart';
import '../widgets/carousle_silder.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    var listViewPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomColors.kBlackColor,
        appBar: CustomAppbar(
          title: '',
          actions: const [
            CartAppBarAction(),
          ],
        ),
        body: CustomBody(
          bodyHeight: screenHight,
          bodyWidth: screenWidth,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomCarousleSlider(
                    news: news,
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: listViewPadding,
                    children: [
                      Text(
                        'Shop by Category',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: CustomColors.kWhiteColor),
                      ),
                      const SizedBox(height: 16),
                      CategoryTile(
                        imageUrl: manLookRightImageUrl,
                        category: mensCategory,
                        imageAlignment: Alignment.topCenter,
                      ),
                      const SizedBox(height: 16),
                      CategoryTile(
                        imageUrl: womanLookLeftImageUrl,
                        category: womensCategory,
                        imageAlignment: Alignment.topCenter,
                      ),
                      const SizedBox(height: 16),
                      CategoryTile(
                        imageUrl:
                            dogImageUrl, // TODO: Replace with your own image
                        category: petsCategory,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

const String manLookRightImageUrl =
    'https://th.bing.com/th/id/OIP.ziNAhJV_iUGwYfttQpoD5QHaD3?w=1998&h=1045&rs=1&pid=ImgDetMain';
const String dogImageUrl =
    'https://www.homelane.com/blog/wp-content/uploads/2022/10/drawing-room-wall-tiles-450x313.jpg';
const String womanLookLeftImageUrl =
    'https://th.bing.com/th/id/R.fab962aefd58bd35734b02ef3569712f?rik=FfFsDUZScjERBg&pid=ImgRaw&r=0&sres=1&sresct=1';
