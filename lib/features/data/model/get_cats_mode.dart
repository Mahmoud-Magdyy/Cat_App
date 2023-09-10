import 'package:cat_app/core/database/api/end_points.dart';

class GetCatModel {
  final String id;
  final String url;
  final int width;
  final int height;

  GetCatModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });
  factory GetCatModel.fromJson(Map<String, dynamic> json) {
    return GetCatModel(
      id: json[ApiKeys.id],
      url: json[ApiKeys.url],
      width: json[ApiKeys.width],
      height: json[ApiKeys.height],
    );
  }
}
