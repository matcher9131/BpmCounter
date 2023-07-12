import 'package:bpm_counter/extensions/iterable_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("zip test", () {
    final first = [1, 2, 3];
    final second = ["a", "b", "c"];

    final z = first.zip(second).toList();
    for (int i = 0; i < z.length; ++i) {
      expect(z[i], (first: first[i], second: second[i]));
    }
  });

  test("average test", () {
    final data = [2, 5, 7, 8];
    expect(data.average(), 5.5);
  });
}
