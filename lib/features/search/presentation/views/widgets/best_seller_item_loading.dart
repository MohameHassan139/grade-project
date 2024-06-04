import 'package:flutter/material.dart';

class BestSellerItemLoading extends StatelessWidget {
  BestSellerItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 14,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: 20,
                        color: Colors.black,
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 20,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
