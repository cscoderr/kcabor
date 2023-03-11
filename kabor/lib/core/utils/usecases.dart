// ignore_for_file: one_member_abstracts

abstract class Usecases<T, P> {
  Future<T> call(P params);
}

abstract class NoParamsUsecases<T> {
  Future<T> call();
}
