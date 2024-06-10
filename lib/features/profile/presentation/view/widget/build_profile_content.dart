import 'package:ar_shopping/features/profile/presentation/view/widget/data_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/component/custom_network_image.dart';
import '../../../data/models/profile_model.dart';

class BuildProfileContent extends StatelessWidget {
  BuildProfileContent({super.key, required this.model});
  Profile model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 140,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CustomNetworkImage(
              imageUrl: model.user?.image ?? '',
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomUserFledData(text: model.user?.name ?? "name"),
        const SizedBox(height: 20),
        CustomUserFledData(text: model.user?.email ?? "email"),
        const SizedBox(height: 20),
        CustomUserFledData(text: model.user?.phone ?? "phone"),
        const SizedBox(height: 20),
        CustomUserFledData(text: model.user?.address ?? 'address'),
      ],
    );
  }
}
