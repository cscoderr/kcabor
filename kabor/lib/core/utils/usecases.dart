abstract class Usecases<T, P> {
  Future<void> call(P params);
}
