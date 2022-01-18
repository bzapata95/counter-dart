import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void handlePress(HandlePress type) {
    switch (type) {
      case HandlePress.decrement:
        if (counter == 0) return;
        counter--;
        break;
      case HandlePress.increment:
        counter++;
        break;
    }
    setState(() {});
  }

  void handlePressRefresh() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(color: Colors.white, fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 10,
      ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clicks counter',
              style: fontSize30,
            ),
            Text(
              '$counter',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActions(
        handlePress: handlePress,
        handlePressRefresh: handlePressRefresh,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function handlePress;
  final Function handlePressRefresh;

  const CustomFloatingActions({
    Key? key,
    required this.handlePress,
    required this.handlePressRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () => handlePress(HandlePress.decrement)),
        FloatingActionButton(
            child: const Icon(Icons.refresh_rounded),
            onPressed: () => handlePressRefresh()),
        FloatingActionButton(
            child: const Icon(Icons.plus_one_outlined),
            onPressed: () => handlePress(HandlePress.increment)),
      ],
    );
  }
}

enum HandlePress { decrement, increment }
