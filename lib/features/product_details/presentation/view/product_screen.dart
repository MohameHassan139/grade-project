

import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/core/component/custom_body_bacground.dart';
import 'package:ar_shopping/core/component/custom_botton.dart';
import 'package:ar_shopping/core/component/custom_network_image.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/cart_appbar_action.dart';
import 'package:ar_shopping/core/component/custom_appbar.dart';
import 'package:ar_shopping/features/product_details/presentation/view/widgets/feedback_list.dart';
import 'package:ar_shopping/features/product_details/presentation/view/widgets/model_viewer.dart';
import 'package:ar_shopping/features/product_details/presentation/view/widgets/rate_stare.dart';
import 'package:flutter/material.dart';

import '../../../card/data/models/order_item.dart';
import '../../../card/presentation/view/widget/cart_list.dart';
import 'widgets/model_view_bottom.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;
  Cart cart = Cart();
  @override
  void initState() {
    selectedImageUrl = (product.images?.firstOrNull?.url ?? "");
    selectedSize = product.size?[0] ?? "";
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  int modeView = 1;
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    List<Widget> imagePreviews = product.images!
        .map(
          (image) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => setSelectedImageUrl(image.url ?? ''),
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: selectedImageUrl == image.url
                      ? Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.75)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomNetworkImage(
                  imageUrl: image.url ?? '',
                ),
              ),
            ),
          ),
        )
        .toList();

    List<Widget> sizeSelectionWidgets = product.size
            ?.map(
              (s) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    setSelectedSize(s);
                  },
                  child: Container(
                    height: 42,
                    width: 80,
                    decoration: BoxDecoration(
                      color: selectedSize == s
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      border: Border.all(
                        color: Colors.grey[350]!,
                        width: 1.25,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        s,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: selectedSize == s
                                ? Colors.white
                                : Colors.grey[350]),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList() ??
        [];

    Widget objectView(int x) {
      // ignore: curly_braces_in_flow_control_structures
      if (x == 1) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomNetworkImage(
                    imageUrl: selectedImageUrl ?? '',
                    // width: double.infinity,
                    height: MediaQuery.of(context).size.height * .35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagePreviews,
                  ),
                ],
              ),
            ),
          ],
        );
      } else if (x == 3) {
        return const Center(
          child: Text('Soon wait....'),
        );
      }
      return ModelView();
    }

    return Scaffold(
      backgroundColor: CustomColors.kBlackColor,
      appBar: CustomAppbar(
        title: '',
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: CustomBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .35,
                color: CustomColors.kGreyBackground,
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: objectView(modeView),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: product.object == null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ModelViewButtom(
                              indexButtom: 1,
                              selectedModel: modeView,
                              onTap: () {
                                setState(() {
                                  modeView = 1;
                                });
                              },
                              text: 'Image view',
                            ),
                            ModelViewButtom(
                              indexButtom: 2,
                              selectedModel: modeView,
                              onTap: () {
                                setState(() {
                                  modeView = 2;
                                });
                              },
                              text: '3d view',
                            ),
                            ModelViewButtom(
                              indexButtom: 3,
                              selectedModel: modeView,
                              onTap: () {
                                setState(() {
                                  modeView = 3;
                                });
                              },
                              text: 'AR view',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.name ?? "name",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: CustomColors.kGreyBackground),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: CustomColors.kCyanColor,
                                ),
                          ),
                          Spacer(),
                          CustomRate(),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        product.description ??
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            height: 1.5, color: CustomColors.kWhiteColor),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      if (sizeSelectionWidgets.isNotEmpty) ...[
                        Text(
                          'Size',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: CustomColors.kGreenColor),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: sizeSelectionWidgets,
                          ),
                        ),
                      ],
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomBottom(
                          screenHight: screenHight,
                          onTap: () {
                            setState(() {
                              cart.add(
                                OrderItem(
                                  product: product,
                                  selectedSize: selectedSize,
                                ),
                              );
                            });
                          },
                          text: 'Add to Cart',
                        ),
                      ),
                      Text(
                        'feedbacks',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: CustomColors.kGreyBackground),
                      ),
                      FeedbackList(
                        comments: product.comments ?? [],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
