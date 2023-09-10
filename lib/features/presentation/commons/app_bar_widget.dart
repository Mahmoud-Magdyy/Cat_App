import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../cubit/cat_cubit.dart';

AppBar customAppBar(BuildContext context) {
    return AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CatCubit>(context).getCats();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: AppColors.white,
                    ))
              ],
              backgroundColor: AppColors.blue,
              title:  const Text(
                AppStrings.appName,
                style: TextStyle(color: AppColors.white),
              ),
              bottom: const TabBar(
                indicatorColor: AppColors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.white,
                tabs: [
                  Tab(text: AppStrings.cats),
                ],
              ),
            );
  }

