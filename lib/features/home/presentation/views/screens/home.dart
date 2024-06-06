import 'package:ar_shopping/core/component/error_widget.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/cart_appbar_action.dart';
import 'package:ar_shopping/features/home/presentation/category/category_cubit.dart';
import 'package:ar_shopping/features/home/presentation/offer_cubit/home_cubit_cubit.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../core/component/custom_body_bacground.dart';
import '../../../data/models/news_item.dart';
import '../widgets/carousle_silder.dart';
import '../../../../../core/component/custom_appbar.dart';
import '../widgets/category_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubitCubit>(context);

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
                CustomCarousleSlider(),
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
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
                    BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        if (state is GetCategorySuccess) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => CategoryTile(
                              imageUrl: manLookRightImageUrl,
                              category: state.categories.categories![index],
                              imageAlignment: Alignment.topCenter,
                            ),
                            itemCount: state.categories.categories?.length ?? 0,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16),
                          );
                        } else if (state is GetCategoryLoading) {
                          // CategoryTileShimmer

                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CategoryTileShimmer(),
                            itemCount: 3,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16),
                          );
                        } else if (state is GetCategoryFailure) {
                          // CategoryTileShimmer

                          return Center(
                            child: CustomErrorWidget(errorMessage: state.error),
                          );
                        } else {
                          return Text('unknown');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        cubit.getSpacialOffer();
      }),
    );
  }
}

const String manLookRightImageUrl =
    'https://th.bing.com/th/id/OIP.ziNAhJV_iUGwYfttQpoD5QHaD3?w=1998&h=1045&rs=1&pid=ImgDetMain';
const String dogImageUrl =
    'https://www.homelane.com/blog/wp-content/uploads/2022/10/drawing-room-wall-tiles-450x313.jpg';
const String womanLookLeftImageUrl =
    'https://th.bing.com/th/id/R.fab962aefd58bd35734b02ef3569712f?rik=FfFsDUZScjERBg&pid=ImgRaw&r=0&sres=1&sresct=1';
