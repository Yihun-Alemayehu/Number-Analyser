import 'package:flutter/material.dart';
import 'package:number_analyser/Components/my_button.dart';
import 'package:number_analyser/Components/text.dart';

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
  int? max, min, sum;
  double? ave;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Input TextField
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: 'Enter a number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // add the number and analyse buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                onPressed: addToList,
                text: 'Add the number',
              ),
              MyButton(
                onPressed: assignValue,
                text: 'Analyse',
              ),
            ],
          ),

          // Refresh button
          MyButton(
            onPressed: refresh,
            text: 'Refresh',
          ),

          // Output Text box
          numbers.isNotEmpty
              ? Container(
                  height: 120,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[300],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(text: 'Maximum number = $max'),
                      MyText(text: 'Minimum number = $min'),
                      MyText(text: 'Sum of numbers = $sum'),
                      MyText(text: 'Average of numbers = $ave'),
                    ],
                  ),
                )
              : const Text(''),
        ],
      ),
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

  void refresh() {
    numbers.clear();
  }

  void assignValue() {
    setState(() {
      max = findMaximum(numbers);
      min = findMinimum(numbers);
      sum = calculateSum(numbers);
      ave = calculateAverage(numbers);
    });
  }

  void addToList() {
    try {
      final number = int.parse(textController.text);
      numbers.add(number);
      textController.clear();
    } catch (e) {
      const AlertDialog(
        title: Text('Error'),
        content: Text('An Error has occured!'),
      );
    }
  }
}
