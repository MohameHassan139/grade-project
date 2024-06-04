import 'package:ar_shopping/features/search/presentation/views/widgets/best_seller_book_list_shimmer.dart';
import 'package:ar_shopping/features/search/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/component/error_widget.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

import '../../view_models/fetch_search_books/fetch_search_books_cubit.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchProuductsCubit, FetchSearchProductsState>(
        builder: (context, state) {
      if (state is FetchSearchSuccess) {
        if (state.products.items != null) {
          return ListView.separated(
            itemCount: state.products.items?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoutNamed.bookDetails,
                    extra: state.products.items![index]);
              },
              child: BestSellerItem(
                productModel: state.products.items![index],
              ),
            ),
          );
        }
        return const Center(
            child: Text(
          'No Reslute',
          style: Styles.textStyle30,
        ));
      } else if (state is FetchSearchLoading) {
        return const BestSellerProductListShimmer();
      } else if (state is FetchSearchFailure) {
        return CustomErrorWidget(errorMessage: state.error);
      }
      return const Center(
          child: Text(
        'Welcome',
        style: Styles.textStyle30,
      ));
    });
  }
}
