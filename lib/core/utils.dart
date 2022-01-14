Iterable<T> intersperseCore<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}

extension IntersperseExtenstion<T> on Iterable<T> {
  Iterable<T> intersperse(T element) {
    return intersperseCore(element, this);
  }
}
