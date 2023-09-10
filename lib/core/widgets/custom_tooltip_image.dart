
import 'package:flutter/material.dart';

class CustomImageTooltip extends StatelessWidget {

  const CustomImageTooltip({
    super.key, this.message, this.child,
  });
  final String? message;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: child,
    ));
  }
}



// BlocProvider.of<CatCubit>(context)
//                   .cats[i]['url']