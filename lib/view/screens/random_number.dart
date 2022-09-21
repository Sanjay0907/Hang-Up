import 'package:flutter/material.dart';
import 'dart:math';

class RandomNumberGenerator extends StatelessWidget {
  RandomNumberGenerator({Key? key}) : super(key: key);
  Set<int> setOfInts = Set();

  addToList(int max, int tot) {
    List<int> randomNumbers = [];
    print('Empty List');
    int i = 0;

    // return randomNumbers;
    print('numbers added');
    var randomPicker = List<int>.generate(max, (i) => i + 1)..shuffle();
    print(randomPicker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Random no. generator'),
            ElevatedButton(
                onPressed: () => addToList(10, 10),
                child: Text('Print Random List'))
          ],
        ),
      ),
    );
  }
}
