import 'package:cat_app/features/presentation/cubit/cat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/services/service_loactor.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp( BlocProvider(
    create: (context) => sl<CatCubit>()..getCats(),
    child: const MyApp(),
  ));
}
