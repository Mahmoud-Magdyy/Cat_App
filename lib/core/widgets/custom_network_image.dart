import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconSize;
  final double? padding;
  final String imageUrl;
  final BoxFit? fit;
  const CustomNetworkImage({
    super.key,
    this.height,
    this.width,
    this.iconSize,
    this.padding,
    required this.imageUrl,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: CachedNetworkImage(
        fit: fit,
        width: width,
        height: height,
        imageUrl: imageUrl,
        
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
