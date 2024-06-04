import 'package:ar_shopping/core/component/custom_body_bacground.dart';
import 'package:flutter/material.dart';

import 'widgets/search_body_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(child: CustomSearchBody()),
    );
  }
}
