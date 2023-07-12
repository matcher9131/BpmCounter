import 'dart:math';

import 'package:bpm_counter/extensions/iterable_extensions.dart';

double calcBpmLsm(List<int> elapsedTimesMSec) {
  final x = List<int>.generate(elapsedTimesMSec.length, (index) => index + 1);
  final xMean = (elapsedTimesMSec.length + 1) / 2;
  final yMean = elapsedTimesMSec.average();
  final xVar = x.map((e) => pow(e - xMean, 2)).average();
  // final xVar = x.fold<double>(
  //       0,
  //       (previousValue, element) => previousValue + pow(element - xMean, 2),
  //     ) /
  //     x.length;
  final cov = x.zip(elapsedTimesMSec).map((e) => (e.first - xMean) * (e.second - yMean)).average();
  // final cov = x.zip(elapsedTimesMSec).fold<double>(
  //           0,
  //           (previousValue, element) =>
  //               previousValue + (element.first - xMean) * (element.second - yMean),
  //         ) /
  //     x.length;
  final a = cov / xVar;
  return 60000 / a;
}
