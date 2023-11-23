import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textController = TextEditingController();
  final List<int> numbers = [];
  int? max;
  int? min;
  double? ave;
  int? sum;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Analyser'),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(
              hintText: 'Enter a number',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                final number = int.parse(textController.text);
                numbers.add(number);
                textController.clear();
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: const Text(
                  'Add the number',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                max = findMaximum(numbers);
                min = findMinimum(numbers);
                sum = calculateSum(numbers);
                ave = calculateAverage(numbers);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: const Text(
                  'Analyse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        numbers.isNotEmpty
            ? Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Maximum number = $max'),
                    Text('Minimum number = $min'),
                    Text('Sum of numbers = $sum'),
                    Text('Average of numbers = $ave'),
                  ],
                ),
              )
            : const Text('')
      ]),
    );
  }

  int findMaximum(List<int> numbers) {
    var max = numbers[0];
    for (var i = 0; i < numbers.length; ++i) {
      if (numbers[i] > max) {
        max = numbers[i];
      }
    }
    return max;
  }

  int findMinimum(List<int> numbers) {
    var max = numbers[0];
    for (var i = 0; i < numbers.length; ++i) {
      if (numbers[i] < max) {
        max = numbers[i];
      }
    }
    return max;
  }

  int calculateSum(List<int> numbers) {
    var sum = 0;
    for (var i = 0; i < numbers.length; ++i) {
      sum += numbers[i];
    }
    return sum;
  }

  double calculateAverage(List<int> numbers) {
    var sum = 0;
    for (var i = 0; i < numbers.length; ++i) {
      sum += numbers[i];
    }
    return sum / numbers.length;
  }
}
