import 'package:cat_app/core/utils/app_colors.dart';
import 'package:cat_app/features/presentation/cubit/cat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/widgets/custom_network_image.dart';
import '../../../core/widgets/custom_tooltip_image.dart';
import '../commons/app_bar_widget.dart';
import '../cubit/cat_state.dart';

class GetCatScreen extends StatelessWidget {
  const GetCatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CatCubit, CatState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 1,
            child: Scaffold(
              backgroundColor: AppColors.grey,
              appBar: customAppBar(context),
              body: BlocBuilder<CatCubit, CatState>(
                builder: (context, state) {
                  return state is GetCatsLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : TabBarView(children: [
                          Container(
                            margin: const EdgeInsets.all(12),
                            child: MasonryGridView.builder(
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              itemCount: BlocProvider.of<CatCubit>(context)
                                  .cats
                                  .length,
                              itemBuilder: (context, i) {
                                return CustomImageTooltip(
                                  message: BlocProvider.of<CatCubit>(context)
                                      .cats[i]['id'],
                                  child: CustomNetworkImage(
                                      imageUrl:
                                          BlocProvider.of<CatCubit>(context)
                                              .cats[i]['url']),
                                );
                              },
                            ),
                          ),
                        ]);
                  // : Text(
                  //     BlocProvider.of<CatCubit>(context).cats[1]['id'],
                  //     style: const TextStyle(fontSize: 25),
                  //   );
                },
              ),
            ),
          );
        },
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
