import 'package:bpm_counter/bpm_counter_container_regular.dart';
import 'package:bpm_counter/bpm_counter_presenter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BPMカウンター'),
        ),
        body: BpmCounterContainerRegular(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            // TODO: implementation
          },
          child: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
