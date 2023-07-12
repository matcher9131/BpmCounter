extension IterableExtensions<T> on Iterable<T> {
  Iterable<({T first, U second})> zip<U>(Iterable<U> second) sync* {
    final itrFirst = iterator;
    final itrSecond = second.iterator;
    while (itrFirst.moveNext() && itrSecond.moveNext()) {
      yield (first: itrFirst.current, second: itrSecond.current);
    }
  }
}

extension IterableNumberExtensions<T extends num> on Iterable<T> {
  double average() {
    var sum = (T == int ? 0 : 0.0) as T;
    int count = 0;
    for (final element in this) {
      sum = (sum + element) as T;
      ++count;
    }
    return sum / count;
  }
}
