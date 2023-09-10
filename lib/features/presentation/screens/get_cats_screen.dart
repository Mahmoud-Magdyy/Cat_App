import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_app/core/utils/app_colors.dart';
import 'package:cat_app/core/utils/app_strings.dart';
import 'package:cat_app/features/presentation/cubit/cat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cat_state.dart';

class GetCatScreen extends StatelessWidget {
  const GetCatScreen({super.key});
  // final List<String> cats = [
  //   '1',
  //   '1',
  //   '1',
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          title: const Text(
            AppStrings.appName,
            style: TextStyle(color: AppColors.white),
          ),
        ),
        body: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            return state is GetCatsLoadingState
                ? const CircularProgressIndicator()
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,),
                        itemCount: BlocProvider.of<CatCubit>(context).cats.length,
                    itemBuilder: (context, i) {
                      return Tooltip(
                        message:BlocProvider.of<CatCubit>(context).cats[i]
                            ['id'],
                        child: CachedNetworkImage(
                    imageUrl: BlocProvider.of<CatCubit>(context).cats[i]
                            ['url'],
                      )); 
                    },
                  );
            // : Text(
            //     BlocProvider.of<CatCubit>(context).cats[1]['id'],
            //     style: const TextStyle(fontSize: 25),
            //   );
          },
        ),
      ),
    );
  }
}
// }TabBarView(children: [
//               Container(
//                 margin: const EdgeInsets.all(12),
//                 child: GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 12),
//                     itemBuilder: (context, i) {
//                       return ListView.builder(itemBuilder: (context, i) {
//                         return CachedNetworkImage(
//                           imageUrl:
//                               "https://30.media.tumblr.com/tumblr_lriwbxezUf1qzv52ko1_250.jpg",
//                           progressIndicatorBuilder:
//                               (context, url, downloadProgress) =>
//                                   CircularProgressIndicator(
//                                       value: downloadProgress.progress),
//                           errorWidget: (context, url, error) =>
//                               const Icon(Icons.error),
//                         );
//                       });
//                     }),
//               )
//             ]);
