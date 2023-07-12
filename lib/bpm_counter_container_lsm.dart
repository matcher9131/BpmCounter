import 'package:bpm_counter/bpm_counter_presenter.dart';
import 'package:bpm_counter/util/bpm_counter_lsm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BpmCounterContainerLsm extends HookWidget {
  BpmCounterContainerLsm({Key? key}) : super(key: key);

  final sw = useState<Stopwatch>(Stopwatch());
  final elapsedTimesMSec = useState<List<int>>([]);
  final isRunning = useState<bool>(false);

  void handleTapBeat() {
    if (isRunning.value) {
      final latestElapsedTime = sw.value.elapsedMilliseconds;
      elapsedTimesMSec.value = [...elapsedTimesMSec.value, latestElapsedTime];
    } else {
      sw.value.start();
      isRunning.value = true;
    }
  }

  void handleTapReset() {
    sw.value.stop();
    sw.value.reset();
    isRunning.value = false;
    elapsedTimesMSec.value = [];
  }

  @override
  Widget build(BuildContext context) {
    final bpmDisplay = !sw.value.isRunning
        ? 'Tap Beat to Start'
        : elapsedTimesMSec.value.isEmpty
            ? 'Counting is started'
            : '${calcBpmLsm(elapsedTimesMSec.value).toStringAsFixed(2)} BPM';
    return BpmCounterPresenter(
      bpmDisplay: bpmDisplay,
      handleTapBeat: handleTapBeat,
      handleTapReset: handleTapReset,
    );
  }
}
