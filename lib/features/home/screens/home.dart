import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/constants.dart';
import '../../auth/widgets/custom_appbar.dart';
import '../../auth/widgets/custom_body_bacground.dart';
import '../../auth/widgets/gadien_text.dart';
import '../models/movie.dart';
import '../models/news_item.dart';
import '../widgets/carousle_silder.dart';
import '../widgets/masked_image.dart';

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
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomColors.kBlackColor,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: CustomBody(
            bodyHeight: screenHight,
            bodyWidth: screenWidth,
            child: Center(
              child: Column(
                children: [
                  CustomCarousleSlider(
                    news: news,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemCount: newMovies.length,
                    itemBuilder: ((context, index) {
                      String mask;
                      if (index == 0) {
                        mask = Constants.kMaskFirstIndex;
                      } else if (index % 3 == 0) {
                        mask = Constants.kMaskFirstIndex;
                      } else if (index % 2 == 0 || index == 1) {
                        mask = Constants.kMaskCenter;
                      } else {
                        mask = Constants.kMaskLastIndex;
                      }
                      return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          height: 160,
                          width: 142,
                          child: MaskedImage(
                            asset: newMovies[index].moviePoster,
                            mask: mask,
                          ),
                        ),
                      );
                    }),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                  ),
                  const SizedBox(
                    height: 38,
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
