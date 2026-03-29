import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key, required this.bookImage,
  });


  static const double _radius = 16;
  final String bookImage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Material(
        color: Colors.transparent,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
         
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_radius),
            child: Stack(
              fit: StackFit.expand,
              children: [
               CachedNetworkImage(  // <-- CachedNetworkImage package used to Cache the image in the memory and handle the loading and error states
                imageUrl: bookImage,
                errorWidget: (context, url, error) => const Icon(Icons.error),/// <-- If the image fails to load or url has Problem , an error icon will be displayed
                placeholder: (context, url) => Center(child: const CircularProgressIndicator()),/// <-- If the image is loading , a circular progress indicator will be displayed
                fit: BoxFit.cover,
                ),
               
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                    borderRadius: BorderRadius.circular(_radius),
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
