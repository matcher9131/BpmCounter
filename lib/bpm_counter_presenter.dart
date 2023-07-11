import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const buttonWidth = 200.0;
const buttonHeight = 100.0;

class BpmCounterPresenter extends HookWidget {
  const BpmCounterPresenter({
    Key? key,
    required this.bpmDisplay,
    required this.handleTapBeat,
    required this.handleTapReset,
  }) : super(key: key);

  final String bpmDisplay;
  final void Function() handleTapBeat;
  final void Function() handleTapReset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Text(
            bpmDisplay,
            style: Theme.of(context).textTheme.headline2,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: handleTapBeat,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(buttonWidth, buttonHeight),
              //shape: const CircleBorder(),
            ),
            child: Text(
              'Beat',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: handleTapReset,
            child: Text(
              'Reset',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
