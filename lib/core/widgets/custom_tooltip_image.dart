import 'package:flutter/material.dart';

import '../../features/data/model/get_cats_mode.dart';
import 'custom_network_image.dart';

class CustomImageTooltip extends StatelessWidget {
  const CustomImageTooltip({
    super.key,
    required this.cat,
    
  });
  final GetCatModel cat;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: cat.id,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          child: CustomNetworkImage(imageUrl: cat.url),
        ));
  }
}



// BlocProvider.of<CatCubit>(context)
//                   .cats[i]['url']