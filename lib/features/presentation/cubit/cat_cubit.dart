import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/get_cats_mode.dart';
import '../../data/reposatiory/get_cats_repo.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit(this.catRepo) : super(CatInitial());
  final CatRepository catRepo;
  GetCatModel? getCatModel;
  List<dynamic> cats = [];

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
