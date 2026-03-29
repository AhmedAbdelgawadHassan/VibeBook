import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.bookImage,
    this.borderRadius,
  });


  static const double _radius = 16;
  final String bookImage;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final imageBorderRadius =
        borderRadius ?? BorderRadius.circular(_radius);
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Material(
        color: Colors.transparent,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: imageBorderRadius,
         
          ),
          child: ClipRRect(
            borderRadius: imageBorderRadius,
            child: Stack(
              fit: StackFit.expand,
              children: [
               CachedNetworkImage(  // <-- CachedNetworkImage package used to Cache the image in the memory and handle the loading and error states
                imageUrl: bookImage,
                errorWidget: (context, url, error) => const Icon(Icons.error),/// <-- If the image fails to load or url has Problem , an error icon will be displayed
                placeholder: (context, url) => Center(child: const CircularProgressIndicator()),/// <-- If the image is loading , a circular progress indicator will be displayed
                fit: BoxFit.fill,
                ),
               
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                    borderRadius: imageBorderRadius,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
