import 'package:bpm_counter/bpm_counter_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BpmCounterContainerRegular extends HookWidget {
  BpmCounterContainerRegular({Key? key}) : super(key: key);

  final sw = useState<Stopwatch>(Stopwatch());
  final elapsedMSec = useState<int>(0);
  final count = useState<int>(-1);

  void handleTapBeat() {
    if (sw.value.isRunning) {
      elapsedMSec.value = sw.value.elapsedMilliseconds;
    } else {
      sw.value.start();
    }
    ++count.value;
  }

  void handleTapReset() {
    sw.value.stop();
    sw.value.reset();
    count.value = -1;
    elapsedMSec.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final bpmDisplay = !sw.value.isRunning
        ? 'Tap Beat to Start'
        : count.value == 0
            ? 'Counting is started'
            : '${(60000 * count.value / elapsedMSec.value).toStringAsFixed(2)} BPM';
    return BpmCounterPresenter(
      bpmDisplay: bpmDisplay,
      handleTapBeat: handleTapBeat,
      handleTapReset: handleTapReset,
    );
  }
}
