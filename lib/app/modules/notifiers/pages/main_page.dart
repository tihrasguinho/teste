import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final counter = Counter();
  final progress = Progress();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.maxFinite),
          Expanded(child: SizedBox()),
          ValueListenableBuilder(
            valueListenable: progress,
            builder: (_, __, ___) {
              return Text(
                progress.value <= 0.0
                    ? '0.00'
                    : progress.value.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headline1,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () => progress.increment(),
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () => progress.reset(),
                child: Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: () => progress.decrement(),
                child: Icon(Icons.remove),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          ValueListenableBuilder<double>(
            valueListenable: progress,
            builder: (_, value, child) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 52,
              );
            },
          ),
        ],
      ),
    );
  }
}

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  void increment() => value++;
  void decrement() => value > 0 ? value-- : null;
}

class Progress extends ValueNotifier<double> {
  Progress() : super(0.0);

  void increment() => value <= 0.99 ? value = value + 0.01 : null;
  void decrement() => value > 0.0 ? value = value - 0.01 : null;
  void reset() => value = 0.0;
}
