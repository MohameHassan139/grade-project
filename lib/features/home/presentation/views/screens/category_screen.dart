import 'package:ar_shopping/core/component/custom_body_bacground.dart';
import 'package:ar_shopping/features/home/data/models/category.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/cart_appbar_action.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/product_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../core/component/custom_appbar.dart';
import '../../../../../core/component/error_widget.dart';
import '../../../../../core/function/push_screen.dart';
import '../../../../product_details/presentation/view/product_screen.dart';
import '../../../../search/presentation/views/widgets/best_seller_item.dart';
import '../../../../search/presentation/views/widgets/product_list_shimmer.dart';
import '../../model_view/cubit/sub_category_cubit.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, Key? key}) : super(key: key);

  final Categories category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    var cubit = BlocProvider.of<SubCategoryCubit>(context);
    cubit.getSubCategory(id: widget.category.id ?? 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kBlackColor,
      appBar: CustomAppbar(
        title: widget.category.name,
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: CustomBody(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
              builder: (context, state) {
            if (state is GetSubCategorySuccess) {
              return AnimationLimiter(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.products?.length ?? 0,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          delay: Duration(milliseconds: 120),
                          child: InkWell(
                              onTap: () {
                                pushScreen(
                                    context: context,
                                    screen: ProductScreen(
                                      product: state.products.products![index],
                                    ));
                              },
                              child: BestSellerItem(
                                productModel: state.products.products![index],
                              )),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is GetSubCategoryLoading) {
              return BestSellerProductListShimmer();
            } else if (state is GetSubCategoryFailure) {
              return CustomErrorWidget(errorMessage: state.error);
            }
            return const Text('');
          }),
        ),
      ),
    );
  }
}

enum Filters { popular, recent, sale }
