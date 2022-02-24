import 'package:flutter/material.dart';
import 'package:task/Screens/HeightWeightInputForm.dart';

class Result extends StatefulWidget {
  const Result({Key? key, required this.height, required this.weight}) : super(key: key);

  final int height;
  final int weight;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int get weight => widget.weight;

  int get height => widget.height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Result'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Result',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Height : $height',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Weight : $weight',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Multiply : ${height * weight}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Sum : ${height + weight}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HeightWeightInputForm())),
        label: const Text(
          'Reset',
          style: TextStyle(fontSize: 20),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        extendedPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
      ),
    );
  }
}
