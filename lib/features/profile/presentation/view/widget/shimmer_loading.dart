import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmerLoading extends StatelessWidget {
  const ProfileShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.topCenter,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 140,
              width: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildShimmerText(),
        const SizedBox(height: 20),
        _buildShimmerText(),
        const SizedBox(height: 20),
        _buildShimmerText(),
        const SizedBox(height: 20),
        _buildShimmerText(),
      ],
    );
  }

  Widget _buildShimmerText() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        height: 37,
      ),
    );
  }
}
