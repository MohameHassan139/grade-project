import 'package:ar_shopping/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/view/widgets/custom_textformfield.dart';
import '../../view_models/fetch_search_books/fetch_search_cubit.dart';

class CustomSearchBody extends StatelessWidget {
  CustomSearchBody({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'search',
              textController: searchController,
              suffix: IconButton(
                onPressed: () {
                  BlocProvider.of<FetchSearchProuductsCubit>(context)
                      .search(category: searchController.text);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              onChange: (text) {
                if (text.isNotEmpty) {
                  BlocProvider.of<FetchSearchProuductsCubit>(context)
                      .search(category: text);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: SearchListView()),
          ],
        ),
      ),
    );
  }
}
