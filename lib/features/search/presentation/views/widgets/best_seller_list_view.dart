import 'package:ar_shopping/features/search/presentation/view_models/fetch_search_books/fetch_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/component/error_widget.dart';
import '../../../../../core/utils/app_router.dart';

import 'product_list_shimmer.dart';
import 'best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchProuductsCubit, FetchSearchProductsState>(
        builder: (context, state) {
      if (state is FetchSearchSuccess) {
        return AnimationLimiter(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.products?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: FadeInAnimation(
                  // verticalOffset: 50.0,
                  child: FadeInAnimation(
                    delay: const Duration(milliseconds: 100),
                    child: InkWell(
                      child: BestSellerItem(
                        productModel: state.products.products![index],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is FetchSearchLoading) {
        return BestSellerProductListShimmer();
      } else if (state is FetchSearchFailure) {
        return CustomErrorWidget(errorMessage: state.error);
      }
      return const Text('');
    });
  }
}
