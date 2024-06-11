import 'package:ar_shopping/core/component/error_widget.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/cart_appbar_action.dart';
import 'package:ar_shopping/features/home/presentation/model_view/category/category_cubit.dart';
import 'package:ar_shopping/features/home/presentation/model_view/offer_cubit/home_cubit_cubit.dart';
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
                              imageUrl: state.categories.subCategories![index]
                                  .images!.first.url!,
                              category: state.categories.subCategories![index],
                              imageAlignment: Alignment.topCenter,
                            ),
                            itemCount:
                                state.categories.subCategories?.length ?? 0,
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
     
    );
  }
}

