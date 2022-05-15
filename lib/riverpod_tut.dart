import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someapp/models/create_profile_state.dart';

final valueProvider = Provider<int>(
  (ref) {
    return 36;
  },
);

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

final streamProvider = StreamProvider<int>((ref) {
  return Stream.fromIterable([36, 72]);
});

class RiverPodTut extends ConsumerWidget {
  const RiverPodTut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. watch the counterStateProvider
    final counter = ref.watch(counterStateProvider);

    ref.listen<StateController<int>>(counterStateProvider.state,
        (previous, current) {
      // note: this callback executes when the provider value changes,
      // not when the build method is called
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Value is ${current.state} :: ${current.state == previous!.state}'),
          duration: const Duration(milliseconds: 500),
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Text(
          // 2. use the counter value
          'Value: $counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // access the provider via ref.read(), then increment its state.
        onPressed: () => ref.read(counterStateProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RiverpodTutSF extends ConsumerStatefulWidget {
  const RiverpodTutSF({Key? key}) : super(key: key);

  @override
  _RiverpodTutSFState createState() => _RiverpodTutSFState();
}

class _RiverpodTutSFState extends ConsumerState<RiverpodTutSF> {
  final state = const CreateProfileState.error('Something went wrong');

  @override
  void initState() {
    super.initState();
    // 3. use ref.read() in the widget life-cycle methods

    final value = ref.read(valueProvider);
    log("$value");
  }

  @override
  Widget build(BuildContext context) {
    // 3. use ref.watch() to get the value of the provider
    final value = ref.watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value: $value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

class RiverPodStream extends ConsumerWidget {
  const RiverPodStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamAsyncValue = ref.watch(streamProvider);
    // final futureAsyncValue = ref.watch(futureProvider); // same syntax
    return Scaffold(
      body: Center(
        child: streamAsyncValue.when(
          data: (data) => Text('Value: $data'),
          loading: () => const CircularProgressIndicator(),
          error: (e, st) => Text('Error: $e'),
        ),
      ),
    );
  }
}
