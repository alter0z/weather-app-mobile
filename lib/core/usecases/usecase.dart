abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

abstract class UseCaseWithParam<T, Type, Params> {
  Future<Type> call(T param, {Params params});
}

abstract class UseCaseWithParams<P0, P1, Type, Params> {
  Future<Type> call(P0 po, P1 p1, {Params params});
}