import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/get_cats_mode.dart';
import '../../data/reposatiory/get_cats_repo.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit(this.catRepo) : super(CatInitial());
  final CatRepository catRepo;
  GetCatModel? getCatModel;
  List<dynamic> cats = [];
  // getCats() async {
  //   emit(GetCatsLoadingState());
  //   var data = [];

  //   final response = await Dio()
  //       .get(
  //           'https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee')
  //       .then(
  //     (value) {
  //       data = value.data;
  //       cats = data.map((e) => GetCatModel.fromJson(e)).toList();
  //       // print(albums[0].id);
  //       emit(GetCatsSuccessState());
  //     },
  //   ).catchError(
  //     (e) {
  //       print(e.toString());
  //       emit(GetCatsErrorState());
  //     },
  //   );
  // }
  void getCats() async {
    emit(GetCatsLoadingState());
    final result = await catRepo.getCats();
    result.fold(
        (l) => emit(GetCatsErrorState()),
         (r) {
          cats=r;
           emit(GetCatsSuccessState());
         });
  }
}
