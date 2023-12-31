import 'package:dartz/dartz.dart';

import '../../../core/database/api/api_consumer.dart';
import '../../../core/database/api/end_points.dart';
import '../../../core/error/exception.dart';
import '../../../core/services/service_loactor.dart';
import '../model/get_cats_mode.dart';

class CatRepository {
  Future<Either<String, List<GetCatModel>>> getCats() async {
    try {
      final  response = await sl<ApiConsumer>().get(
        EndPoint.images,
      );
      return Right( response.map<GetCatModel>((e)=>GetCatModel.fromJson(e)).toList());
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
