import 'package:bpm_counter/util/bpm_counter_lsm.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("calcBpmLsm test", () {
    final data = [
      383,
      752,
      1152,
      1536,
      1936,
      2336,
      2736,
      3136,
      3543,
      3935,
      4351,
      4752,
      5135,
      5543,
      5952,
      6352,
      6751,
      7143,
      7559,
      7951,
      8375,
      8775,
      9167,
      9551,
      9935,
      10359,
      10752,
      11159,
      11552,
      11968,
      12368,
      12759,
      13143,
      13535,
      13959,
      14375,
      14783,
      15175,
      15575,
      15968,
      16375,
      16783,
      17183,
      17575,
      17959,
      18352,
      18759,
      19168,
      19543,
      19935
    ];

    double bpm = calcBpmLsm(data);
    // I cannot understand why number.round() has no parameter of specifying the number of digits...
    expect(bpm.toStringAsFixed(3), "149.830");
  });
}
