import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookItemShimmer extends StatelessWidget {
  const BookItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 120,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 15, color: Colors.white),
                SizedBox(height: 10),
                Container(height: 15, width: 150, color: Colors.white),
                SizedBox(height: 10),
                Container(height: 15, width: 100, color: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }
}