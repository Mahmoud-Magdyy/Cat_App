
sealed class CatState {}

final class CatInitial extends CatState {}
final class GetCatsLoadingState extends CatState {}
final class GetCatsSuccessState extends CatState {}
final class GetCatsErrorState extends CatState {}
